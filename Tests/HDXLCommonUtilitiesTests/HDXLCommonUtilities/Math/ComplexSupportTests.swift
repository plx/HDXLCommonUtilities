//
//  ComplexSupportTests.swift
//

import XCTest
import Numerics
@testable import HDXLCommonUtilities

class ComplexSupportTests: XCTestCase {
  
  typealias CD = Complex<Double>
  typealias CF = Complex<Float>
  
  func testFinitenessForWellKnownValues() {
    XCTAssertTrue(
      CD.zero.isFinite
    )
    XCTAssertTrue(
      CD.one.isFinite
    )
    XCTAssertTrue(
      CD.i.isFinite
    )
    
    XCTAssertTrue(
      CF.zero.isFinite
    )
    XCTAssertTrue(
      CF.one.isFinite
    )
    XCTAssertTrue(
      CF.i.isFinite
    )

    XCTAssertFalse(
      CD.infinity.isFinite
    )
    XCTAssertFalse(
      CF.infinity.isFinite
    )
  }
  
}
