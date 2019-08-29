//
//  InlineSortingTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities

class InlineSortingTests: XCTestCase {

  func testNaturalAscendingArrangement() {
    
    let lesser: Int = 1
    let greater: Int = 2
    
    XCTAssertTrue(
      naturalAscendingArrangement(lesser,greater)
      ==
      (lesser,greater)
    )
    XCTAssertTrue(
      naturalAscendingArrangement(greater,lesser)
      ==
      (lesser,greater)
    )

  }

  func testNaturalDescendingArrangement() {
    
    let lesser: Int = 1
    let greater: Int = 2
    
    XCTAssertTrue(
      naturalDescendingArrangement(lesser,greater)
      ==
      (greater,lesser)
    )
    XCTAssertTrue(
      naturalDescendingArrangement(greater,lesser)
      ==
      (greater,lesser)
    )

  }
  
  func testProjectedAscendingArrangement() {
    let shorter: [Int] = [10,11]
    let longer: [Int] = [1,2,3,4,5]
    
    XCTAssertTrue(
      (shorter,longer)
      ==
      projectedAscendingArrangement(shorter,longer) {
        $0.count
      }
    )
    XCTAssertTrue(
      (shorter,longer)
      ==
      projectedAscendingArrangement(longer,shorter) {
        $0.count
      }
    )

  }

  func testProjectedDescendingArrangement() {
    let shorter: [Int] = [10,11]
    let longer: [Int] = [1,2,3,4,5]
    
    XCTAssertTrue(
      (longer,shorter)
      ==
      projectedDescendingArrangement(shorter,longer) {
        $0.count
      }
    )
    XCTAssertTrue(
      (longer,shorter)
      ==
      projectedDescendingArrangement(longer,shorter) {
        $0.count
      }
    )

  }

  func testCustomizedAscendingArrangement() {
    
    let lesser: IntegerWrapper = IntegerWrapper(0)
    let greater: IntegerWrapper = IntegerWrapper(1)
    
    XCTAssertTrue(
      (lesser,greater)
      ==
      customizedAscendingArrangement(lesser, greater) {
        $0.value <=> $1.value
      }
    )

    XCTAssertTrue(
      (lesser,greater)
      ==
      customizedAscendingArrangement(greater, lesser) {
        $0.value <=> $1.value
      }
    )

  }

  func testCustomizedDescendingArrangement() {
    
    let lesser: IntegerWrapper = IntegerWrapper(0)
    let greater: IntegerWrapper = IntegerWrapper(1)
    
    XCTAssertTrue(
      (greater,lesser)
      ==
      customizedDescendingArrangement(lesser, greater) {
        $0.value <=> $1.value
      }
    )

    XCTAssertTrue(
      (greater,lesser)
      ==
      customizedDescendingArrangement(greater, lesser) {
        $0.value <=> $1.value
      }
    )

  }

}

fileprivate final class IntegerWrapper : Equatable {
  
  let value: Int
  
  required init(_ value: Int) {
    self.value = value
  }
  
  static func ==(
    lhs: IntegerWrapper,
    rhs: IntegerWrapper) -> Bool {
    return lhs === rhs || lhs.value == rhs.value
  }
  
}
