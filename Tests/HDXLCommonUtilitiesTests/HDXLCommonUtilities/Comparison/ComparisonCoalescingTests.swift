//
//  ComparisonCoalescingTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities

class ComparisonCoalescingTests: XCTestCase {

  let values: [ComparisonResult] = [.orderedAscending, .orderedSame, .orderedDescending]
  
  lazy var arity2Probes = CartesianProduct(self.values, self.values)
  lazy var arity3Probes = CartesianProduct(self.values, self.values, self.values)
  lazy var arity4Probes = CartesianProduct(self.values, self.values, self.values, self.values)
  lazy var arity5Probes = CartesianProduct(self.values, self.values, self.values, self.values, self.values)
  lazy var arity6Probes = CartesianProduct(self.values, self.values, self.values, self.values, self.values, self.values)
  lazy var arity7Probes = CartesianProduct(self.values, self.values, self.values, self.values, self.values, self.values, self.values)
  lazy var arity8Probes = CartesianProduct(self.values, self.values, self.values, self.values, self.values, self.values, self.values, self.values)
  lazy var arity9Probes = CartesianProduct(self.values, self.values, self.values, self.values, self.values, self.values, self.values, self.values, self.values)
  
  private func manuallyCoalesce(results: [ComparisonResult]) -> ComparisonResult {
    return results.first(where: { $0 != .orderedSame}) ?? .orderedSame
  }
  
  func testArity2CoalescenceByHand() {
    
    // (.orderedAscending, _) cases
    XCTAssertEqual(
      ComparisonResult.orderedAscending,
      ComparisonResult.coalescing(
        .orderedAscending,
        .orderedAscending
      )
    )
    XCTAssertEqual(
      ComparisonResult.orderedAscending,
      ComparisonResult.coalescing(
        .orderedAscending,
        .orderedSame
      )
    )
    XCTAssertEqual(
      ComparisonResult.orderedAscending,
      ComparisonResult.coalescing(
        .orderedAscending,
        .orderedDescending
      )
    )

    // (.orderedSame, _) cases
    XCTAssertEqual(
      ComparisonResult.orderedAscending,
      ComparisonResult.coalescing(
        .orderedSame,
        .orderedAscending
      )
    )
    XCTAssertEqual(
      ComparisonResult.orderedSame,
      ComparisonResult.coalescing(
        .orderedSame,
        .orderedSame
      )
    )
    XCTAssertEqual(
      ComparisonResult.orderedDescending,
      ComparisonResult.coalescing(
        .orderedSame,
        .orderedDescending
      )
    )

    // (.orderedDescending, _) cases
    XCTAssertEqual(
      ComparisonResult.orderedDescending,
      ComparisonResult.coalescing(
        .orderedDescending,
        .orderedAscending
      )
    )
    XCTAssertEqual(
      ComparisonResult.orderedDescending,
      ComparisonResult.coalescing(
        .orderedDescending,
        .orderedSame
      )
    )
    XCTAssertEqual(
      ComparisonResult.orderedDescending,
      ComparisonResult.coalescing(
        .orderedDescending,
        .orderedDescending
      )
    )

  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Exhaustive Tests
  // ------------------------------------------------------------------------ //

  func testArity2Coalescence() {
    self.haltingOnFirstError {
      for probe in self.arity2Probes {
        XCTAssertEqual(
          self.manuallyCoalesce(results: probe.allValues),
          ComparisonResult.coalescing(
            probe.a,
            probe.b
          )
        )
      }
    }
  }

  func testArity3Coalescence() {
    self.haltingOnFirstError {
      for probe in self.arity3Probes {
        XCTAssertEqual(
          self.manuallyCoalesce(results: probe.allValues),
          ComparisonResult.coalescing(
            probe.a,
            probe.b,
            probe.c
          )
        )
      }
    }
  }

  func testArity4Coalescence() {
    self.haltingOnFirstError {
      for probe in self.arity4Probes {
        XCTAssertEqual(
          self.manuallyCoalesce(results: probe.allValues),
          ComparisonResult.coalescing(
            probe.a,
            probe.b,
            probe.c,
            probe.d
          )
        )
      }
    }
  }

  func testArity5Coalescence() {
    self.haltingOnFirstError {
      for probe in self.arity5Probes {
        XCTAssertEqual(
          self.manuallyCoalesce(results: probe.allValues),
          ComparisonResult.coalescing(
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

  func testArity6Coalescence() {
    self.haltingOnFirstError {
      for probe in self.arity6Probes {
        XCTAssertEqual(
          self.manuallyCoalesce(results: probe.allValues),
          ComparisonResult.coalescing(
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

  func testArity7Coalescence() {
    self.haltingOnFirstError {
      for probe in self.arity7Probes {
        XCTAssertEqual(
          self.manuallyCoalesce(results: probe.allValues),
          ComparisonResult.coalescing(
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

  func testArity8Coalescence() {
    self.haltingOnFirstError {
      for probe in self.arity8Probes {
        XCTAssertEqual(
          self.manuallyCoalesce(results: probe.allValues),
          ComparisonResult.coalescing(
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

  func testArity9Coalescence() {
    self.haltingOnFirstError {
      for probe in self.arity9Probes {
        XCTAssertEqual(
          self.manuallyCoalesce(results: probe.allValues),
          ComparisonResult.coalescing(
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
