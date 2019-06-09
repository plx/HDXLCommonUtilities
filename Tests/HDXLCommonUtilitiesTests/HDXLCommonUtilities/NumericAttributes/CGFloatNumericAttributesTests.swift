//
//  CGFloatNumericAttributeTests.swift
//

import XCTest
import CoreGraphics
@testable import HDXLCommonUtilities

fileprivate typealias Representation = CGFloat
fileprivate extension Representation {
  
  static var negativeInfinity: Representation {
    get {
      return -Representation.infinity
    }
  }
  
}

class CGFloatNumericAttributeTests: XCTestCase {
  
  func testNaNNumericAttributes() {
    
    XCTAssertFalse(
      Representation.nan.isInfinite
    )
    
    XCTAssertFalse(
      Representation.nan.isFinite
    )
    
    XCTAssertFalse(
      Representation.nan.isNonNegative
    )
    
    XCTAssertFalse(
      Representation.nan.isStrictlyPositive
    )
    
    XCTAssertFalse(
      Representation.nan.isFiniteNonNegative
    )
    
    XCTAssertFalse(
      Representation.nan.isFiniteStrictlyPositive
    )
    
    XCTAssertFalse(
      Representation.nan.isNonPositive
    )
    
    XCTAssertFalse(
      Representation.nan.isStrictlyNegative
    )
    
    XCTAssertFalse(
      Representation.nan.isFiniteNonPositive
    )
    
    XCTAssertFalse(
      Representation.nan.isFiniteStrictlyNegative
    )
    
  }
  
  func testPositiveInfinityNumericAttributes() {
    
    XCTAssertTrue(
      Representation.infinity.isInfinite
    )
    
    XCTAssertFalse(
      Representation.infinity.isFinite
    )
    
    XCTAssertTrue(
      Representation.infinity.isNonNegative
    )
    
    XCTAssertTrue(
      Representation.infinity.isStrictlyPositive
    )
    
    XCTAssertFalse(
      Representation.infinity.isFiniteNonNegative
    )
    
    XCTAssertFalse(
      Representation.infinity.isFiniteStrictlyPositive
    )
    
    XCTAssertFalse(
      Representation.infinity.isNonPositive
    )
    
    XCTAssertFalse(
      Representation.infinity.isStrictlyNegative
    )
    
    XCTAssertFalse(
      Representation.infinity.isFiniteNonPositive
    )
    
    XCTAssertFalse(
      Representation.infinity.isFiniteStrictlyNegative
    )
    
  }
  
  func testNegativeInfinityNumericAttributes() {
    
    XCTAssertTrue(
      Representation.negativeInfinity.isInfinite
    )
    
    XCTAssertFalse(
      Representation.negativeInfinity.isFinite
    )
    
    XCTAssertFalse(
      Representation.negativeInfinity.isNonNegative
    )
    
    XCTAssertFalse(
      Representation.negativeInfinity.isStrictlyPositive
    )
    
    XCTAssertFalse(
      Representation.negativeInfinity.isFiniteNonNegative
    )
    
    XCTAssertFalse(
      Representation.negativeInfinity.isFiniteStrictlyPositive
    )
    
    XCTAssertTrue(
      Representation.negativeInfinity.isNonPositive
    )
    
    XCTAssertTrue(
      Representation.negativeInfinity.isStrictlyNegative
    )
    
    XCTAssertFalse(
      Representation.negativeInfinity.isFiniteNonPositive
    )
    
    XCTAssertFalse(
      Representation.negativeInfinity.isFiniteStrictlyNegative
    )
    
  }
  
  func testZeroNumericAttributes() {
    
    let probe: Representation = 0.0
    
    XCTAssertFalse(
      probe.isInfinite
    )
    
    XCTAssertTrue(
      probe.isFinite
    )
    
    XCTAssertTrue(
      probe.isNonNegative
    )
    
    XCTAssertFalse(
      probe.isStrictlyPositive
    )
    
    XCTAssertTrue(
      probe.isFiniteNonNegative
    )
    
    XCTAssertFalse(
      probe.isFiniteStrictlyPositive
    )
    
    XCTAssertTrue(
      probe.isNonPositive
    )
    
    XCTAssertFalse(
      probe.isStrictlyNegative
    )
    
    XCTAssertTrue(
      probe.isFiniteNonPositive
    )
    
    XCTAssertFalse(
      probe.isFiniteStrictlyNegative
    )
    
  }
  
  func testPlusOneNumericAttributes() {
    
    let probe: Representation = 1.0
    
    XCTAssertFalse(
      probe.isInfinite
    )
    
    XCTAssertTrue(
      probe.isFinite
    )
    
    XCTAssertTrue(
      probe.isNonNegative
    )
    
    XCTAssertTrue(
      probe.isStrictlyPositive
    )
    
    XCTAssertTrue(
      probe.isFiniteNonNegative
    )
    
    XCTAssertTrue(
      probe.isFiniteStrictlyPositive
    )
    
    XCTAssertFalse(
      probe.isNonPositive
    )
    
    XCTAssertFalse(
      probe.isStrictlyNegative
    )
    
    XCTAssertFalse(
      probe.isFiniteNonPositive
    )
    
    XCTAssertFalse(
      probe.isFiniteStrictlyNegative
    )
    
  }
  
  func testNegativeOneNumericAttributes() {
    
    let probe: Representation = -1.0
    
    XCTAssertFalse(
      probe.isInfinite
    )
    
    XCTAssertTrue(
      probe.isFinite
    )
    
    XCTAssertFalse(
      probe.isNonNegative
    )
    
    XCTAssertFalse(
      probe.isStrictlyPositive
    )
    
    XCTAssertFalse(
      probe.isFiniteNonNegative
    )
    
    XCTAssertFalse(
      probe.isFiniteStrictlyPositive
    )
    
    XCTAssertTrue(
      probe.isNonPositive
    )
    
    XCTAssertTrue(
      probe.isStrictlyNegative
    )
    
    XCTAssertTrue(
      probe.isFiniteNonPositive
    )
    
    XCTAssertTrue(
      probe.isFiniteStrictlyNegative
    )
    
  }
  
}
