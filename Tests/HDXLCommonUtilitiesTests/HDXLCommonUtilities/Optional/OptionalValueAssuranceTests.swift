//
//  OptionalValueAssuranceTests.swift
//

import XCTest
@testable import HDXLCommonUtilities

class OptionalValueAssuranceTests: XCTestCase {
  
  func testOptionalValueAssuranceFromNil() {
    
    var startsAsNil: Int? = nil
    XCTAssertNil(startsAsNil)
    
    let assuredValue = startsAsNil.obtainAssuredValue(
      fallingBackUpon: 1
    )
    XCTAssertEqual(
      assuredValue,
      1
    )
    XCTAssertNotNil(startsAsNil)
    XCTAssertEqual(
      startsAsNil,
      assuredValue
    )

  }

  func testOptionalValueAssuranceFromNonNil() {
    var startsAsNonNil: Int? = 2
    
    let assuredValue = startsAsNonNil.obtainAssuredValue(
      fallingBackUpon: 1
    )
    XCTAssertEqual(
      assuredValue,
      2
    )
    XCTAssertNotNil(startsAsNonNil)
    XCTAssertEqual(
      startsAsNonNil,
      assuredValue
    )

  }

}
