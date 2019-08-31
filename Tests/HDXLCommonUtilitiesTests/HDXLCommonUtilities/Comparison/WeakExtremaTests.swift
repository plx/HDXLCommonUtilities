//
//  WeakExtremaTests.swift
//  

import Foundation
import XCTest
@testable import HDXLCommonUtilities

class WeakExtremaTests: XCTestCase {
  
  func testSingleWeakMinimum() {
    
    let zilch: Int? = nil // necessary for type inference
    let lesser: Int? = 1
    let greater: Int? = 2
    
    XCTAssertEqual(
      zilch,
      weakMinimum(nil, nil)
    )
    XCTAssertEqual(
      lesser,
      weakMinimum(greater, lesser)
    )
    XCTAssertEqual(
      lesser,
      weakMinimum(lesser, greater)
    )
    XCTAssertEqual(
      lesser,
      weakMinimum(lesser, nil)
    )
    XCTAssertEqual(
      lesser,
      weakMinimum(nil, lesser)
    )
    XCTAssertEqual(
      lesser,
      weakMinimum(lesser, lesser)
    )
    XCTAssertEqual(
      greater,
      weakMinimum(nil, greater)
    )
    XCTAssertEqual(
      greater,
      weakMinimum(greater, nil)
    )
    XCTAssertEqual(
      greater,
      weakMinimum(greater, greater)
    )

  }

  func testSequenceWeakMinimum() {
    let least: Int? = 1
    let a: Int? = 2
    let b: Int? = 3
    let c: Int? = 4
    
    XCTAssertEqual(
      least,
      weakMinimum(least, a, b, c)
    )
    XCTAssertEqual(
      least,
      weakMinimum(a, least, a, b, c)
    )
    XCTAssertEqual(
      least,
      weakMinimum(a, least, a, b, c)
    )
    XCTAssertEqual(
      least,
      weakMinimum(b, a, least, a, b, c)
    )
    XCTAssertEqual(
      least,
      weakMinimum(c, b, a, least, a, b, c)
    )
    XCTAssertEqual(
      least,
      weakMinimum(a, b, c, least, a, b, c)
    )

    XCTAssertEqual(
      a,
      weakMinimum(a, b, c)
    )
    XCTAssertEqual(
      a,
      weakMinimum(a, nil, a, b, c)
    )
    XCTAssertEqual(
      a,
      weakMinimum(nil, a, b, c)
    )
    XCTAssertEqual(
      a,
      weakMinimum(b, a, a, b, c)
    )
    XCTAssertEqual(
      a,
      weakMinimum(c, b, a, nil, a, b, c)
    )
    XCTAssertEqual(
      a,
      weakMinimum(a, b, c, nil, a, b, c)
    )

  }

  func testSingleWeakMaximum() {
    
    let zilch: Int? = nil // necessary for type inference
    let lesser: Int? = 1
    let greater: Int? = 2
    
    XCTAssertEqual(
      zilch,
      weakMaximum(nil, nil)
    )
    XCTAssertEqual(
      greater,
      weakMaximum(greater, lesser)
    )
    XCTAssertEqual(
      greater,
      weakMaximum(lesser, greater)
    )
    XCTAssertEqual(
      lesser,
      weakMaximum(lesser, nil)
    )
    XCTAssertEqual(
      lesser,
      weakMaximum(nil, lesser)
    )
    XCTAssertEqual(
      lesser,
      weakMaximum(lesser, lesser)
    )
    XCTAssertEqual(
      greater,
      weakMaximum(nil, greater)
    )
    XCTAssertEqual(
      greater,
      weakMaximum(greater, nil)
    )
    XCTAssertEqual(
      greater,
      weakMaximum(greater, greater)
    )

  }

  func testSequenceWeakMaximum() {
    let most: Int? = 5
    let a: Int? = 2
    let b: Int? = 3
    let c: Int? = 4
    
    XCTAssertEqual(
      most,
      weakMaximum(most, a, b, c)
    )
    XCTAssertEqual(
      most,
      weakMaximum(a, most, a, b, c)
    )
    XCTAssertEqual(
      most,
      weakMaximum(a, most, a, b, c)
    )
    XCTAssertEqual(
      most,
      weakMaximum(b, a, most, a, b, c)
    )
    XCTAssertEqual(
      most,
      weakMaximum(c, b, a, most, a, b, c)
    )
    XCTAssertEqual(
      most,
      weakMaximum(a, b, c, most, a, b, c)
    )

    XCTAssertEqual(
      c,
      weakMaximum(a, b, c)
    )
    XCTAssertEqual(
      c,
      weakMaximum(a, nil, a, b, c)
    )
    XCTAssertEqual(
      c,
      weakMaximum(nil, a, b, c)
    )
    XCTAssertEqual(
      c,
      weakMaximum(b, a, a, b, c)
    )
    XCTAssertEqual(
      c,
      weakMaximum(c, b, a, nil, a, b, c)
    )
    XCTAssertEqual(
      c,
      weakMaximum(a, b, c, nil, a, b, c)
    )

  }
  
  func testSingleMinMax() {
    
    let zilch: OrderedPair<Int>? = nil // necessary for type inference
    let lesser: Int? = 1
    let greater: Int? = 2
    
    XCTAssertEqual(
      zilch,
      weakMinMax(nil, nil)
    )
    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 1,
        greater: 2
      ),
      weakMinMax(greater, lesser)
    )
    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 1,
        greater: 2
      ),
      weakMinMax(lesser, greater)
    )
    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 1,
        greater: 1
      ),
      weakMinMax(lesser, nil)
    )
    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 1,
        greater: 1
      ),
      weakMinMax(nil, lesser)
    )
    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 1,
        greater: 1
      ),
      weakMinMax(lesser, lesser)
    )
    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 2,
        greater: 2
      ),
      weakMinMax(nil, greater)
    )
    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 2,
        greater: 2
      ),
      weakMinMax(greater, nil)
    )
    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 2,
        greater: 2
      ),
      weakMinMax(greater, greater)
    )

  }
  
  func testSequenceMinMax() {
    
    let a: Int? = 1
    let b: Int? = 2
    let c: Int? = 3
    let d: Int? = 4
    let e: Int? = 5
    
    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 1,
        greater: 5
      ),
      weakMinMax(a, b, c, d, e)
    )

    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 1,
        greater: 5
      ),
      weakMinMax(nil, a, b, c, d, e)
    )
    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 1,
        greater: 5
      ),
      weakMinMax(b, c, d, e, a)
    )


    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 2,
        greater: 5
      ),
      weakMinMax(b, c, d, e)
    )

    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 1,
        greater: 3
      ),
      weakMinMax(a, b, c)
    )
    XCTAssertEqual(
      OrderedPair<Int>(
        lesser: 1,
        greater: 3
      ),
      weakMinMax(b, c, a, b, c, a)
    )

  }

}
