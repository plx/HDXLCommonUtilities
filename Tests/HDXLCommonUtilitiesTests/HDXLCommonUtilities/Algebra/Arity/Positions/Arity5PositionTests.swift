//
//  Arity5PositionTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class Arity5PositionTests: XCTestCase {
  
  typealias Position = Arity5Position
  
  func testArity() {
    XCTAssertEqual(
      5,
      Position.allCases.count
    )
  }
  
  func testAllCases() {
    XCTAssertEqual(
      Position.allCases,
      [
        .a,
        .b,
        .c,
        .d,
        .e
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

