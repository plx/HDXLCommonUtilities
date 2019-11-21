//
//  MobiusTransformationTests.swift
//

import XCTest
@testable import HDXLCommonUtilities
import Numerics

class MobiusTransformationTests: XCTestCase {
  
  fileprivate func prepareTestValues<R:Real>(maximumComponentMagnitude maximumMagnitude: Int) -> [Complex<R>] {
    precondition(maximumMagnitude >= 0)
    var testValues: [Complex<R>] = [Complex<R>]()
    testValues.reserveCapacity(1 + maximumMagnitude * maximumMagnitude)
    for x in 0...maximumMagnitude {
      for y in 0...maximumMagnitude {
        testValues.append(
          Complex(R(x),R(y))
        )
      }
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
  

  let depthForTesting: Int = 10
  
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
  ).asTuples()

  lazy var exampleDoubleZsToWs = CartesianProduct(
    self.distinctComplexDoubleTriples,
    self.distinctComplexDoubleTriples
  ).asTuples()
  
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
          )
        )
        XCTAssertTrue(
          self.closeEnough(
            inverseTransform.inverted,
            transform
          )
        )
        
        XCTAssertTrue(
          self.closeEnough(
            transform.apply(to: zs.0),
            ws.0
          )
        )
        XCTAssertTrue(
          self.closeEnough(
            transform.apply(to: zs.1),
            ws.1
          )
        )
        XCTAssertTrue(
          self.closeEnough(
            transform.apply(to: zs.2),
            ws.2
          )
        )
        XCTAssertTrue(
          self.closeEnough(
            inverseTransform.apply(to: ws.0),
            zs.0
          )
        )
        XCTAssertTrue(
          self.closeEnough(
            inverseTransform.apply(to: ws.1),
            zs.1
          )
        )
        XCTAssertTrue(
          self.closeEnough(
            inverseTransform.apply(to: ws.2),
            zs.2
          )
        )

      }
    }
  }
  
}


