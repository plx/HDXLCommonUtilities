//
//  SynchronizedCounterTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class SynchronizedCounterTests: XCTestCase {
  
  let testCounts: [Int] = [
    1,
    10,
    100,
    1000,
    10000,
    100000
  ]
  
  let repeatCount: Int = 10
  lazy var testRepeats: Range<Int> = 0..<self.repeatCount

  func testDispatchSynchronizedCounter() {
    self.haltingOnFirstError {
      for count in self.testCounts {
        for _ in self.testRepeats {
          let counter = DispatchSynchronizedCounter(identifier: "TestUpTo(\(count))")
          XCTAssertEqual(
            0,
            counter.currentCount
          )
          DispatchQueue.concurrentPerform(iterations: count) {
            [unowned counter]
            (_: Int) -> Void
            in
            counter.incrementCount()
          }
          XCTAssertEqual(
            count,
            counter.currentCount
          )
        }
      }
    }
  }
  
  func testUnfairLockSynchronizedCounter() {
    self.haltingOnFirstError {
      for count in self.testCounts {
        for _ in self.testRepeats {
          let counter = UnfairLockSynchronizedCounter(identifier: "TestUpTo(\(count))")
          XCTAssertEqual(
            0,
            counter.currentCount
          )
          DispatchQueue.concurrentPerform(iterations: count) {
            [unowned counter]
            (_: Int) -> Void
            in
            counter.incrementCount()
          }
          XCTAssertEqual(
            count,
            counter.currentCount
          )
        }
      }
    }
  }
  
  func testCountersAgainstEachOther() {
    self.haltingOnFirstError {
      for count in self.testCounts {
        for _ in self.testRepeats {
          let a = DispatchSynchronizedCounter(identifier: "TestUpTo(\(count))")
          let b = UnfairLockSynchronizedCounter(identifier: "TestUpTo(\(count))")
          XCTAssertEqual(
            0,
            a.currentCount
          )
          XCTAssertEqual(
            0,
            b.currentCount
          )
          DispatchQueue.concurrentPerform(iterations: count) {
            [unowned a, unowned b]
            (_: Int) -> Void
            in
            a.incrementCount()
            b.incrementCount()
          }
          XCTAssertEqual(
            count,
            a.currentCount
          )
          XCTAssertEqual(
            count,
            b.currentCount
          )
          XCTAssertEqual(
            a.currentCount,
            b.currentCount
          )
        }
      }
    }
  }
  
}
