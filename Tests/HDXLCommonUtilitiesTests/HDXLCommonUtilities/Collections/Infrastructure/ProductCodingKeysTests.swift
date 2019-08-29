//
//  ProductCodingKeysTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class ProductCodingKeysTests: XCTestCase {
  
  func testArity2ProductCodingKeys() {
    XCTAssertEqual(
      2,
      Arity2ProductCodingKeys.allCases.count
    )
    XCTAssertEqual(
      Arity2ProductCodingKeys.allCases.count,
      Set<String>(
        Arity2ProductCodingKeys.allCases.map() {$0.stringValue}
      ).count
    )
    for key in Arity2ProductCodingKeys.allCases {
      XCTAssertNotNil(key.intValue)
      XCTAssertEqual(
        key,
        Arity2ProductCodingKeys(intValue: key.intValue!)
      )
    }
    XCTAssertEqual(
      Arity2ProductCodingKeys.allCases.count,
      Set<Int>(
        Arity2ProductCodingKeys.allCases.map() { $0.intValue! }
      ).count
    )
  }

  func testArity3ProductCodingKeys() {
    XCTAssertEqual(
      3,
      Arity3ProductCodingKeys.allCases.count
    )
    XCTAssertEqual(
      Arity3ProductCodingKeys.allCases.count,
      Set<String>(
        Arity3ProductCodingKeys.allCases.map() {$0.stringValue}
      ).count
    )
    for key in Arity3ProductCodingKeys.allCases {
      XCTAssertNotNil(key.intValue)
      XCTAssertEqual(
        key,
        Arity3ProductCodingKeys(intValue: key.intValue!)
      )
    }
    XCTAssertEqual(
      Arity3ProductCodingKeys.allCases.count,
      Set<Int>(
        Arity3ProductCodingKeys.allCases.map() { $0.intValue! }
      ).count
    )
  }

  func testArity4ProductCodingKeys() {
    XCTAssertEqual(
      4,
      Arity4ProductCodingKeys.allCases.count
    )
    XCTAssertEqual(
      Arity4ProductCodingKeys.allCases.count,
      Set<String>(
        Arity4ProductCodingKeys.allCases.map() {$0.stringValue}
      ).count
    )
    for key in Arity4ProductCodingKeys.allCases {
      XCTAssertNotNil(key.intValue)
      XCTAssertEqual(
        key,
        Arity4ProductCodingKeys(intValue: key.intValue!)
      )
    }
    XCTAssertEqual(
      Arity4ProductCodingKeys.allCases.count,
      Set<Int>(
        Arity4ProductCodingKeys.allCases.map() { $0.intValue! }
      ).count
    )
  }

  func testArity5ProductCodingKeys() {
    XCTAssertEqual(
      5,
      Arity5ProductCodingKeys.allCases.count
    )
    XCTAssertEqual(
      Arity5ProductCodingKeys.allCases.count,
      Set<String>(
        Arity5ProductCodingKeys.allCases.map() {$0.stringValue}
      ).count
    )
    for key in Arity5ProductCodingKeys.allCases {
      XCTAssertNotNil(key.intValue)
      XCTAssertEqual(
        key,
        Arity5ProductCodingKeys(intValue: key.intValue!)
      )
    }
    XCTAssertEqual(
      Arity5ProductCodingKeys.allCases.count,
      Set<Int>(
        Arity5ProductCodingKeys.allCases.map() { $0.intValue! }
      ).count
    )
  }

  func testArity6ProductCodingKeys() {
    XCTAssertEqual(
      6,
      Arity6ProductCodingKeys.allCases.count
    )
    XCTAssertEqual(
      Arity6ProductCodingKeys.allCases.count,
      Set<String>(
        Arity6ProductCodingKeys.allCases.map() {$0.stringValue}
      ).count
    )
    for key in Arity6ProductCodingKeys.allCases {
      XCTAssertNotNil(key.intValue)
      XCTAssertEqual(
        key,
        Arity6ProductCodingKeys(intValue: key.intValue!)
      )
    }
    XCTAssertEqual(
      Arity6ProductCodingKeys.allCases.count,
      Set<Int>(
        Arity6ProductCodingKeys.allCases.map() { $0.intValue! }
      ).count
    )
  }

  func testArity7ProductCodingKeys() {
    XCTAssertEqual(
      7,
      Arity7ProductCodingKeys.allCases.count
    )
    XCTAssertEqual(
      Arity7ProductCodingKeys.allCases.count,
      Set<String>(
        Arity7ProductCodingKeys.allCases.map() {$0.stringValue}
      ).count
    )
    for key in Arity7ProductCodingKeys.allCases {
      XCTAssertNotNil(key.intValue)
      XCTAssertEqual(
        key,
        Arity7ProductCodingKeys(intValue: key.intValue!)
      )
    }
    XCTAssertEqual(
      Arity7ProductCodingKeys.allCases.count,
      Set<Int>(
        Arity7ProductCodingKeys.allCases.map() { $0.intValue! }
      ).count
    )
  }

  func testArity8ProductCodingKeys() {
    XCTAssertEqual(
      8,
      Arity8ProductCodingKeys.allCases.count
    )
    XCTAssertEqual(
      Arity8ProductCodingKeys.allCases.count,
      Set<String>(
        Arity8ProductCodingKeys.allCases.map() {$0.stringValue}
      ).count
    )
    for key in Arity8ProductCodingKeys.allCases {
      XCTAssertNotNil(key.intValue)
      XCTAssertEqual(
        key,
        Arity8ProductCodingKeys(intValue: key.intValue!)
      )
    }
    XCTAssertEqual(
      Arity8ProductCodingKeys.allCases.count,
      Set<Int>(
        Arity8ProductCodingKeys.allCases.map() { $0.intValue! }
      ).count
    )
  }

  func testArity9ProductCodingKeys() {
    XCTAssertEqual(
      9,
      Arity9ProductCodingKeys.allCases.count
    )
    XCTAssertEqual(
      Arity9ProductCodingKeys.allCases.count,
      Set<String>(
        Arity9ProductCodingKeys.allCases.map() {$0.stringValue}
      ).count
    )
    for key in Arity9ProductCodingKeys.allCases {
      XCTAssertNotNil(key.intValue)
      XCTAssertEqual(
        key,
        Arity9ProductCodingKeys(intValue: key.intValue!)
      )
    }
    XCTAssertEqual(
      Arity9ProductCodingKeys.allCases.count,
      Set<Int>(
        Arity9ProductCodingKeys.allCases.map() { $0.intValue! }
      ).count
    )
  }

}
