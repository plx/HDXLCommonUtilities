//
//  ComparisonResultImplicationTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities

class ComparisonResultImplicationTests: XCTestCase {
  
  func testOrderedAscendingImplications() {
    let ascending = ComparisonResult.orderedAscending
    
    XCTAssertTrue(
      ascending.impliesLessThan
    )
    XCTAssertTrue(
      ascending.impliesLessThanOrEqual
    )
    XCTAssertFalse(
      ascending.impliesGreaterThan
    )
    XCTAssertFalse(
      ascending.impliesGreaterThanOrEqual
    )
    XCTAssertFalse(
      ascending.impliesEquality
    )
    XCTAssertTrue(
      ascending.impliesInequality
    )
  }

  func testOrderedDescendingImplications() {
    let descending = ComparisonResult.orderedDescending
    
    XCTAssertFalse(
      descending.impliesLessThan
    )
    XCTAssertFalse(
      descending.impliesLessThanOrEqual
    )
    XCTAssertTrue(
      descending.impliesGreaterThan
    )
    XCTAssertTrue(
      descending.impliesGreaterThanOrEqual
    )
    XCTAssertFalse(
      descending.impliesEquality
    )
    XCTAssertTrue(
      descending.impliesInequality
    )
  }

  func testOrderedSameImplications() {
    let same = ComparisonResult.orderedSame
    
    XCTAssertFalse(
      same.impliesLessThan
    )
    XCTAssertTrue(
      same.impliesLessThanOrEqual
    )
    XCTAssertFalse(
      same.impliesGreaterThan
    )
    XCTAssertTrue(
      same.impliesGreaterThanOrEqual
    )
    XCTAssertTrue(
      same.impliesEquality
    )
    XCTAssertFalse(
      same.impliesInequality
    )
  }

}
