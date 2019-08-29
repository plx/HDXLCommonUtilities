//
//  CartesianProduct4BasicTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class CartesianProduct4BasicTests: XCTestCase {
  
  func testAllEmptyCollection() {
    let e: [Int] = []
    let empty = CartesianProduct(
      e,
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
      CartesianProduct(e,e,e,e),
      CartesianProduct(i,e,e,e),
      CartesianProduct(e,i,e,e),
      CartesianProduct(e,e,i,e),
      CartesianProduct(e,e,e,i),
      CartesianProduct(e,i,i,i),
      CartesianProduct(i,e,i,i),
      CartesianProduct(i,i,e,i),
      CartesianProduct(i,i,i,e)
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
      [1],
      [2],
      [3]
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
      type(of: probe).Element(0,1,2,3),
      probe[probe.startIndex]
    )
  }
  
  func testCollectionCounts() {
    self.haltingOnFirstError {
      // to avoid re-allocating each iteration, we reuse this
      var probe = CartesianProduct(
        [0],
        [1],
        [2],
        [3]
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

            for d in components.indices {
              probe.d = components[d]
              XCTAssertEqual(
                d,
                probe.d.count
              )

              XCTAssertEqual(
                (a * b * c * d),
                probe.count
              )
              XCTAssertEqual(
                probe.isEmpty,
                probe.count == 0
              )

            }
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
      let dd = [30, 31, 32, 33, 34, 35]
      let expectedCount = (
        aa.count
        *
        bb.count
        *
        cc.count
        *
        dd.count
      )
      var builtByHand: [UniformInlineProduct4<Int>] = [UniformInlineProduct4<Int>](
        repeating: UniformInlineProduct4<Int>(0,0,0,0),
        count: expectedCount
      )
      var index: Int = 0
      for a in aa {
        for b in bb {
          for c in cc {
            for d in dd {
              builtByHand[index] = UniformInlineProduct4<Int>(
                a,
                b,
                c,
                d
              )
              index += 1
            }
          }
        }
      }
      let probe = InlineCartesianProduct(
        aa,
        bb,
        cc,
        dd
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
