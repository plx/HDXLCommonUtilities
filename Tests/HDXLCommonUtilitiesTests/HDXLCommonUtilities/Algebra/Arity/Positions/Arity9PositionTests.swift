//
//  Arity9PositionTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class Arity9PositionTests: XCTestCase {
  
  typealias Position = Arity9Position
  
  func testArity() {
    XCTAssertEqual(
      9,
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
        .e,
        .f,
        .g,
        .h,
        .i
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

