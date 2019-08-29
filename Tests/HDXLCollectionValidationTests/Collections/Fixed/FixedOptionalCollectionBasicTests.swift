//
//  FixedOptionalCollectionBasicTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class FixedOptionalCollectionBasicTests : XCTestCase {
  
  let aa: [Int?] = [1, nil]
  let bb: [Int?] = [2, nil]
  let cc: [Int?] = [3, nil]
  let dd: [Int?] = [4, nil]
  let ee: [Int?] = [5, nil]
  let ff: [Int?] = [6, nil]
  let gg: [Int?] = [7, nil]
  let hh: [Int?] = [8, nil]
  let ii: [Int?] = [9, nil]

  func testArity2FixedOptionalCollections() {
    self.haltingOnFirstError {
      for probeValue in InlineCartesianProduct(self.aa, self.bb) {
        let expectation: [Int] = [
          probeValue.a,
          probeValue.b
        ].compactMap() { $0 }
        let probe = FixedOptionalCollection(
          probeValue.a,
          probeValue.b
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b
          ),
          probe.count
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b
          ),
          expectation.count
        )
        for (expected,actual) in zip(expectation,probe) {
          XCTAssertEqual(
            expected,
            actual
          )
        }
      }
    }
  }

  func testArity3FixedOptionalCollections() {
    self.haltingOnFirstError {
      for probeValue in InlineCartesianProduct(self.aa, self.bb, self.cc) {
        let expectation: [Int] = [
          probeValue.a,
          probeValue.b,
          probeValue.c
        ].compactMap() { $0 }
        let probe = FixedOptionalCollection(
          probeValue.a,
          probeValue.b,
          probeValue.c
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c
          ),
          probe.count
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c
          ),
          expectation.count
        )
        for (expected,actual) in zip(expectation,probe) {
          XCTAssertEqual(
            expected,
            actual
          )
        }
      }
    }
  }

  func testArity4FixedOptionalCollections() {
    self.haltingOnFirstError {
      for probeValue in InlineCartesianProduct(self.aa, self.bb, self.cc, self.dd) {
        let expectation: [Int] = [
          probeValue.a,
          probeValue.b,
          probeValue.c,
          probeValue.d
        ].compactMap() { $0 }
        let probe = FixedOptionalCollection(
          probeValue.a,
          probeValue.b,
          probeValue.c,
          probeValue.d
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c,
            probeValue.d
          ),
          probe.count
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c,
            probeValue.d
          ),
          expectation.count
        )
        for (expected,actual) in zip(expectation,probe) {
          XCTAssertEqual(
            expected,
            actual
          )
        }
      }
    }
  }

  func testArity5FixedOptionalCollections() {
    self.haltingOnFirstError {
      for probeValue in InlineCartesianProduct(self.aa, self.bb, self.cc, self.dd, self.ee) {
        let expectation: [Int] = [
          probeValue.a,
          probeValue.b,
          probeValue.c,
          probeValue.d,
          probeValue.e
        ].compactMap() { $0 }
        let probe = FixedOptionalCollection(
          probeValue.a,
          probeValue.b,
          probeValue.c,
          probeValue.d,
          probeValue.e
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c,
            probeValue.d,
            probeValue.e
          ),
          probe.count
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c,
            probeValue.d,
            probeValue.e
          ),
          expectation.count
        )
        for (expected,actual) in zip(expectation,probe) {
          XCTAssertEqual(
            expected,
            actual
          )
        }
      }
    }
  }

  func testArity6FixedOptionalCollections() {
    self.haltingOnFirstError {
      for probeValue in InlineCartesianProduct(self.aa, self.bb, self.cc, self.dd, self.ee, self.ff) {
        let expectation: [Int] = [
          probeValue.a,
          probeValue.b,
          probeValue.c,
          probeValue.d,
          probeValue.e,
          probeValue.f
        ].compactMap() { $0 }
        let probe = FixedOptionalCollection(
          probeValue.a,
          probeValue.b,
          probeValue.c,
          probeValue.d,
          probeValue.e,
          probeValue.f
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c,
            probeValue.d,
            probeValue.e,
            probeValue.f
          ),
          probe.count
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c,
            probeValue.d,
            probeValue.e,
            probeValue.f
          ),
          expectation.count
        )
        for (expected,actual) in zip(expectation,probe) {
          XCTAssertEqual(
            expected,
            actual
          )
        }
      }
    }
  }

  func testArity7FixedOptionalCollections() {
    self.haltingOnFirstError {
      for probeValue in InlineCartesianProduct(self.aa, self.bb, self.cc, self.dd, self.ee, self.ff, self.gg) {
        let expectation: [Int] = [
          probeValue.a,
          probeValue.b,
          probeValue.c,
          probeValue.d,
          probeValue.e,
          probeValue.f,
          probeValue.g
        ].compactMap() { $0 }
        let probe = FixedOptionalCollection(
          probeValue.a,
          probeValue.b,
          probeValue.c,
          probeValue.d,
          probeValue.e,
          probeValue.f,
          probeValue.g
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c,
            probeValue.d,
            probeValue.e,
            probeValue.f,
            probeValue.g
          ),
          probe.count
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c,
            probeValue.d,
            probeValue.e,
            probeValue.f,
            probeValue.g
          ),
          expectation.count
        )
        for (expected,actual) in zip(expectation,probe) {
          XCTAssertEqual(
            expected,
            actual
          )
        }
      }
    }
  }

  func testArity8FixedOptionalCollections() {
    self.haltingOnFirstError {
      for probeValue in InlineCartesianProduct(self.aa, self.bb, self.cc, self.dd, self.ee, self.ff, self.gg, self.hh) {
        let expectation: [Int] = [
          probeValue.a,
          probeValue.b,
          probeValue.c,
          probeValue.d,
          probeValue.e,
          probeValue.f,
          probeValue.g,
          probeValue.h
        ].compactMap() { $0 }
        let probe = FixedOptionalCollection(
          probeValue.a,
          probeValue.b,
          probeValue.c,
          probeValue.d,
          probeValue.e,
          probeValue.f,
          probeValue.g,
          probeValue.h
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c,
            probeValue.d,
            probeValue.e,
            probeValue.f,
            probeValue.g,
            probeValue.h
          ),
          probe.count
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c,
            probeValue.d,
            probeValue.e,
            probeValue.f,
            probeValue.g,
            probeValue.h
          ),
          expectation.count
        )
        for (expected,actual) in zip(expectation,probe) {
          XCTAssertEqual(
            expected,
            actual
          )
        }
      }
    }
  }

  func testArity9FixedOptionalCollections() {
    self.haltingOnFirstError {
      for probeValue in InlineCartesianProduct(self.aa, self.bb, self.cc, self.dd, self.ee, self.ff, self.gg, self.hh, self.ii) {
        let expectation: [Int] = [
          probeValue.a,
          probeValue.b,
          probeValue.c,
          probeValue.d,
          probeValue.e,
          probeValue.f,
          probeValue.g,
          probeValue.h,
          probeValue.i
        ].compactMap() { $0 }
        let probe = FixedOptionalCollection(
          probeValue.a,
          probeValue.b,
          probeValue.c,
          probeValue.d,
          probeValue.e,
          probeValue.f,
          probeValue.g,
          probeValue.h,
          probeValue.i
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c,
            probeValue.d,
            probeValue.e,
            probeValue.f,
            probeValue.g,
            probeValue.h,
            probeValue.i
          ),
          probe.count
        )
        XCTAssertEqual(
          countOfNonNil(
            probeValue.a,
            probeValue.b,
            probeValue.c,
            probeValue.d,
            probeValue.e,
            probeValue.f,
            probeValue.g,
            probeValue.h,
            probeValue.i
          ),
          expectation.count
        )
        for (expected,actual) in zip(expectation,probe) {
          XCTAssertEqual(
            expected,
            actual
          )
        }
      }
    }
  }
  
}
