//
//  Chain8CollectionBasicTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class Chain8CollectionBasicTests: XCTestCase {
  
  func testAllEmptyCollection() {
    let e: [Int] = []
    let empty = ChainCollection(
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
        ChainCollection(e,e,e,e,e,e,e,v),
        ChainCollection(e,e,e,e,e,e,v,e),
        ChainCollection(e,e,e,e,e,v,e,e),
        ChainCollection(e,e,e,e,v,e,e,e),
        ChainCollection(e,e,e,v,e,e,e,e),
        ChainCollection(e,e,v,e,e,e,e,e),
        ChainCollection(e,v,e,e,e,e,e,e),
        ChainCollection(v,e,e,e,e,e,e,e)
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
            fromChain,
            fromV
          )
        }
      }
    }
    
  }

   func testCollectionCounts() {
    self.haltingOnFirstError {
      // to avoid re-allocating each iteration, we reuse this
      var probe = ChainCollection(
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
                        a + b + c + d + e + f + g + h,
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
  
  func testSpecificChain() {
    self.haltingOnFirstError() {
      let aa = [ 0,  1,  2,  3,  4,  5]
      let bb = [10, 11, 12, 13, 14]
      let cc = [20, 21, 22, 23]
      let dd = [30, 31, 32, 33, 34]
      let ee = [40, 41, 42, 43, 44, 45]
      let ff = [50, 51, 52, 53, 54]
      let gg = [60, 61, 62, 63]
      let hh = [70, 71, 72, 73, 74]
      var expected: [Int] = []
      expected.append(contentsOf: aa)
      expected.append(contentsOf: bb)
      expected.append(contentsOf: cc)
      expected.append(contentsOf: dd)
      expected.append(contentsOf: ee)
      expected.append(contentsOf: ff)
      expected.append(contentsOf: gg)
      expected.append(contentsOf: hh)
      let probe = ChainCollection(
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

