//
//  Arity8PositionTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class Arity8PositionTests: XCTestCase {
  
  typealias Position = Arity8Position
  
  func testArity() {
    XCTAssertEqual(
      8,
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
        .h
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

