//
//  ExtendedFloatingPointMathTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities

class ExtendedFloatingPointMathTests: XCTestCase {
  
  // ------------------------------------------------------------------------ //
  // MARK: Positive-Modulus Tests
  // ------------------------------------------------------------------------ //

  func testPositiveModulusOnFloats() {
    let pointFive: Float = 0.5
    let one: Float = 1.0
    let onePointFive: Float = 1.5
    let negativePointFive: Float = -0.5
    let negativeOne: Float = -1.0
    let negativeOnePointFive: Float = -1.5
    let modulus: Float = 2.0
    XCTAssertEqual(
      positiveModulus(
        of: pointFive,
        by: modulus
      ),
      pointFive
    )
    XCTAssertEqual(
      positiveModulus(
        of: onePointFive,
        by: modulus
      ),
      onePointFive
    )
    XCTAssertEqual(
      positiveModulus(
        of: one,
        by: modulus
      ),
      one
    )
    XCTAssertEqual(
      positiveModulus(
        of: negativePointFive,
        by: modulus
      ),
      onePointFive
    )
    XCTAssertEqual(
      positiveModulus(
        of: negativeOne,
        by: modulus
      ),
      one
    )
    XCTAssertEqual(
      positiveModulus(
        of: negativeOnePointFive,
        by: modulus
      ),
      pointFive
    )
  }

  func testPositiveModulusOnDoubles() {
    let pointFive: Double = 0.5
    let one: Double = 1.0
    let onePointFive: Double = 1.5
    let negativePointFive: Double = -0.5
    let negativeOne: Double = -1.0
    let negativeOnePointFive: Double = -1.5
    let modulus: Double = 2.0
    XCTAssertEqual(
      positiveModulus(
        of: pointFive,
        by: modulus
      ),
      pointFive
    )
    XCTAssertEqual(
      positiveModulus(
        of: onePointFive,
        by: modulus
      ),
      onePointFive
    )
    XCTAssertEqual(
      positiveModulus(
        of: one,
        by: modulus
      ),
      one
    )
    XCTAssertEqual(
      positiveModulus(
        of: negativePointFive,
        by: modulus
      ),
      onePointFive
    )
    XCTAssertEqual(
      positiveModulus(
        of: negativeOne,
        by: modulus
      ),
      one
    )
    XCTAssertEqual(
      positiveModulus(
        of: negativeOnePointFive,
        by: modulus
      ),
      pointFive
    )
  }

  // ------------------------------------------------------------------------ //
  // MARK: Negative-Modulus Tests
  // ------------------------------------------------------------------------ //

  func testNegativeModulusOnFloats() {
    let pointFive: Float = 0.5
    let one: Float = 1.0
    let onePointFive: Float = 1.5
    let negativePointFive: Float = -0.5
    let negativeOne: Float = -1.0
    let negativeOnePointFive: Float = -1.5
    let modulus: Float = 2.0
    XCTAssertEqual(
      negativeModulus(
        of: pointFive,
        by: modulus
      ),
      negativeOnePointFive
    )
    XCTAssertEqual(
      negativeModulus(
        of: onePointFive,
        by: modulus
      ),
      negativePointFive
    )
    XCTAssertEqual(
      negativeModulus(
        of: one,
        by: modulus
      ),
      negativeOne
    )
    XCTAssertEqual(
      negativeModulus(
        of: negativePointFive,
        by: modulus
      ),
      negativePointFive
    )
    XCTAssertEqual(
      negativeModulus(
        of: negativeOne,
        by: modulus
      ),
      negativeOne
    )
    XCTAssertEqual(
      negativeModulus(
        of: negativeOnePointFive,
        by: modulus
      ),
      negativeOnePointFive
    )
  }

  func testNegativeModulusOnDoubles() {
    let pointFive: Double = 0.5
    let one: Double = 1.0
    let onePointFive: Double = 1.5
    let negativePointFive: Double = -0.5
    let negativeOne: Double = -1.0
    let negativeOnePointFive: Double = -1.5
    let modulus: Double = 2.0
    XCTAssertEqual(
      negativeModulus(
        of: pointFive,
        by: modulus
      ),
      negativeOnePointFive
    )
    XCTAssertEqual(
      negativeModulus(
        of: onePointFive,
        by: modulus
      ),
      negativePointFive
    )
    XCTAssertEqual(
      negativeModulus(
        of: one,
        by: modulus
      ),
      negativeOne
    )
    XCTAssertEqual(
      negativeModulus(
        of: negativePointFive,
        by: modulus
      ),
      negativePointFive
    )
    XCTAssertEqual(
      negativeModulus(
        of: negativeOne,
        by: modulus
      ),
      negativeOne
    )
    XCTAssertEqual(
      negativeModulus(
        of: negativeOnePointFive,
        by: modulus
      ),
      negativeOnePointFive
    )
  }

}
