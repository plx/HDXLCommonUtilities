//
//  Arity2PositionTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class Arity2PositionTests: XCTestCase {
  
  typealias Position = Arity2Position
  
  func testArity() {
    XCTAssertEqual(
      2,
      Position.allCases.count
    )
  }
  
  func testAllCases() {
    XCTAssertEqual(
      Position.allCases,
      [
        .a,
        .b
      ]
    )
  }
  
  func testEquality() {
    HDXLAssertCoherentEquality(
      forAscendingDistinctValues: Position.allCases
    )
  }
  
  func testOrdering() {
    HDXLAssertCoherentOrdering(
      forAscendingDistinctValues: Position.allCases
    )
  }
    
}

