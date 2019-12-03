//
//  UniformEqualityTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
import HDXLTestingUtilities

class UniformEqualityTests: XCTestCase {
  
  let v: [Int] = [
    1,2,3
  ]
    
  private func uniqueValueCountIsOne(for values: [Int]) -> Bool {
    precondition(!values.isEmpty)
    var minimum = values[0]
    var maximum = values[0]
    for element in values.dropFirst() {
      minimum = Swift.min(minimum, element)
      maximum = Swift.max(maximum, element)
    }
    return minimum == maximum
  }
  
  func testArity2UniformEqualityManually() {
    XCTAssertTrue(
      allArgumentsMutuallyEqual(1, 1)
    )
    XCTAssertFalse(
      allArgumentsMutuallyEqual(0, 1)
    )
    XCTAssertFalse(
      allArgumentsMutuallyEqual(1, 0)
    )
    XCTAssertTrue(
      allArgumentsMutuallyEqual(0, 0)
    )
  }
  
  func testUniqueValueCountAtArity2Manually() {
    XCTAssertTrue(
      self.uniqueValueCountIsOne(for: [1, 1])
    )
    XCTAssertFalse(
      self.uniqueValueCountIsOne(for: [1, 0])
    )
    XCTAssertFalse(
      self.uniqueValueCountIsOne(for: [0, 1])
    )
    XCTAssertTrue(
      self.uniqueValueCountIsOne(for: [0, 0])
    )
  }

  func testArity2UniformEquality() {
    self.haltingOnFirstError {
      self.enumerateArity2Probes() {
        (probe: A2P) -> Void
        in
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: Array(probe)),
          allArgumentsMutuallyEqual(
            probe.a,
            probe.b
          )
        )
      }
    }
  }

  func testArity3UniformEquality() {
    self.haltingOnFirstError {
      self.enumerateArity3Probes() {
        (probe: A3P) -> Void
        in
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: Array(probe)),
          allArgumentsMutuallyEqual(
            probe.a,
            probe.b,
            probe.c
          )
        )
      }
    }
  }

  func testArity4UniformEquality() {
    self.haltingOnFirstError {
      self.enumerateArity4Probes() {
        (probe: A4P) -> Void
        in
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: Array(probe)),
          allArgumentsMutuallyEqual(
            probe.a,
            probe.b,
            probe.c,
            probe.d
          )
        )
      }
    }
  }

  func testArity5UniformEquality() {
    self.haltingOnFirstError {
      self.enumerateArity5Probes() {
        (probe: A5P) -> Void
        in
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: Array(probe)),
          allArgumentsMutuallyEqual(
            probe.a,
            probe.b,
            probe.c,
            probe.d,
            probe.e
          )
        )
      }
    }
  }

  func testArity6UniformEquality() {
    self.haltingOnFirstError {
      self.enumerateArity6Probes() {
        (probe: A6P) -> Void
        in
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: Array(probe)),
          allArgumentsMutuallyEqual(
            probe.a,
            probe.b,
            probe.c,
            probe.d,
            probe.e,
            probe.f
          )
        )
      }
    }
  }

  func testArity7UniformEquality() {
    self.haltingOnFirstError {
      self.enumerateArity7Probes() {
        (probe: A7P) -> Void
        in
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: Array(probe)),
          allArgumentsMutuallyEqual(
            probe.a,
            probe.b,
            probe.c,
            probe.d,
            probe.e,
            probe.f,
            probe.g
          )
        )
      }
    }
  }

  func testArity8UniformEquality() {
    self.haltingOnFirstError {
      self.enumerateArity8Probes() {
        (probe: A8P) -> Void
        in
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: Array(probe)),
          allArgumentsMutuallyEqual(
            probe.a,
            probe.b,
            probe.c,
            probe.d,
            probe.e,
            probe.f,
            probe.g,
            probe.h
          )
        )
      }
    }
  }

  func testArity9UniformEquality() {
    self.haltingOnFirstError {
      self.enumerateArity9Probes() {
        (probe: A9P) -> Void
        in
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: Array(probe)),
          allArgumentsMutuallyEqual(
            probe.a,
            probe.b,
            probe.c,
            probe.d,
            probe.e,
            probe.f,
            probe.g,
            probe.h,
            probe.i
          )
        )
      }
    }
  }

}

fileprivate extension UniformEqualityTests {
  
  typealias A2P = UniformArity2Probe<Int>
  typealias A3P = UniformArity3Probe<Int>
  typealias A4P = UniformArity4Probe<Int>
  typealias A5P = UniformArity5Probe<Int>
  typealias A6P = UniformArity6Probe<Int>
  typealias A7P = UniformArity7Probe<Int>
  typealias A8P = UniformArity8Probe<Int>
  typealias A9P = UniformArity9Probe<Int>

  func enumerateArity2Probes(using visitor: (A2P) -> Void) {
    EnumerateUniformProbes(
      self.v,
      using: visitor
    )
  }

  func enumerateArity3Probes(using visitor: (A3P) -> Void) {
    EnumerateUniformProbes(
      self.v,
      using: visitor
    )
  }

  func enumerateArity4Probes(using visitor: (A4P) -> Void) {
    EnumerateUniformProbes(
      self.v,
      using: visitor
    )
  }

  func enumerateArity5Probes(using visitor: (A5P) -> Void) {
    EnumerateUniformProbes(
      self.v,
      using: visitor
    )
  }

  func enumerateArity6Probes(using visitor: (A6P) -> Void) {
    EnumerateUniformProbes(
      self.v,
      using: visitor
    )
  }

  func enumerateArity7Probes(using visitor: (A7P) -> Void) {
    EnumerateUniformProbes(
      self.v,
      using: visitor
    )
  }

  func enumerateArity8Probes(using visitor: (A8P) -> Void) {
    EnumerateUniformProbes(
      self.v,
      using: visitor
    )
  }

  func enumerateArity9Probes(using visitor: (A9P) -> Void) {
    EnumerateUniformProbes(
      self.v,
      using: visitor
    )
  }
  
}
