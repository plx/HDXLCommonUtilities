//
//  Arity4PositionTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class Arity4PositionTests: XCTestCase {
  
  typealias Position = Arity4Position
  
  func testArity() {
    XCTAssertEqual(
      4,
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
        .d
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

