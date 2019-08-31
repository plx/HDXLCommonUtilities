//
//  UniformEqualityTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities

class UniformEqualityTests: XCTestCase {
  
  let v: [Int] = [
    1,2,3
  ]
  
  lazy var arity2Probes = InlineCartesianProduct(self.v, self.v)
  lazy var arity3Probes = InlineCartesianProduct(self.v, self.v, self.v)
  lazy var arity4Probes = InlineCartesianProduct(self.v, self.v, self.v, self.v)
  lazy var arity5Probes = InlineCartesianProduct(self.v, self.v, self.v, self.v, self.v)
  lazy var arity6Probes = InlineCartesianProduct(self.v, self.v, self.v, self.v, self.v, self.v)
  lazy var arity7Probes = InlineCartesianProduct(self.v, self.v, self.v, self.v, self.v, self.v, self.v)
  lazy var arity8Probes = InlineCartesianProduct(self.v, self.v, self.v, self.v, self.v, self.v, self.v, self.v)
  lazy var arity9Probes = InlineCartesianProduct(self.v, self.v, self.v, self.v, self.v, self.v, self.v, self.v, self.v)
  
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
      for probe in self.arity2Probes {
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: probe.allValues),
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
      for probe in self.arity3Probes {
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: probe.allValues),
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
      for probe in self.arity4Probes {
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: probe.allValues),
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
      for probe in self.arity5Probes {
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: probe.allValues),
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
      for probe in self.arity6Probes {
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: probe.allValues),
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
      for probe in self.arity7Probes {
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: probe.allValues),
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
      for probe in self.arity8Probes {
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: probe.allValues),
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
      for probe in self.arity9Probes {
        XCTAssertEqual(
          self.uniqueValueCountIsOne(for: probe.allValues),
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
