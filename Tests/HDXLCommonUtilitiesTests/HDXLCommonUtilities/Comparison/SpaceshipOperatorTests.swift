//
//  SpaceshipOperatorTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities

class SpaceshipOperatorTests: XCTestCase {
  
  func testSimpleComparisons() {
    XCTAssertEqual(
      ComparisonResult.orderedSame,
      1 <=> 1
    )
    XCTAssertEqual(
      ComparisonResult.orderedAscending,
      0 <=> 1
    )
    XCTAssertEqual(
      ComparisonResult.orderedDescending,
      1 <=> 0
    )
  }
  
}
