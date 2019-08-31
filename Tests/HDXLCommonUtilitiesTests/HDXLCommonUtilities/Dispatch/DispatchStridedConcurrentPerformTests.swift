//
//  DispatchStridedConcurrentPerformTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class DispatchStridedConcurrentPerformTests: XCTestCase {
  
  let iterationCounts: [Int] = [
    1,
    10,
    100,
    1000,
    10000
  ]
  
  let bucketSizes: [Int] = [
    1,
    2,
    3,
    10,
    11,
    17,
    100
  ]
  
  lazy var testConfigurations = CartesianProduct(
    self.iterationCounts,
    self.bucketSizes
  ).lazy.map() {
    (0..<$0.a).bucketCollection(
      forBucketSize: $0.b
    )
  }

  let testRepeatCount: Int = 10
  lazy var testRepeats = 0..<self.testRepeatCount
  

  func testStridedConcurrentPerform() {
    // basically all we can really test easily is (a) we don't crash out
    // and (b) our closure is called the requisite # of times and (c) it visits
    // all *expected* values
    self.haltingOnFirstError {
      for testConfiguration in self.testConfigurations {
        for _ in self.testRepeats {
          let iterationCounter = UnfairLockSynchronizedCounter(
            identifier: "IterationCounter(forStridedConcurrentPerformOf: \(testConfiguration.description))"
          )
          let visitedIndices = SynchronizedIndexSet(
            identifier: "VisitedIndices(forStridedConcurrentPerformOf: \(testConfiguration.description))"
          )
          DispatchQueue.stridedConcurrentPerform(
            iterations: testConfiguration.valueCount,
            stride: testConfiguration.bucketSize) {
              [unowned iterationCounter, unowned visitedIndices]
              (iteration: Int) -> Void
              in
              iterationCounter.incrementCount()
              visitedIndices.insert(index: iteration)
          }
          XCTAssertEqual(
            iterationCounter.currentCount,
            testConfiguration.valueCount
          )
          let finalIndexSet = visitedIndices.currentIndexSet
          XCTAssertEqual(
            finalIndexSet.count,
            testConfiguration.valueCount
          )
          for iteration in testConfiguration.valueRange {
            XCTAssertTrue(
              finalIndexSet.contains(iteration)
            )
          }
        }
      }
    }
  }
  
  func testBucketedStridedConcurrentPerform() {
    // basically all we can really test easily is (a) we don't crash out
    // and (b) our closure is called the requisite # of times and (c) it visits
    // all *expected* values
    self.haltingOnFirstError {
      for testConfiguration in self.testConfigurations {
        for _ in self.testRepeats {
          let iterationCounter = UnfairLockSynchronizedCounter(
            identifier: "IterationCounter(forStridedConcurrentPerformOf: \(testConfiguration.description))"
          )
          let bucketCounter = UnfairLockSynchronizedCounter(
            identifier: "BucketCounter(forStridedConcurrentPerformOf: \(testConfiguration.description))"
          )
          let visitedIndices = SynchronizedIndexSet(
            identifier: "VisitedIndices(forStridedConcurrentPerformOf: \(testConfiguration.description))"
          )
          let visitedBuckets = SynchronizedIndexSet(
            identifier: "VisitedBuckets(forStridedConcurrentPerformOf: \(testConfiguration.description))"
          )
          DispatchQueue.bucketedStridedConcurrentPerform(
            iterations: testConfiguration.valueCount,
            stride: testConfiguration.bucketSize) {
              [unowned iterationCounter, unowned visitedIndices]
              (bucket: Range<Int>) -> Void
              in
              bucketCounter.incrementCount()
              visitedBuckets.insert(integersIn: bucket)
              for iteration in bucket {
                iterationCounter.incrementCount()
                visitedIndices.insert(index: iteration)
              }
          }
          XCTAssertEqual(
            bucketCounter.currentCount,
            testConfiguration.bucketCount
          )
          XCTAssertEqual(
            iterationCounter.currentCount,
            testConfiguration.valueCount
          )
          let finalVisitedIndicesIndexSet = visitedIndices.currentIndexSet
          let finalVisitedBucketIndexSet = visitedBuckets.currentIndexSet
          XCTAssertEqual(
            finalVisitedIndicesIndexSet.count,
            testConfiguration.valueCount
          )
          XCTAssertEqual(
            finalVisitedBucketIndexSet.count,
            testConfiguration.valueCount
          )
          XCTAssertEqual(
            finalVisitedBucketIndexSet,
            finalVisitedBucketIndexSet
          )
          for iteration in testConfiguration.valueRange {
            XCTAssertTrue(
              finalVisitedBucketIndexSet.contains(iteration)
            )
            XCTAssertTrue(
              finalVisitedIndicesIndexSet.contains(iteration)
            )
          }
        }
      }
    }
  }


}
