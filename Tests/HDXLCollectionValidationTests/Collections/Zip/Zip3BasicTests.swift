//
//  Zip3BasicTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

fileprivate typealias P3 = UniformInlineProduct3<Int>

class Zip3BasicTests: XCTestCase {
  
  func testAllEmptyCollection() {
    let e: [Int] = []
    let empty = Zip(
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

  func testEmptyCollectionVariants() {
    let e: [Int] = []
    let i: [Int] = [1]
    let probes = [
      Zip(e,e,e),
      Zip(i,e,e),
      Zip(e,i,e),
      Zip(e,e,i),
      Zip(e,i,i),
      Zip(i,e,i),
      Zip(i,i,e)
    ]
    for probe in probes {
      XCTAssertTrue(probe.isEmpty)
      XCTAssertEqual(
        0,
        probe.count
      )
      XCTAssertEqual(
        probe.startIndex,
        probe.endIndex
      )
    }
  }

  func testLengthOneCollection() {
    let probe = Zip(
      [0],
      [1],
      [2]
    )
    XCTAssertFalse(probe.isEmpty)
    XCTAssertEqual(
      1,
      probe.count
    )
    XCTAssertNotEqual(
      probe.startIndex,
      probe.endIndex
    )
    XCTAssertEqual(
      type(of: probe).Element(0,1,2),
      probe[probe.startIndex]
    )
  }
  
  func testCollectionCounts() {
    self.haltingOnFirstError {
      // to avoid re-allocating each iteration, we reuse this
      var probe = Zip(
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
              min(a,b,c),
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
  
  func testSpecificExample() {
    self.haltingOnFirstError() {
      let aa = [ 0,  1,  2]
      let bb = [10, 11, 12, 13]
      let cc = [20, 21, 22, 23, 24]
      
      let expected: [UniformInlineProduct3<Int>] = [
        P3( 0, 10, 20),
        P3( 1, 11, 21),
        P3( 2, 12, 22)
      ]
      let probe = Zip(
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
          candidate
        )
      }
    }
  }

}

