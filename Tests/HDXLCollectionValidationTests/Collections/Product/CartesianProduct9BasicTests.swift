//
//  CartesianProduct9BasicTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class CartesianProduct9BasicTests: XCTestCase {
  
  func testAllEmptyCollection() {
    let e: [Int] = []
    let empty = CartesianProduct(
      e,
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
    XCTAssertEqual(0,empty.count)
    XCTAssertEqual(empty.startIndex, empty.endIndex)
  }

  func testEmptyCollectionVariants() {
    let e: [Int] = []
    let i: [Int] = [1]
    let probes = [
      CartesianProduct(e,e,e,e,e,e,e,e,e),
      CartesianProduct(i,e,e,e,e,e,e,e,e),
      CartesianProduct(e,i,e,e,e,e,e,e,e),
      CartesianProduct(e,e,i,e,e,e,e,e,e),
      CartesianProduct(e,e,e,i,e,e,e,e,e),
      CartesianProduct(e,e,e,e,i,e,e,e,e),
      CartesianProduct(e,e,e,e,e,i,e,e,e),
      CartesianProduct(e,e,e,e,e,e,i,e,e),
      CartesianProduct(e,e,e,e,e,e,e,i,e),
      CartesianProduct(e,e,e,e,e,e,e,e,i),
      CartesianProduct(e,i,i,i,i,i,i,i,i),
      CartesianProduct(i,e,i,i,i,i,i,i,i),
      CartesianProduct(i,i,e,i,i,i,i,i,i),
      CartesianProduct(i,i,i,e,i,i,i,i,i),
      CartesianProduct(i,i,i,i,e,i,i,i,i),
      CartesianProduct(i,i,i,i,i,e,i,i,i),
      CartesianProduct(i,i,i,i,i,i,e,i,i),
      CartesianProduct(i,i,i,i,i,i,i,e,i),
      CartesianProduct(i,i,i,i,i,i,i,i,e)
    ]
    for probe in probes {
      XCTAssertTrue(probe.isEmpty)
      XCTAssertEqual(0,probe.count)
      XCTAssertEqual(probe.startIndex, probe.endIndex)
    }
  }

  func testLengthOneCollection() {
    let probe = CartesianProduct(
      [0],
      [1],
      [2],
      [3],
      [4],
      [5],
      [6],
      [7],
      [8]
    )
    XCTAssertFalse(probe.isEmpty)
    XCTAssertEqual(1, probe.count)
    XCTAssertNotEqual(probe.startIndex, probe.endIndex)
    XCTAssertEqual(
      type(of: probe).Element(0,1,2,3,4,5,6,7,8),
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
        [3],
        [4],
        [5],
        [6],
        [7],
        [8]
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
                      for i in components.indices {
                        probe.i = components[i]
                        XCTAssertEqual(
                          i,
                          probe.i.count
                        )
                        
                        XCTAssertEqual(
                          (a * b * c * d * e * f * g * h * i),
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
      let ii = [80, 81, 82, 83]
      let expectedCount = (
        aa.count
        *
        bb.count
        *
        cc.count
        *
        dd.count
        *
        ee.count
        *
        ff.count
        *
        gg.count
        *
        hh.count
        *
        ii.count
      )
      var builtByHand: [UniformInlineProduct9<Int>] = [UniformInlineProduct9<Int>](
        repeating: UniformInlineProduct9<Int>(0,0,0,0,0,0,0,0,0),
        count: expectedCount
      )
      var index: Int = 0
      for a in aa {
        for b in bb {
          for c in cc {
            for d in dd {
              for e in ee {
                for f in ff {
                  for g in gg {
                    for h in hh {
                      for i in ii {
                        builtByHand[index] = UniformInlineProduct9<Int>(
                          a,
                          b,
                          c,
                          d,
                          e,
                          f,
                          g,
                          h,
                          i
                        )
                        index += 1
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
      let probe = InlineCartesianProduct(
        aa,
        bb,
        cc,
        dd,
        ee,
        ff,
        gg,
        hh,
        ii
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
