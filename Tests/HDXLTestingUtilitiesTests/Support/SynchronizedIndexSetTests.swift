//
//  SynchronizedIndexSetTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class SynchronizedIndexSetTests: XCTestCase {
  
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
  
  func testIndexVisitation() {
    // basic test: do we visit everything we should visit?
    self.haltingOnFirstError {
      for count in self.testCounts {
        for _ in self.testRepeats {
          let visitedIndices = SynchronizedIndexSet(identifier: "TestUpTo(\(count))")
          XCTAssertEqual(
            0,
            visitedIndices.currentIndexSet.count
          )
          DispatchQueue.concurrentPerform(iterations: count) {
            [unowned visitedIndices]
            (index: Int) -> Void
            in
            visitedIndices.insert(
              index: index
            )
          }
          let indexSet = visitedIndices.currentIndexSet
          XCTAssertEqual(
            count,
            visitedIndices.currentIndexSet.count
          )
          for iteration in 0..<count {
            XCTAssertTrue(
              indexSet.contains(iteration)
            )
          }
        }
      }
    }
  }
    
}
