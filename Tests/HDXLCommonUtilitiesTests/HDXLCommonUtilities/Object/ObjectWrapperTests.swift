//
//  ObjectWrapperTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities

fileprivate final class IntegerWrapper : Equatable, Hashable {
  
  let value: Int
  
  required init(_ value: Int) {
    self.value = value
  }
  
  static func ==(
    lhs: IntegerWrapper,
    rhs: IntegerWrapper) -> Bool {
    return lhs === rhs || lhs.value == rhs.value
  }
  
  func hash(into hasher: inout Hasher) {
    self.value.hash(into: &hasher)
  }
  
}

class ObjectWrapperTests: XCTestCase {
  
  func testObjectEqualityIsByIdentity() {
    let first1 = IntegerWrapper(1)
    let other1 = IntegerWrapper(1)
    let first2 = IntegerWrapper(2)
    let other2 = IntegerWrapper(2)
    XCTAssertFalse(first1 === other1)
    XCTAssertFalse(first1 === first2)
    XCTAssertFalse(first1 === other2)
    XCTAssertFalse(other1 === first2)
    XCTAssertFalse(other1 === other2)
    XCTAssertFalse(first2 === other2)
    XCTAssertEqual(first1,other1)
    XCTAssertEqual(first2,other2)
    
    let wrappedFirst1 = ObjectWrapper(wrappedObject: first1)
    let wrappedOther1 = ObjectWrapper(wrappedObject: other1)
    let wrappedFirst2 = ObjectWrapper(wrappedObject: first2)
    let wrappedOther2 = ObjectWrapper(wrappedObject: other2)
    
    XCTAssertNotEqual(
      wrappedFirst1,
      wrappedOther1
    )
    XCTAssertNotEqual(
      wrappedFirst1,
      wrappedFirst2
    )
    XCTAssertNotEqual(
      wrappedFirst1,
      wrappedOther2
    )
    XCTAssertNotEqual(
      wrappedOther1,
      wrappedFirst2
    )
    XCTAssertNotEqual(
      wrappedOther1,
      wrappedOther2
    )
    XCTAssertNotEqual(
      wrappedFirst2,
      wrappedOther2
    )
    
    XCTAssertEqual(
      first1.hashValue,
      other1.hashValue
    )

    XCTAssertEqual(
      first2.hashValue,
      other2.hashValue
    )

    XCTAssertNotEqual(
      wrappedFirst1.hashValue,
      wrappedOther1.hashValue
    )
    
    XCTAssertNotEqual(
      wrappedFirst2.hashValue,
      wrappedOther2.hashValue
    )

  }
  
}
