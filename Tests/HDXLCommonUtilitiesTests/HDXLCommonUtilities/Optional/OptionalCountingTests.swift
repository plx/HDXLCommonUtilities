//
//  OptionalCountingTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities

class OptionalCountingTests: XCTestCase {

  func testOptionalCountingRules() {
    
    let nonNil: String? = "nonNil"
    XCTAssertEqual(
      1,
      nonNil.oneIfNotNil
    )
    XCTAssertEqual(
      0,
      nonNil.oneWhenNil
    )
    
    let yesNil: String? = nil
    XCTAssertEqual(
      0,
      yesNil.oneIfNotNil
    )
    XCTAssertEqual(
      1,
      yesNil.oneWhenNil
    )

  }
  
}
