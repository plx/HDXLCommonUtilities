//
//  AdjacentCollectionArityTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class AdjacentCollectionArityTests: XCTestCase {
  
  // note: generally I don't like testing minor internal details like this,
  // but so much breaks if `.arity` is wrong may as well catch it right away!
  func testArity2Sanity() {
    XCTAssertEqual(
      2,
      [Int].Adjacent2Tuples.arity
    )
  }

  // note: generally I don't like testing minor internal details like this,
  // but so much breaks if `.arity` is wrong may as well catch it right away!
  func testArity3Sanity() {
    XCTAssertEqual(
      3,
      [Int].Adjacent3Tuples.arity
    )
  }

  // note: generally I don't like testing minor internal details like this,
  // but so much breaks if `.arity` is wrong may as well catch it right away!
  func testArity4Sanity() {
    XCTAssertEqual(
      4,
      [Int].Adjacent4Tuples.arity
    )
  }

  // note: generally I don't like testing minor internal details like this,
  // but so much breaks if `.arity` is wrong may as well catch it right away!
  func testArity5Sanity() {
    XCTAssertEqual(
      5,
      [Int].Adjacent5Tuples.arity
    )
  }

  // note: generally I don't like testing minor internal details like this,
  // but so much breaks if `.arity` is wrong may as well catch it right away!
  func testArity6Sanity() {
    XCTAssertEqual(
      6,
      [Int].Adjacent6Tuples.arity
    )
  }

  // note: generally I don't like testing minor internal details like this,
  // but so much breaks if `.arity` is wrong may as well catch it right away!
  func testArity7Sanity() {
    XCTAssertEqual(
      7,
      [Int].Adjacent7Tuples.arity
    )
  }

  // note: generally I don't like testing minor internal details like this,
  // but so much breaks if `.arity` is wrong may as well catch it right away!
  func testArity8Sanity() {
    XCTAssertEqual(
      8,
      [Int].Adjacent8Tuples.arity
    )
  }

  // note: generally I don't like testing minor internal details like this,
  // but so much breaks if `.arity` is wrong may as well catch it right away!
  func testArity9Sanity() {
    XCTAssertEqual(
      9,
      [Int].Adjacent9Tuples.arity
    )
  }

}
