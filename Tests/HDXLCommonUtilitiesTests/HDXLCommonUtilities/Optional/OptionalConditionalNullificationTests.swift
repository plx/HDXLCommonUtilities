//
//  OptionalConditionalNullificationTests.swift
//

import XCTest
@testable import HDXLCommonUtilities

fileprivate extension Int {
  
  mutating func increment(returning result: Bool) -> Bool {
    self += 1
    return result
  }
  
}

class OptionalConditionalNullificationTests: XCTestCase {
  
  func testConditionalNullificationFromNil() {
    
    var alreadyNil: Int? = nil
    alreadyNil.nullify(when: false)
    XCTAssertNil(alreadyNil)
    alreadyNil.nullify(when: true)
    XCTAssertNil(alreadyNil)

    var counter: Int = 0
    
    alreadyNil.nullify(when: counter.increment(returning: true))
    XCTAssertNil(alreadyNil)
    XCTAssertEqual(
      0,
      counter
    )
    alreadyNil.nullify(when: counter.increment(returning: false))
    XCTAssertNil(alreadyNil)
    XCTAssertEqual(
      0,
      counter
    )

  }
  
  func testConditionalNullificationFromNonNil() {
    
    var startsNotNil: Int? = 1
    var counter: Int = 0
    
    startsNotNil.nullify(when: counter.increment(returning: false))
    XCTAssertNotNil(startsNotNil)
    XCTAssertEqual(
      counter,
      1
    )
    
    startsNotNil.nullify(when: counter.increment(returning: true))
    XCTAssertNil(startsNotNil)
    XCTAssertEqual(
      counter,
      2
    )
    
  }
  
}
