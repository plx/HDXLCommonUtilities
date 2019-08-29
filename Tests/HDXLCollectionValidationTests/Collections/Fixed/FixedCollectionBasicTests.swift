//
//  FixedCollectionBasicTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class FixedCollectionBasicTests : XCTestCase {

  func testArity2FixedCollection() {
    let expectation: [Int] = [
      1,
      2
    ]
    let probe = FixedCollection(
      1,
      2
    )
    XCTAssertFalse(
      probe.isEmpty
    )
    XCTAssertEqual(
      2,
      probe.count
    )
    for (expected,candidate) in zip(expectation,probe) {
      XCTAssertEqual(
        expected,
        candidate
      )
    }
    for (eIndex,pIndex) in zip(expectation.indices,probe.indices) {
      XCTAssertEqual(
        eIndex,
        pIndex
      )
      XCTAssertEqual(
        expectation[eIndex],
        probe[pIndex]
      )
    }
  }

  func testArity3FixedCollection() {
    let expectation: [Int] = [
      1,
      2,
      3
    ]
    let probe = FixedCollection(
      1,
      2,
      3
    )
    XCTAssertFalse(
      probe.isEmpty
    )
    XCTAssertEqual(
      3,
      probe.count
    )
    for (expected,candidate) in zip(expectation,probe) {
      XCTAssertEqual(
        expected,
        candidate
      )
    }
    for (eIndex,pIndex) in zip(expectation.indices,probe.indices) {
      XCTAssertEqual(
        eIndex,
        pIndex
      )
      XCTAssertEqual(
        expectation[eIndex],
        probe[pIndex]
      )
    }
  }

  func testArity4FixedCollection() {
    let expectation: [Int] = [
      1,
      2,
      3,
      4
    ]
    let probe = FixedCollection(
      1,
      2,
      3,
      4
    )
    XCTAssertFalse(
      probe.isEmpty
    )
    XCTAssertEqual(
      4,
      probe.count
    )
    for (expected,candidate) in zip(expectation,probe) {
      XCTAssertEqual(
        expected,
        candidate
      )
    }
    for (eIndex,pIndex) in zip(expectation.indices,probe.indices) {
      XCTAssertEqual(
        eIndex,
        pIndex
      )
      XCTAssertEqual(
        expectation[eIndex],
        probe[pIndex]
      )
    }
  }

  func testArity5FixedCollection() {
    let expectation: [Int] = [
      1,
      2,
      3,
      4,
      5
    ]
    let probe = FixedCollection(
      1,
      2,
      3,
      4,
      5
    )
    XCTAssertFalse(
      probe.isEmpty
    )
    XCTAssertEqual(
      5,
      probe.count
    )
    for (expected,candidate) in zip(expectation,probe) {
      XCTAssertEqual(
        expected,
        candidate
      )
    }
    for (eIndex,pIndex) in zip(expectation.indices,probe.indices) {
      XCTAssertEqual(
        eIndex,
        pIndex
      )
      XCTAssertEqual(
        expectation[eIndex],
        probe[pIndex]
      )
    }
  }

  func testArity6FixedCollection() {
    let expectation: [Int] = [
      1,
      2,
      3,
      4,
      5,
      6
    ]
    let probe = FixedCollection(
      1,
      2,
      3,
      4,
      5,
      6
    )
    XCTAssertFalse(
      probe.isEmpty
    )
    XCTAssertEqual(
      6,
      probe.count
    )
    for (expected,candidate) in zip(expectation,probe) {
      XCTAssertEqual(
        expected,
        candidate
      )
    }
    for (eIndex,pIndex) in zip(expectation.indices,probe.indices) {
      XCTAssertEqual(
        eIndex,
        pIndex
      )
      XCTAssertEqual(
        expectation[eIndex],
        probe[pIndex]
      )
    }
  }

  func testArity7FixedCollection() {
    let expectation: [Int] = [
      1,
      2,
      3,
      4,
      5,
      6,
      7
    ]
    let probe = FixedCollection(
      1,
      2,
      3,
      4,
      5,
      6,
      7
    )
    XCTAssertFalse(
      probe.isEmpty
    )
    XCTAssertEqual(
      7,
      probe.count
    )
    for (expected,candidate) in zip(expectation,probe) {
      XCTAssertEqual(
        expected,
        candidate
      )
    }
    for (eIndex,pIndex) in zip(expectation.indices,probe.indices) {
      XCTAssertEqual(
        eIndex,
        pIndex
      )
      XCTAssertEqual(
        expectation[eIndex],
        probe[pIndex]
      )
    }
  }

  func testArity8FixedCollection() {
    let expectation: [Int] = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8
    ]
    let probe = FixedCollection(
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8
    )
    XCTAssertFalse(
      probe.isEmpty
    )
    XCTAssertEqual(
      8,
      probe.count
    )
    for (expected,candidate) in zip(expectation,probe) {
      XCTAssertEqual(
        expected,
        candidate
      )
    }
    for (eIndex,pIndex) in zip(expectation.indices,probe.indices) {
      XCTAssertEqual(
        eIndex,
        pIndex
      )
      XCTAssertEqual(
        expectation[eIndex],
        probe[pIndex]
      )
    }
  }

  func testArity9FixedCollection() {
    let expectation: [Int] = [
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    ]
    let probe = FixedCollection(
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9
    )
    XCTAssertFalse(
      probe.isEmpty
    )
    XCTAssertEqual(
      9,
      probe.count
    )
    for (expected,candidate) in zip(expectation,probe) {
      XCTAssertEqual(
        expected,
        candidate
      )
    }
    for (eIndex,pIndex) in zip(expectation.indices,probe.indices) {
      XCTAssertEqual(
        eIndex,
        pIndex
      )
      XCTAssertEqual(
        expectation[eIndex],
        probe[pIndex]
      )
    }
  }
  
}
