//
//  ComparisonCoalescingTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
import HDXLTestingUtilities

class ComparisonCoalescingTests: XCTestCase {

  let values: [ComparisonResult] = [.orderedAscending, .orderedSame, .orderedDescending]
  
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
      self.enumerateArity2Probes() {
        (probe: A2P) -> Void
        in
        XCTAssertEqual(
          self.manuallyCoalesce(results: Array(probe)),
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
      self.enumerateArity3Probes() {
        (probe: A3P) -> Void
        in
        XCTAssertEqual(
          self.manuallyCoalesce(results: Array(probe)),
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
      self.enumerateArity4Probes() {
        (probe: A4P) -> Void
        in
        XCTAssertEqual(
          self.manuallyCoalesce(results: Array(probe)),
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
      self.enumerateArity5Probes() {
        (probe: A5P) -> Void
        in
        XCTAssertEqual(
          self.manuallyCoalesce(results: Array(probe)),
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
      self.enumerateArity6Probes() {
        (probe: A6P) -> Void
        in
        XCTAssertEqual(
          self.manuallyCoalesce(results: Array(probe)),
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
      self.enumerateArity7Probes() {
        (probe: A7P) -> Void
        in
        XCTAssertEqual(
          self.manuallyCoalesce(results: Array(probe)),
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
      self.enumerateArity8Probes() {
        (probe: A8P) -> Void
        in
        XCTAssertEqual(
          self.manuallyCoalesce(results: Array(probe)),
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
      self.enumerateArity9Probes() {
        (probe: A9P) -> Void
        in
        XCTAssertEqual(
          self.manuallyCoalesce(results: Array(probe)),
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

fileprivate extension ComparisonCoalescingTests {
  
  typealias A2P = UniformArity2Probe<ComparisonResult>
  typealias A3P = UniformArity3Probe<ComparisonResult>
  typealias A4P = UniformArity4Probe<ComparisonResult>
  typealias A5P = UniformArity5Probe<ComparisonResult>
  typealias A6P = UniformArity6Probe<ComparisonResult>
  typealias A7P = UniformArity7Probe<ComparisonResult>
  typealias A8P = UniformArity8Probe<ComparisonResult>
  typealias A9P = UniformArity9Probe<ComparisonResult>

  func enumerateArity2Probes(using visitor: (A2P) -> Void) {
    EnumerateUniformProbes(
      self.values,
      using: visitor
    )
  }

  func enumerateArity3Probes(using visitor: (A3P) -> Void) {
    EnumerateUniformProbes(
      self.values,
      using: visitor
    )
  }

  func enumerateArity4Probes(using visitor: (A4P) -> Void) {
    EnumerateUniformProbes(
      self.values,
      using: visitor
    )
  }

  func enumerateArity5Probes(using visitor: (A5P) -> Void) {
    EnumerateUniformProbes(
      self.values,
      using: visitor
    )
  }

  func enumerateArity6Probes(using visitor: (A6P) -> Void) {
    EnumerateUniformProbes(
      self.values,
      using: visitor
    )
  }

  func enumerateArity7Probes(using visitor: (A7P) -> Void) {
    EnumerateUniformProbes(
      self.values,
      using: visitor
    )
  }

  func enumerateArity8Probes(using visitor: (A8P) -> Void) {
    EnumerateUniformProbes(
      self.values,
      using: visitor
    )
  }

  func enumerateArity9Probes(using visitor: (A9P) -> Void) {
    EnumerateUniformProbes(
      self.values,
      using: visitor
    )
  }
  
}
