//
//  OptionalIdenticalNullityTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities

class OptionalIdenticalNullityTests: XCTestCase {

  func testOptionalIdenticalNullity() {
    let aNonNil: String? = "aNonNil"
    let bNonNil: String? = "bNonNil"
    let cNonNil: Int? = 1
    let aNil: String? = nil
    let bNil: String? = nil
    let cNil: Int? = nil
    
    XCTAssertTrue(aNonNil.hasIdenticalNullity(to: bNonNil))
    XCTAssertTrue(aNonNil.hasIdenticalNullity(to: cNonNil))
    XCTAssertFalse(aNonNil.hasIdenticalNullity(to: aNil))
    XCTAssertFalse(aNonNil.hasIdenticalNullity(to: bNil))
    XCTAssertFalse(aNonNil.hasIdenticalNullity(to: cNil))
    
    XCTAssertTrue(cNil.hasIdenticalNullity(to: aNil))
    XCTAssertTrue(cNil.hasIdenticalNullity(to: bNil))
    XCTAssertFalse(cNil.hasIdenticalNullity(to: aNonNil))
    XCTAssertFalse(cNil.hasIdenticalNullity(to: bNonNil))
    XCTAssertFalse(cNil.hasIdenticalNullity(to: cNonNil))
    
  }
  
}
