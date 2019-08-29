//
//  Zip8BasicTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

fileprivate typealias P8 = UniformInlineProduct8<Int>

class Zip8BasicTests: XCTestCase {
  
  func testAllEmptyCollection() {
    let e: [Int] = []
    let empty = Zip(
      e,
      e,
      e,
      e,
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
      Zip(e,e,e,e,e,e,e,e),
      Zip(i,e,e,e,e,e,e,e),
      Zip(e,i,e,e,e,e,e,e),
      Zip(e,e,i,e,e,e,e,e),
      Zip(e,e,e,i,e,e,e,e),
      Zip(e,e,e,e,i,e,e,e),
      Zip(e,e,e,e,e,i,e,e),
      Zip(e,e,e,e,e,e,i,e),
      Zip(e,e,e,e,e,e,e,i),
      Zip(e,i,i,i,i,i,i,i),
      Zip(i,e,i,i,i,i,i,i),
      Zip(i,i,e,i,i,i,i,i),
      Zip(i,i,i,e,i,i,i,i),
      Zip(i,i,i,i,e,i,i,i),
      Zip(i,i,i,i,i,e,i,i),
      Zip(i,i,i,i,i,i,e,i),
      Zip(i,i,i,i,i,i,i,e)
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
      [2],
      [3],
      [4],
      [5],
      [6],
      [7]
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
      type(of: probe).Element(0,1,2,3,4,5,6,7),
      probe[probe.startIndex]
    )
  }
  
  func testCollectionCounts() {
    self.haltingOnFirstError {
      // to avoid re-allocating each iteration, we reuse this
      var probe = Zip(
        [0],
        [1],
        [2],
        [3],
        [4],
        [5],
        [6],
        [7]
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
              for e in components.indices {
                probe.e = components[e]
                XCTAssertEqual(
                  e,
                  probe.e.count
                )
                for f in components.indices {
                  probe.f = components[f]
                  XCTAssertEqual(
                    f,
                    probe.f.count
                  )
                  for g in components.indices {
                    probe.g = components[g]
                    XCTAssertEqual(
                      g,
                      probe.g.count
                    )
                    for h in components.indices {
                      probe.h = components[h]
                      XCTAssertEqual(
                        h,
                        probe.h.count
                      )
                      
                      XCTAssertEqual(
                        min(a,b,c,d,e,f,g,h),
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
      let ee = [40, 41, 42, 43, 44, 45, 46]
      let ff = [50, 51, 52, 53, 54, 55, 56, 57]
      let gg = [60, 61, 62, 63, 64, 65, 66]
      let hh = [70, 71, 72, 73, 74, 75]
      
      let expected: [UniformInlineProduct8<Int>] = [
        P8( 0, 10, 20, 30, 40, 50, 60, 70),
        P8( 1, 11, 21, 31, 41, 51, 61, 71),
        P8( 2, 12, 22, 32, 42, 52, 62, 72)
      ]
      let probe = InlineZip(
        aa,
        bb,
        cc,
        dd,
        ee,
        ff,
        gg,
        hh
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

