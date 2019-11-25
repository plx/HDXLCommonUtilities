//
//  MobiusTransformationTests.swift
//

import XCTest
@testable import HDXLCommonUtilities
import Numerics

class MobiusTransformationTests: XCTestCase {
    
  func provideAllEquivalentReshufflings<R:Real>(
    zs: (Complex<R>,Complex<R>,Complex<R>),
    ws: (Complex<R>,Complex<R>,Complex<R>)) -> [((Complex<R>,Complex<R>,Complex<R>),(Complex<R>,Complex<R>,Complex<R>))] {
    return [
      ((zs.0,zs.1,zs.2),
       (ws.0,ws.1,ws.2)),
      ((zs.0,zs.2,zs.1),
       (ws.0,ws.2,ws.1)),
      ((zs.1,zs.0,zs.2),
       (ws.1,ws.0,ws.2)),
      ((zs.1,zs.2,zs.0),
       (ws.1,ws.2,ws.0)),
      ((zs.2,zs.0,zs.1),
       (ws.2,ws.0,ws.1)),
      ((zs.2,zs.1,zs.0),
       (ws.2,ws.1,ws.0))
    ]
  }
  
  func tripleIsInStrictlyAscendingStructuralOrder<R:Real>(
    _ triple: (Complex<R>,Complex<R>,Complex<R>)) -> Bool {
    guard
      Complex<R>.structuralComparison(
        triple.0,
        triple.1
      ) == .orderedAscending,
      Complex<R>.structuralComparison(
        triple.1,
        triple.2
      ) == .orderedAscending,
      Complex<R>.structuralComparison(
        triple.0,
        triple.2
        ) == .orderedAscending else {
          return false
    }
    return true
  }
  
  func shouldPerformTest<R:Real>(
    sending zs: (Complex<R>,Complex<R>,Complex<R>),
    to ws: (Complex<R>,Complex<R>,Complex<R>)) -> Bool {
    guard
      self.tripleIsInStrictlyAscendingStructuralOrder(zs),
      MobiusTransformation<R>.canConstructTransformation(
        sending: zs,
        to: ws) else {
          return false
    }
    return true
  }

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

  func closeEnough<R:Real>(
    _ x: Complex<R>,
    _ y: Complex<R>) -> Bool {
    return x.hasInfinityNormDistance(
      strictlyLessThan: R(1)/R(10000),
      to: y
    )
  }
    
  let epsilonForDoubleTransforms: Double = 0.0001
  let epsilonForFloatTransforms: Float = 0.0001
  
  func closeEnough<R:Real>(
    _ x: MobiusTransformation<R>,
    _ y: MobiusTransformation<R>) -> Bool {
    return x.hasInfinityNormDistance(
      strictlyLessThan: R(1)/R(10000),
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

  lazy var exampleFloatZTriples = self.distinctComplexFloatTriples.lazy.filter({
    self.tripleIsInStrictlyAscendingStructuralOrder(($0.0, $0.1, $0.2))
  })
  lazy var exampleFloatWTriples = self.distinctComplexFloatTriples

  lazy var exampleDoubleZTriples = self.distinctComplexDoubleTriples.lazy.filter({
    self.tripleIsInStrictlyAscendingStructuralOrder(($0.0, $0.1, $0.2))
  })
  lazy var exampleDoubleWTriples = self.distinctComplexDoubleTriples
  
  
  lazy var exampleFloatZsToWs = CartesianProduct(
    self.exampleFloatZTriples,
    self.exampleFloatWTriples
  ).asTuples().lazy.filter() {
    MobiusTransformation<Float>.canConstructTransformation(
      sending: $0,
      to: $1
    )
  }

  lazy var exampleDoubleZsToWs = CartesianProduct(
    self.exampleDoubleZTriples,
    self.exampleDoubleWTriples
  ).asTuples().lazy.filter() {
    MobiusTransformation<Double>.canConstructTransformation(
      sending: $0,
      to: $1
    )
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
  
  func confirm<R:Real>(
    transformation: MobiusTransformation<R>,
    sends zs: (Complex<R>,Complex<R>,Complex<R>),
    to ws: (Complex<R>,Complex<R>,Complex<R>),
    treatingAsInverse treatAsInverse: Bool) {
    XCTAssertTrue(
      self.closeEnough(
        ws.0,
        self.apply(
          transformation,
          to: zs.0
        )
      ),
      """
      Mapping Failure @ p1:
      - expected: \(zs.0.debugDescription) => \(ws.0.debugDescription)
      - but got: \(zs.0.debugDescription) => \(self.apply(transformation,to: zs.0))
      - transformation: \(transformation.debugDescription)
      - inverted: \(treatAsInverse)
      - sending: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - to: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )
    XCTAssertTrue(
      self.closeEnough(
        ws.1,
        self.apply(
          transformation,
          to: zs.1
        )
      ),
      """
      Mapping Failure @ p2:
      - expected: \(zs.1.debugDescription) => \(ws.1.debugDescription)
      - but got: \(zs.1.debugDescription) => \(self.apply(transformation,to: zs.1))
      - transformation: \(transformation.debugDescription)
      - inverted: \(treatAsInverse)
      - sending: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - to: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )
    XCTAssertTrue(
      self.closeEnough(
        ws.2,
        self.apply(
          transformation,
          to: zs.2
        )
      ),
      """
      Mapping Failure @ p3:
      - expected: \(zs.2.debugDescription) => \(ws.2.debugDescription)
      - but got: \(zs.2.debugDescription) => \(self.apply(transformation,to: zs.2))
      - transformation: \(transformation.debugDescription)
      - inverted: \(treatAsInverse)
      - sending: (\(zs.0.debugDescription),\(zs.1.debugDescription),\(zs.2.debugDescription)),
      - to: (\(ws.0.debugDescription),\(ws.1.debugDescription),\(ws.2.debugDescription))
      """
    )
  }
  
  func testZTripleFiltration() {
    let values: [Complex<Double>] = self.prepareTestValues(maximumComponentMagnitude: self.depthForTesting)
    self.haltingOnFirstError {
      var count = 0
      for z1 in values {
        for z2 in values where .orderedAscending == Complex<Double>.structuralComparison(z1, z2) {
          for z3 in values where .orderedAscending == Complex<Double>.structuralComparison(z2, z3) {
            count += 1
            XCTAssertTrue(allArgumentsDistinct(z1, z2, z3))
            XCTAssertTrue(self.tripleIsInStrictlyAscendingStructuralOrder((z1, z2, z3)))
          }
        }
      }
      print("total z count: \(count)")
    }
  }

  func testWTripleFiltration() {
    let values: [Complex<Double>] = self.prepareTestValues(maximumComponentMagnitude: self.depthForTesting)
    self.haltingOnFirstError {
      var count = 0
      for w1 in values {
        for w2 in values where w2 != w1 {
          for w3 in values where w3 != w2 && w3 != w1 {
            count += 1
            XCTAssertTrue(allArgumentsDistinct(w1, w2, w3))
          }
        }
      }
      print("total w count: \(count)")
    }
  }
  
  // 40,560,000
  func testDoubleZsToWsV2() {
    let values: [Complex<Double>] = self.prepareTestValues(maximumComponentMagnitude: self.depthForTesting)
    let expectedIterations: Int = 40560000
    self.haltingOnFirstError {
      var iterationCount: Int = 0
      let startTimeStamp = Date()
      for z1 in values {
        for z2 in values where .orderedAscending == Complex<Double>.structuralComparison(z1, z2) {
          for z3 in values where .orderedAscending == Complex<Double>.structuralComparison(z2, z3) {
            XCTAssertTrue(allArgumentsDistinct(z1, z2, z3))
            XCTAssertTrue(self.tripleIsInStrictlyAscendingStructuralOrder((z1, z2, z3)))
            for w1 in values {
              for w2 in values where w2 != w1 {
                for w3 in values where w3 != w2 && w3 != w1 {
                  XCTAssertTrue(allArgumentsDistinct(w1, w2, w3))
                  let shouldLog = 0 == iterationCount % 100000
                  iterationCount += 1
                  let fixedPointCount = countOfTrue(
                    z1 == w1,
                    z2 == w2,
                    z3 == w3
                  )
                  XCTAssertEqual(
                    MobiusTransformation<Double>.canConstructTransformation(
                      sending: (z1,z2,z3),
                      to: (w1,w2,w3)
                    ),
                    fixedPointCount <= 2
                  )
                  if fixedPointCount <= 2 {
                    let transformation = MobiusTransformation<Double>(
                      sending: (z1,z2,z3),
                      to: (w1,w2,w3)
                    )
                    let inverseTransformation = MobiusTransformation<Double>(
                      sending: (w1,w2,w3),
                      to: (z1,z2,z3)
                    )
                    XCTAssertTrue(transformation.isValid)
                    XCTAssertTrue(inverseTransformation.isValid)
                    XCTAssertTrue(
                      self.closeEnough(
                        transformation.inverted,
                        inverseTransformation
                      ),
                      """
                      Insufficient closeness for `transformation.inverted` and `inverseTransformation`:
                      
                      - `transformation.inverted` \(transformation.inverted.debugDescription):
                      - `inverseTransformation` \(inverseTransformation.debugDescription):
                      - `transformation`: \(transformation.debugDescription)
                      
                      ...for original triples:
                      - zs: (\(z1.debugDescription),\(z2.debugDescription),\(z3.debugDescription)),
                      - ws: (\(w1.debugDescription),\(w2.debugDescription),\(w3.debugDescription))
                      """
                    )
                    
                    XCTAssertTrue(
                      self.closeEnough(
                        inverseTransformation.inverted,
                        transformation
                      ),
                      """
                      Insufficient closeness for `inverseTransformation.inverted` and `transform`:
                      
                      - `inverseTransformation.inverted` \(inverseTransformation.inverted.debugDescription):
                      - `transformation`: \(transformation.debugDescription)
                      - `inverseTransformation` \(inverseTransformation.debugDescription):
                      
                      ...for original triples:
                      - zs: (\(z1.debugDescription),\(z2.debugDescription),\(z3.debugDescription)),
                      - ws: (\(w1.debugDescription),\(w2.debugDescription),\(w3.debugDescription))
                      """
                    )
                    
                    self.confirm(
                      transformation: transformation,
                      sends: (z1,z2,z3),
                      to: (w1,w2,w3),
                      treatingAsInverse: false
                    )
                    self.confirm(
                      transformation: inverseTransformation,
                      sends: (w1,w2,w3),
                      to: (z1,z2,z3),
                      treatingAsInverse: true
                    )
                    
                    if shouldLog {
                      let currentTimestamp = Date()
                      let elapsedDuration = abs(currentTimestamp.timeIntervalSince(startTimeStamp))
                      let timePerUnit = elapsedDuration/TimeInterval(iterationCount)
                      let remainingTime = timePerUnit * TimeInterval(expectedIterations - iterationCount)
                      print(
                        """
                        Finished iteration \(iterationCount):
                        - time-per-unt: \(timePerUnit)
                        - elapsed-time: \(elapsedDuration)
                        - remaining-tiem: \(remainingTime)
                        """
                      )
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  func testDoubleZsToWs() {
    print("exampleDoubleZsToWs.count: \(exampleDoubleZsToWs.count)")
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


