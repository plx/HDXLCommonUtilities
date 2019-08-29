//
//  CartesianProduct2BasicTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class CartesianProduct2BasicTests: XCTestCase {
  
  func testAllEmptyCollection() {
    let e: [Int] = []
    let empty = CartesianProduct(
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
      CartesianProduct(e,e),
      CartesianProduct(i,e),
      CartesianProduct(e,i)
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
    let probe = CartesianProduct(
      [0],
      [1]
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
      type(of: probe).Element(0,1),
      probe[probe.startIndex]
    )
  }
  
  func testCollectionCounts() {
    self.haltingOnFirstError {
      // to avoid re-allocating each iteration, we reuse this
      var probe = CartesianProduct(
        [0],
        [1]
      )
      let components = (0...5).map() {
        return [Int](
          repeating: $0,
          count: $0
        )
      }
      for a in 0...5 {
        probe.a = components[a]
        XCTAssertEqual(
          a,
          probe.a.count
        )
        for b in 0...5 {
          probe.b = components[b]
          XCTAssertEqual(
            b,
            probe.b.count
          )

          XCTAssertEqual(
            (a * b),
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
  
  func testSpecificExample() {
    self.haltingOnFirstError() {
      let aa = [ 0,  1,  2,  3,  4, 5]
      let bb = [10, 11, 12, 13, 14]
      var builtByHand: [UniformInlineProduct2<Int>] = []
      builtByHand.reserveCapacity(
        aa.count
        *
        bb.count
      )
      for a in aa {
        for b in bb {
          builtByHand.append(
            UniformInlineProduct2<Int>(
              a,
              b
            )
          )
        }
      }
      
      let expected: [UniformInlineProduct2<Int>] = [
        (0,10), (0,11), (0,12), (0,13), (0, 14),
        (1,10), (1,11), (1,12), (1,13), (1, 14),
        (2,10), (2,11), (2,12), (2,13), (2, 14),
        (3,10), (3,11), (3,12), (3,13), (3, 14),
        (4,10), (4,11), (4,12), (4,13), (4, 14),
        (5,10), (5,11), (5,12), (5,13), (5, 14)
        ].map() {
          UniformInlineProduct2<Int>($0.0, $0.1)
      }
      XCTAssertEqual(
        builtByHand,
        expected
      )
      let probe = InlineCartesianProduct(
        aa,
        bb
      )
      XCTAssertEqual(
        builtByHand.count,
        probe.count
      )
      for (a,b) in zip(builtByHand,probe) {
        XCTAssertEqual(a,b)
      }
    }
  }

}
