//
//  SumChain3CollectionBasicTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class SumChain3CollectionBasicTests: XCTestCase {
  
  func testAllEmptyCollection() {
    let e: [Int] = []
    let empty = SumChainCollection(
      e,
      e,
      e
    )
    XCTAssertTrue(empty.isEmpty)
    XCTAssertEqual(
      0,
      empty.count
    )
    XCTAssertEqual(
      empty.startIndex,
      empty.endIndex
    )
  }
  
  func testAllButOneEmptyVariants() {
    let e: [Int] = []
    let vs: [[Int]] = (1...5).map() {
      [Int]($0..<($0 + $0))
    }
    for (index,v) in vs.enumerated() {
      XCTAssertEqual(
        1 + index,
        v.count
      )
    }
    for v in vs {
      let probes = [
        SumChainCollection(e,e,v),
        SumChainCollection(e,v,e),
        SumChainCollection(v,e,e)
      ]
      for probe in probes {
        XCTAssertFalse(probe.isEmpty)
        XCTAssertNotEqual(
          0,
          probe.count
        )
        XCTAssertNotEqual(
          probe.startIndex,
          probe.endIndex
        )
        XCTAssertEqual(
          probe.count,
          v.count
        )
        for (fromChain,fromV) in zip(probe,v) {
          XCTAssertEqual(
            fromChain.uniformValue,
            fromV
          )
        }
      }
    }
    
  }

   func testCollectionCounts() {
    self.haltingOnFirstError {
      // to avoid re-allocating each iteration, we reuse this
      var probe = SumChainCollection(
        [0],
        [1],
        [2]
      )
      let components = (0...5).map() {
        return [Int](
          repeating: $0,
          count: $0
        )
      }
      for a in components.indices {
        probe.a = components[a]
        XCTAssertEqual(
          a,
          probe.a.count
        )
        for b in components.indices {
          probe.b = components[b]
          XCTAssertEqual(
            b,
            probe.b.count
          )
          for c in components.indices {
            probe.c = components[c]
            XCTAssertEqual(
              c,
              probe.c.count
            )
            XCTAssertEqual(
              a + b + c,
              probe.count
            )
            XCTAssertEqual(
              probe.isEmpty,
              probe.count == 0
            )
            var manualCount: Int = 0
            for _ in probe {
              manualCount += 1
            }
            XCTAssertEqual(
              manualCount,
              probe.count
            )
          }
        }
      }
    }
  }
  
  func testSpecificChain() {
    self.haltingOnFirstError() {
      let aa = [ 0,  1,  2,  3,  4, 5]
      let bb = [10, 11, 12, 13, 14]
      let cc = [20, 21, 22, 23]
      var expected: [Int] = []
      expected.append(contentsOf: aa)
      expected.append(contentsOf: bb)
      expected.append(contentsOf: cc)
      let probe = SumChainCollection(
        aa,
        bb,
        cc
      )
      XCTAssertEqual(
        expected.count,
        probe.count
      )
      for (target,candidate) in zip(expected,probe) {
        XCTAssertEqual(
          target,
          candidate.uniformValue
        )
      }
    }
  }

}
