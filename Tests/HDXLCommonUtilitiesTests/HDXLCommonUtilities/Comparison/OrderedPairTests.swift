//
//  OrderedPairTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities

class OrderedPairTests: XCTestCase {
  
  func testUnorderedConstruction() {
    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 1,
        greater: 2
      ),
      OrderedPair<Int>(unordered: 1, 2)
    )
  }
  
  func testOutOfPlaceValueIncorporationMethods() {
    let p11 = OrderedPair<Int>(value: 1)
    XCTAssertEqual(
      p11,
      OrderedPair<Int>(
        lesser: 1,
        greater: 1
      )
    )

    XCTAssertEqual(
      p11,
      p11.incorporating(value: 1)
    )
    
    let p01 = p11.incorporating(value: 0)
    XCTAssertEqual(
      p01,
      OrderedPair<Int>(
        lesser: 0,
        greater: 1
      )
    )
    
    let p02 = p01.incorporating(value: 2)
    XCTAssertEqual(
      p02,
      OrderedPair<Int>(
        lesser: 0,
        greater: 2
      )
    )
    
    XCTAssertEqual(
      p02,
      p02.incorporating(value: 1)
    )
  }

  func testInPlaceValueIncorporationMethods() {
    var probe = OrderedPair<Int>(value: 1)
    XCTAssertEqual(
      probe,
      OrderedPair<Int>(
        lesser: 1,
        greater: 1
      )
    )
    
    // should be no-op:
    probe.formIncorporation(of: 1)
    XCTAssertEqual(
      probe,
      OrderedPair<Int>(
        lesser: 1,
        greater: 1
      )
    )
    
    probe.formIncorporation(of: 0)
    // now lesser is zero:
    XCTAssertEqual(
      probe,
      OrderedPair<Int>(
        lesser: 0,
        greater: 1
      )
    )
    
    probe.formIncorporation(of: 2)
    // now greater is two:
    XCTAssertEqual(
      probe,
      OrderedPair<Int>(
        lesser: 0,
        greater: 2
      )
    )
    
    // now one more no-op:
    probe.formIncorporation(of: 1)
    XCTAssertEqual(
      probe,
      OrderedPair<Int>(
        lesser: 0,
        greater: 2
      )
    )

  }

  func testOutOfPlacePairIncorporationMethods() {
    
    let p1010 = OrderedPair<Int>(value: 10)
    let p0515 = p1010.incorporating(
      pair: OrderedPair<Int>(
        lesser: 5,
        greater: 15
      )
    )
    XCTAssertEqual(
      p0515,
      OrderedPair<Int>(
        lesser: 5,
        greater: 15
      )
    )
    
    let p0519 = p0515.incorporating(
      pair: OrderedPair<Int>(
        lesser: 7,
        greater: 19
      )
    )
    XCTAssertEqual(
      p0519,
      OrderedPair<Int>(
        lesser: 5,
        greater: 19
      )
    )
    
    let p0219 = p0519.incorporating(
      pair: OrderedPair<Int>(
        lesser: 2,
        greater: 9
      )
    )
    
    XCTAssertEqual(
      p0219,
      OrderedPair<Int>(
        lesser: 2,
        greater: 19
      )
    )
    
  }

  func testInPlacePairIncorporationMethods() {
    
    var probe: OrderedPair<Int> = OrderedPair<Int>(value: 10)
    probe.formIncorporation(
      of: OrderedPair<Int>(
        lesser: 5,
        greater: 15
      )
    )
    XCTAssertEqual(
      probe,
      OrderedPair<Int>(
        lesser: 5,
        greater: 15
      )
    )
    
    probe.formIncorporation(
      of: OrderedPair<Int>(
        lesser: 7,
        greater: 19
      )
    )
    XCTAssertEqual(
      probe,
      OrderedPair<Int>(
        lesser: 5,
        greater: 19
      )
    )
    
    probe.formIncorporation(
      of: OrderedPair<Int>(
        lesser: 2,
        greater: 9
      )
    )
    
    XCTAssertEqual(
      probe,
      OrderedPair<Int>(
        lesser: 2,
        greater: 19
      )
    )
    
  }
  
}
