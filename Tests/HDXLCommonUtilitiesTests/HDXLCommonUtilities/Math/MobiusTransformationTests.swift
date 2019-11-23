//
//  MobiusTransformationTests.swift
//

import XCTest
@testable import HDXLCommonUtilities
import Numerics

class MobiusTransformationTests: XCTestCase {
  
  fileprivate func prepareTestValues<R:Real>(maximumComponentMagnitude maximumMagnitude: Int) -> [Complex<R>] {
    precondition(maximumMagnitude >= 0)
    let testRange = -maximumMagnitude...maximumMagnitude
    var testValues: [Complex<R>] = CartesianProduct(testRange,testRange).asTuples().map() {
      Complex(R($0),R($1))
    }
    testValues.append(.infinity)
    return testValues
  }

  let epsilonForDoubleComplex: Double = 0.0001
  let epsilonForFloatComplex: Float = 0.0001

  func closeEnough(
    _ x: Complex<Double>,
    _ y: Complex<Double>) -> Bool {
    return x.hasInfinityNormDistance(
      strictlyLessThan: self.epsilonForDoubleComplex,
      to: y
    )
  }
  
  func closeEnough(
    _ x: Complex<Float>,
    _ y: Complex<Float>) -> Bool {
    return x.hasInfinityNormDistance(
      strictlyLessThan: self.epsilonForFloatComplex,
      to: y
    )
  }

  let epsilonForDoubleTransforms: Double = 0.0001
  let epsilonForFloatTransforms: Float = 0.0001
  
  func closeEnough(
    _ x: MobiusTransformation<Double>,
    _ y: MobiusTransformation<Double>) -> Bool {
    return x.hasInfinityNormDistance(
      strictlyLessThan: self.epsilonForDoubleTransforms,
      to: y
    )
  }

  func closeEnough(
    _ x: MobiusTransformation<Float>,
    _ y: MobiusTransformation<Float>) -> Bool {
    return x.hasInfinityNormDistance(
      strictlyLessThan: self.epsilonForFloatTransforms,
      to: y
    )
  }
  
  // was this
  // -5...5 => 11
  // => 121 distinct z
  // => add infinity => 122
  // => ~ 122 * 121 * 120 = 1771440 triples (with repeats, but we *want* those, lol)
  // => 1771440 * 1771440 possible sextubles, aka AIN'T NEVER GONNA GET DONE
  //
  // dropping => 3
  //
  // -3...3 => 7
  // => 49 distinct z
  // => add infinity => 50
  // => ~ 50 * 49 * 48 = 117600 triples (with repeats, but we still want those)
  // => 117600 * 117600 = 13,829,760,000 // LOL, sigh, even with 24 cores ain't never gonna git done
  //
  // => -2...2 => 5
  // => 25 distinct z
  // => add infinity => 26
  // => ~ 26 * 25 * 24 = 15600 triples (with repeats, but we *still* want those)
  // => 15600 * 15600 = 243,360,000
  // ^ that's a lot, but it's into the "well, i guess i need to go to the store anyways" range
  //
  // ...and I can always run tests in parallel with multiple "base points" to
  // test it at higher sizes within some painful-but-feasible time frame
  //
  let depthForTesting: Int = 2
  
  lazy var exampleComplexFloats: [Complex<Float>] = self.prepareTestValues(
    maximumComponentMagnitude: self.depthForTesting
  )
  lazy var exampleComplexDoubles: [Complex<Double>] = self.prepareTestValues(
    maximumComponentMagnitude: self.depthForTesting
  )

  lazy var distinctComplexFloatTriples = CartesianProduct(
    self.exampleComplexFloats,
    self.exampleComplexFloats,
    self.exampleComplexFloats
  ).asTuples().lazy.filter({ allArgumentsDistinct($0, $1, $2) })

  lazy var distinctComplexDoubleTriples = CartesianProduct(
    self.exampleComplexDoubles,
    self.exampleComplexDoubles,
    self.exampleComplexDoubles
  ).asTuples().lazy.filter({ allArgumentsDistinct($0, $1, $2) })
  
  
  lazy var exampleFloatZsToWs = CartesianProduct(
    self.distinctComplexFloatTriples,
    self.distinctComplexFloatTriples
  ).asTuples().lazy.filter() {
    countOfTrue(
      $0.0 == $1.0,
      $0.1 == $1.1,
      $0.2 == $1.2
    ) <= 2
  }

  lazy var exampleDoubleZsToWs = CartesianProduct(
    self.distinctComplexDoubleTriples,
    self.distinctComplexDoubleTriples
  ).asTuples().lazy.filter() {
    countOfTrue(
      $0.0 == $1.0,
      $0.1 == $1.1,
      $0.2 == $1.2
    ) <= 2
  }

  func testExampleDoubleTriples() {
    self.haltingOnFirstError {
      for (z1,z2,z3) in self.distinctComplexDoubleTriples {
        XCTAssertTrue(allArgumentsDistinct(z1, z2, z3))
        XCTAssertNotEqual(z1,z2)
        XCTAssertNotEqual(z1,z3)
        XCTAssertNotEqual(z2,z3)
      }
    }
  }

  func testExampleFloatTriples() {
    self.haltingOnFirstError {
      for (z1,z2,z3) in self.distinctComplexDoubleTriples {
        XCTAssertTrue(allArgumentsDistinct(z1, z2, z3))
        XCTAssertNotEqual(z1,z2)
        XCTAssertNotEqual(z1,z3)
        XCTAssertNotEqual(z2,z3)
      }
    }
  }
  
  func apply<Representation:Real>(
    _ transformation: MobiusTransformation<Representation>,
    to value: Complex<Representation>) -> Complex<Representation> {
    return transformation.applyWithFudging(
      to: value,
      fudgeFactor: (Representation(1)/Representation(10000))
    )
  }
  
  func testBizarreFailingCase() {
    
    let zs = (Complex<Double>(0.0, 0.0),Complex<Double>(0.0, 1.0),Complex<Double>(0.0, 2.0))
    let ws = (Complex<Double>(0.0, 0.0),Complex<Double>(0.0, 1.0),Complex<Double>(0.0, 3.0))
    
    let transform = MobiusTransformation<Double>(
      sending: zs,
      to: ws
    )
    
    let inverseTransform = MobiusTransformation<Double>(
      sending: ws,
      to: zs
    )

    XCTAssertTrue(
      self.closeEnough(
        self.apply(
          transform,
          to: zs.0
        ),
        ws.0
      ),
      """
      `transform` \(transform.debugDescription) round-trip failed @ pair 1:
      - z1: \(zs.0.debugDescription)
      - w1: \(ws.0.debugDescription)
      - result: \(self.apply(transform, to: zs.0).debugDescription)
      
      ...for original triples:
      - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )
    XCTAssertTrue(
      self.closeEnough(
        self.apply(
          transform,
          to: zs.1
        ),
        ws.1
      ),
      """
      `transform` \(transform.debugDescription) round-trip failed @ pair 2:
      - z2: \(zs.1.debugDescription)
      - w2: \(ws.1.debugDescription)
      - result: \(self.apply(transform, to: zs.1).debugDescription)
      
      ...for original triples:
      - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )
    XCTAssertTrue(
      self.closeEnough(
        self.apply(
          transform,
          to: zs.2
        ),
        ws.2
      ),
      """
      `transform` \(transform.debugDescription) round-trip failed @ pair 3:
      - z3: \(zs.2.debugDescription)
      - w3: \(ws.2.debugDescription)
      - result: \(self.apply(transform, to: zs.2).debugDescription)
      
      ...for original triples:
      - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )
    
    XCTAssertTrue(
      self.closeEnough(
        self.apply(
          inverseTransform,
          to: ws.0
        ),
        zs.0
      ),
      """
      `inverseTransform` \(inverseTransform.debugDescription) round-trip failed @ pair 1:
      - z1: \(zs.0.debugDescription)
      - w1: \(ws.0.debugDescription)
      - result: \(self.apply(inverseTransform, to: ws.0).debugDescription)
      
      ...for original triples:
      - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )
    XCTAssertTrue(
      self.closeEnough(
        self.apply(
          inverseTransform,
          to: ws.1
        ),
        zs.1
      ),
      """
      `inverseTransform` \(inverseTransform.debugDescription) round-trip failed @ pair 2:
      - z2: \(zs.1.debugDescription)
      - w2: \(ws.1.debugDescription)
      - result: \(self.apply(inverseTransform, to: ws.1).debugDescription)
      
      ...for original triples:
      - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )
    XCTAssertTrue(
      self.closeEnough(
        self.apply(
          inverseTransform,
          to: ws.2
        ),
        zs.2
      ),
      """
      `inverseTransform` \(inverseTransform.debugDescription) round-trip failed @ pair 3:
      - z3: \(zs.2.debugDescription)
      - w3: \(ws.2.debugDescription)
      - result: \(self.apply(inverseTransform, to: ws.2).debugDescription)
      
      ...for original triples:
      - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )

  }

  func testBizarreFailingInversion() {
    
    let zs = (Complex<Double>(0.0, 0.0),Complex<Double>(0.0, 1.0),Complex<Double>(0.0, 2.0))
    let ws = (Complex<Double>(0.0, 1.0),Complex<Double>(0.0, 0.0),Complex<Double>(0.0, 2.0))
    
    let transform = MobiusTransformation<Double>(
      sending: zs,
      to: ws
    )
    
    let inverseTransform = MobiusTransformation<Double>(
      sending: ws,
      to: zs
    )

    XCTAssertTrue(
      self.closeEnough(
        self.apply(
          transform,
          to: zs.0
        ),
        ws.0
      ),
      """
      `transform` \(transform.debugDescription) round-trip failed @ pair 1:
      - z1: \(zs.0.debugDescription)
      - w1: \(ws.0.debugDescription)
      - result: \(self.apply(transform, to: zs.0).debugDescription)
      
      ...for original triples:
      - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )
    XCTAssertTrue(
      self.closeEnough(
        self.apply(
          transform,
          to: zs.1
        ),
        ws.1
      ),
      """
      `transform` \(transform.debugDescription) round-trip failed @ pair 2:
      - z2: \(zs.1.debugDescription)
      - w2: \(ws.1.debugDescription)
      - result: \(self.apply(transform, to: zs.1).debugDescription)
      
      ...for original triples:
      - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )
    XCTAssertTrue(
      self.closeEnough(
        self.apply(
          transform,
          to: zs.2
        ),
        ws.2
      ),
      """
      `transform` \(transform.debugDescription) round-trip failed @ pair 3:
      - z3: \(zs.2.debugDescription)
      - w3: \(ws.2.debugDescription)
      - result: \(self.apply(transform, to: zs.2).debugDescription)
      
      ...for original triples:
      - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )
    
    XCTAssertTrue(
      self.closeEnough(
        self.apply(
          inverseTransform,
          to: ws.0
        ),
        zs.0
      ),
      """
      `inverseTransform` \(inverseTransform.debugDescription) round-trip failed @ pair 1:
      - z1: \(zs.0.debugDescription)
      - w1: \(ws.0.debugDescription)
      - result: \(self.apply(inverseTransform, to: ws.0).debugDescription)
      
      ...for original triples:
      - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )
    XCTAssertTrue(
      self.closeEnough(
        self.apply(
          inverseTransform,
          to: ws.1
        ),
        zs.1
      ),
      """
      `inverseTransform` \(inverseTransform.debugDescription) round-trip failed @ pair 2:
      - z2: \(zs.1.debugDescription)
      - w2: \(ws.1.debugDescription)
      - result: \(self.apply(inverseTransform, to: ws.1).debugDescription)
      
      ...for original triples:
      - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )
    XCTAssertTrue(
      self.closeEnough(
        self.apply(
          inverseTransform,
          to: ws.2
        ),
        zs.2
      ),
      """
      `inverseTransform` \(inverseTransform.debugDescription) round-trip failed @ pair 3:
      - z3: \(zs.2.debugDescription)
      - w3: \(ws.2.debugDescription)
      - result: \(self.apply(inverseTransform, to: ws.2).debugDescription)
      
      ...for original triples:
      - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )

  }

  func testDoubleZsToWs() {
    self.haltingOnFirstError {
      for (zs,ws) in self.exampleDoubleZsToWs {
        let transform = MobiusTransformation<Double>(
          sending: zs,
          to: ws
        )
        let inverseTransform = MobiusTransformation<Double>(
          sending: ws,
          to: zs
        )
        XCTAssertTrue(
          transform.isValid,
          """
          `transform` \(transform.debugDescription) isn't valid.
          - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
          - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
          """
        )
        XCTAssertTrue(
          inverseTransform.isValid,
          """
          `inverseTransform` \(inverseTransform.debugDescription) isn't valid.
          - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
          - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
          """
        )
        
        XCTAssertTrue(
          self.closeEnough(
            transform.inverted,
            inverseTransform
          ),
          """
          Insufficient closeness for `transform.inverted` and `inverseTransform`:
          
          - `transform.inverted` \(transform.inverted.debugDescription):
          - `inverseTransform` \(inverseTransform.debugDescription):
          - `transform`: \(transform.debugDescription)
          
          ...for original triples:
          - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
          - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
          """
        )
        
        XCTAssertTrue(
          self.closeEnough(
            inverseTransform.inverted,
            transform
          ),
          """
          Insufficient closeness for `inverseTransform.inverted` and `transform`:
          
          - `inverseTransform.inverted` \(transform.inverted.debugDescription):
          - `transform`: \(transform.debugDescription)
          - `inverseTransform` \(inverseTransform.debugDescription):
          
          ...for original triples:
          - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
          - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
          """
        )
        
        XCTAssertTrue(
          self.closeEnough(
            self.apply(
              transform,
              to: zs.0
            ),
            ws.0
          ),
          """
          `transform` \(transform.debugDescription) round-trip failed @ pair 1:
          - z1: \(zs.0.debugDescription)
          - w1: \(ws.0.debugDescription)
          - result: \(self.apply(transform, to: zs.0).debugDescription)
          
          ...for original triples:
          - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
          - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
          """
        )
        XCTAssertTrue(
          self.closeEnough(
            self.apply(
              transform,
              to: zs.1
            ),
            ws.1
          ),
          """
          `transform` \(transform.debugDescription) round-trip failed @ pair 2:
          - z2: \(zs.1.debugDescription)
          - w2: \(ws.1.debugDescription)
          - result: \(self.apply(transform, to: zs.1).debugDescription)
          
          ...for original triples:
          - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
          - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
          """
        )
        XCTAssertTrue(
          self.closeEnough(
            self.apply(
              transform,
              to: zs.2
            ),
            ws.2
          ),
          """
          `transform` \(transform.debugDescription) round-trip failed @ pair 3:
          - z3: \(zs.2.debugDescription)
          - w3: \(ws.2.debugDescription)
          - result: \(self.apply(transform, to: zs.2).debugDescription)
          
          ...for original triples:
          - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
          - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
          """
        )
        
        XCTAssertTrue(
          self.closeEnough(
            self.apply(
              inverseTransform,
              to: ws.0
            ),
            zs.0
          ),
          """
          `inverseTransform` \(inverseTransform.debugDescription) round-trip failed @ pair 1:
          - z1: \(zs.0.debugDescription)
          - w1: \(ws.0.debugDescription)
          - result: \(self.apply(inverseTransform, to: ws.0).debugDescription)
          
          ...for original triples:
          - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
          - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
          """
        )
        XCTAssertTrue(
          self.closeEnough(
            self.apply(
              inverseTransform,
              to: ws.1
            ),
            zs.1
          ),
          """
          `inverseTransform` \(inverseTransform.debugDescription) round-trip failed @ pair 2:
          - z2: \(zs.1.debugDescription)
          - w2: \(ws.1.debugDescription)
          - result: \(self.apply(inverseTransform, to: ws.1).debugDescription)
          
          ...for original triples:
          - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
          - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
          """
        )
        XCTAssertTrue(
          self.closeEnough(
            self.apply(
              inverseTransform,
              to: ws.2
            ),
            zs.2
          ),
          """
          `inverseTransform` \(inverseTransform.debugDescription) round-trip failed @ pair 3:
          - z3: \(zs.2.debugDescription)
          - w3: \(ws.2.debugDescription)
          - result: \(self.apply(inverseTransform, to: ws.2).debugDescription)
          
          ...for original triples:
          - zs: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
          - ws: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
          """
        )

      }
    }
  }
  
}


