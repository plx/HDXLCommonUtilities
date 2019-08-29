//
//  Adjacent9CollectionBasicTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class Adjacent9CollectionBasicTests : XCTestCase {
  
  static let arity: Int = 9
  
  func testEmpties() {
    let empties = (0..<(type(of: self).arity)).map() {
      [Int](
        repeating: $0,
        count: $0
      )
    }
    for empty in empties {
      XCTAssertLessThan(
        empty.count,
        type(of: self).arity
      )
      let probe = empty.adjacent9Tuples
      XCTAssertTrue(probe.isEmpty)
      XCTAssertEqual(
        probe.count,
        0
      )
      XCTAssertEqual(
        probe.startIndex,
        probe.endIndex
      )
    }
  }
  
  func testFirstNonEmpty() {
    let source = [0,1,2,3,4,5,6,7,8]
    let probe = source.adjacent9Tuples
    XCTAssertEqual(
      1,
      probe.count
    )
    XCTAssertNotEqual(
      probe.startIndex,
      probe.endIndex
    )
    XCTAssertEqual(
      type(of: probe).Element(0,1,2,3,4,5,6,7,8),
      probe[probe.startIndex]
    )
    XCTAssertEqual(
      probe.index(
        after: probe.startIndex
      ),
      probe.endIndex
    )
  }
  
  func testSpecificExample() {
    let source = [
      0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
    ]
    let probe = source.adjacent9Tuples
    let expectation = [
      type(of: probe).Element(0,1,2,3,4,5,6,7,8),
      type(of: probe).Element(1,2,3,4,5,6,7,8,9),
      type(of: probe).Element(2,3,4,5,6,7,8,9,10),
      type(of: probe).Element(3,4,5,6,7,8,9,10,11),
      type(of: probe).Element(4,5,6,7,8,9,10,11,12),
      type(of: probe).Element(5,6,7,8,9,10,11,12,13),
      type(of: probe).Element(6,7,8,9,10,11,12,13,14),
      type(of: probe).Element(7,8,9,10,11,12,13,14,15)
    ]
    XCTAssertEqual(
      probe.count,
      expectation.count
    )
    for (expected,obtained) in zip(expectation,probe) {
      XCTAssertEqual(
        expected,
        obtained
      )
    }
    var manualCount: Int = 0
    for _ in probe {
      manualCount += 1
    }
    XCTAssertEqual(
      probe.count,
      manualCount
    )
    
    for (linearIndex,element) in probe.enumerated() {
      XCTAssertEqual(
        element,
        probe[
          probe.index(
            probe.startIndex,
            offsetBy: linearIndex
          )
        ]
      )
    }
  }
  
}
