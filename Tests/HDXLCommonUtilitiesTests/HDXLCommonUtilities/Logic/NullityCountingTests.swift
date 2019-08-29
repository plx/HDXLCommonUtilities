//
//  NullityCountingTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities

class NullityCountingTests: XCTestCase {
  
  let aa: [Int?] = [1, nil]
  let bb: [Int?] = [2, nil]
  let cc: [Int?] = [3, nil]
  let dd: [Int?] = [4, nil]
  let ee: [Int?] = [5, nil]
  let ff: [Int?] = [6, nil]
  let gg: [Int?] = [7, nil]
  let hh: [Int?] = [8, nil]
  let ii: [Int?] = [9, nil]
  
  lazy var arity2Probes = InlineCartesianProduct(self.aa, self.bb)
  lazy var arity3Probes = InlineCartesianProduct(self.aa, self.bb, self.cc)
  lazy var arity4Probes = InlineCartesianProduct(self.aa, self.bb, self.cc, self.dd)
  lazy var arity5Probes = InlineCartesianProduct(self.aa, self.bb, self.cc, self.dd, self.ee)
  lazy var arity6Probes = InlineCartesianProduct(self.aa, self.bb, self.cc, self.dd, self.ee, self.ff)
  lazy var arity7Probes = InlineCartesianProduct(self.aa, self.bb, self.cc, self.dd, self.ee, self.ff, self.gg)
  lazy var arity8Probes = InlineCartesianProduct(self.aa, self.bb, self.cc, self.dd, self.ee, self.ff, self.gg, self.hh)
  lazy var arity9Probes = InlineCartesianProduct(self.aa, self.bb, self.cc, self.dd, self.ee, self.ff, self.gg, self.hh, self.ii)

  func testArity2NullityCounts() {
    self.haltingOnFirstError {
      let arity = 2
      for p in self.arity2Probes {
        XCTAssertEqual(
          arity,
          type(of: p).arity
        )
        let yNilCount =       countOfNil(p.a,p.b)
        let nNilCount =    countOfNonNil(p.a,p.b)
        let jNilCount = countOfNilStatus(p.a,p.b)
        XCTAssertEqual(
          type(of: p).arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          type(of: p).arity,
          jNilCount.count
        )
        XCTAssertEqual(
          yNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          nNilCount,
          jNilCount.countOfNonNil
        )
        // manual count
        var manualNilCount: Int = 0
        var manualNonNilCount: Int = 0
        for v in Array(p) {
          switch v {
          case .none:
            manualNilCount += 1
          case .some(_):
            manualNonNilCount += 1
          }
        }
        let manualCount = manualNilCount + manualNonNilCount
        XCTAssertEqual(
          arity,
          manualCount
        )
        XCTAssertEqual(
          manualNilCount,
          yNilCount
        )
        XCTAssertEqual(
          manualNonNilCount,
          nNilCount
        )
        XCTAssertEqual(
          manualNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          manualNonNilCount,
          jNilCount.countOfNonNil
        )
      }
    }
  }

  func testArity3NullityCounts() {
    self.haltingOnFirstError {
      let arity = 3
      for p in self.arity3Probes {
        XCTAssertEqual(
          arity,
          type(of: p).arity
        )
        let yNilCount =       countOfNil(p.a,p.b,p.c)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c)
        XCTAssertEqual(
          type(of: p).arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          type(of: p).arity,
          jNilCount.count
        )
        XCTAssertEqual(
          yNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          nNilCount,
          jNilCount.countOfNonNil
        )
        // manual count
        var manualNilCount: Int = 0
        var manualNonNilCount: Int = 0
        for v in Array(p) {
          switch v {
          case .none:
            manualNilCount += 1
          case .some(_):
            manualNonNilCount += 1
          }
        }
        let manualCount = manualNilCount + manualNonNilCount
        XCTAssertEqual(
          arity,
          manualCount
        )
        XCTAssertEqual(
          manualNilCount,
          yNilCount
        )
        XCTAssertEqual(
          manualNonNilCount,
          nNilCount
        )
        XCTAssertEqual(
          manualNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          manualNonNilCount,
          jNilCount.countOfNonNil
        )
      }
    }
  }

  func testArity4NullityCounts() {
    self.haltingOnFirstError {
      let arity = 4
      for p in self.arity4Probes {
        XCTAssertEqual(
          arity,
          type(of: p).arity
        )
        let yNilCount =       countOfNil(p.a,p.b,p.c,p.d)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c,p.d)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c,p.d)
        XCTAssertEqual(
          type(of: p).arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          type(of: p).arity,
          jNilCount.count
        )
        XCTAssertEqual(
          yNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          nNilCount,
          jNilCount.countOfNonNil
        )
        // manual count
        var manualNilCount: Int = 0
        var manualNonNilCount: Int = 0
        for v in Array(p) {
          switch v {
          case .none:
            manualNilCount += 1
          case .some(_):
            manualNonNilCount += 1
          }
        }
        let manualCount = manualNilCount + manualNonNilCount
        XCTAssertEqual(
          arity,
          manualCount
        )
        XCTAssertEqual(
          manualNilCount,
          yNilCount
        )
        XCTAssertEqual(
          manualNonNilCount,
          nNilCount
        )
        XCTAssertEqual(
          manualNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          manualNonNilCount,
          jNilCount.countOfNonNil
        )
      }
    }
  }

  func testArity5NullityCounts() {
    self.haltingOnFirstError {
      let arity = 5
      for p in self.arity5Probes {
        XCTAssertEqual(
          arity,
          type(of: p).arity
        )
        let yNilCount =       countOfNil(p.a,p.b,p.c,p.d,p.e)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c,p.d,p.e)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c,p.d,p.e)
        XCTAssertEqual(
          type(of: p).arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          type(of: p).arity,
          jNilCount.count
        )
        XCTAssertEqual(
          yNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          nNilCount,
          jNilCount.countOfNonNil
        )
        // manual count
        var manualNilCount: Int = 0
        var manualNonNilCount: Int = 0
        for v in Array(p) {
          switch v {
          case .none:
            manualNilCount += 1
          case .some(_):
            manualNonNilCount += 1
          }
        }
        let manualCount = manualNilCount + manualNonNilCount
        XCTAssertEqual(
          arity,
          manualCount
        )
        XCTAssertEqual(
          manualNilCount,
          yNilCount
        )
        XCTAssertEqual(
          manualNonNilCount,
          nNilCount
        )
        XCTAssertEqual(
          manualNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          manualNonNilCount,
          jNilCount.countOfNonNil
        )
      }
    }
  }

  func testArity6NullityCounts() {
    self.haltingOnFirstError {
      let arity = 6
      for p in self.arity6Probes {
        XCTAssertEqual(
          arity,
          type(of: p).arity
        )
        let yNilCount =       countOfNil(p.a,p.b,p.c,p.d,p.e,p.f)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c,p.d,p.e,p.f)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c,p.d,p.e,p.f)
        XCTAssertEqual(
          type(of: p).arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          type(of: p).arity,
          jNilCount.count
        )
        XCTAssertEqual(
          yNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          nNilCount,
          jNilCount.countOfNonNil
        )
        // manual count
        var manualNilCount: Int = 0
        var manualNonNilCount: Int = 0
        for v in Array(p) {
          switch v {
          case .none:
            manualNilCount += 1
          case .some(_):
            manualNonNilCount += 1
          }
        }
        let manualCount = manualNilCount + manualNonNilCount
        XCTAssertEqual(
          arity,
          manualCount
        )
        XCTAssertEqual(
          manualNilCount,
          yNilCount
        )
        XCTAssertEqual(
          manualNonNilCount,
          nNilCount
        )
        XCTAssertEqual(
          manualNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          manualNonNilCount,
          jNilCount.countOfNonNil
        )
      }
    }
  }

  func testArity7NullityCounts() {
    self.haltingOnFirstError {
      let arity = 7
      for p in self.arity7Probes {
        XCTAssertEqual(
          arity,
          type(of: p).arity
        )
        let yNilCount =       countOfNil(p.a,p.b,p.c,p.d,p.e,p.f,p.g)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c,p.d,p.e,p.f,p.g)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c,p.d,p.e,p.f,p.g)
        XCTAssertEqual(
          type(of: p).arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          type(of: p).arity,
          jNilCount.count
        )
        XCTAssertEqual(
          yNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          nNilCount,
          jNilCount.countOfNonNil
        )
        // manual count
        var manualNilCount: Int = 0
        var manualNonNilCount: Int = 0
        for v in Array(p) {
          switch v {
          case .none:
            manualNilCount += 1
          case .some(_):
            manualNonNilCount += 1
          }
        }
        let manualCount = manualNilCount + manualNonNilCount
        XCTAssertEqual(
          arity,
          manualCount
        )
        XCTAssertEqual(
          manualNilCount,
          yNilCount
        )
        XCTAssertEqual(
          manualNonNilCount,
          nNilCount
        )
        XCTAssertEqual(
          manualNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          manualNonNilCount,
          jNilCount.countOfNonNil
        )
      }
    }
  }

  func testArity8NullityCounts() {
    self.haltingOnFirstError {
      let arity = 8
      for p in self.arity8Probes {
        XCTAssertEqual(
          arity,
          type(of: p).arity
        )
        let yNilCount =       countOfNil(p.a,p.b,p.c,p.d,p.e,p.f,p.g,p.h)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c,p.d,p.e,p.f,p.g,p.h)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c,p.d,p.e,p.f,p.g,p.h)
        XCTAssertEqual(
          type(of: p).arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          type(of: p).arity,
          jNilCount.count
        )
        XCTAssertEqual(
          yNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          nNilCount,
          jNilCount.countOfNonNil
        )
        // manual count
        var manualNilCount: Int = 0
        var manualNonNilCount: Int = 0
        for v in Array(p) {
          switch v {
          case .none:
            manualNilCount += 1
          case .some(_):
            manualNonNilCount += 1
          }
        }
        let manualCount = manualNilCount + manualNonNilCount
        XCTAssertEqual(
          arity,
          manualCount
        )
        XCTAssertEqual(
          manualNilCount,
          yNilCount
        )
        XCTAssertEqual(
          manualNonNilCount,
          nNilCount
        )
        XCTAssertEqual(
          manualNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          manualNonNilCount,
          jNilCount.countOfNonNil
        )
      }
    }
  }

  func testArity9NullityCounts() {
    self.haltingOnFirstError {
      let arity = 9
      for p in self.arity9Probes {
        XCTAssertEqual(
          arity,
          type(of: p).arity
        )
        let yNilCount =       countOfNil(p.a,p.b,p.c,p.d,p.e,p.f,p.g,p.h,p.i)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c,p.d,p.e,p.f,p.g,p.h,p.i)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c,p.d,p.e,p.f,p.g,p.h,p.i)
        XCTAssertEqual(
          type(of: p).arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          type(of: p).arity,
          jNilCount.count
        )
        XCTAssertEqual(
          yNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          nNilCount,
          jNilCount.countOfNonNil
        )
        // manual count
        var manualNilCount: Int = 0
        var manualNonNilCount: Int = 0
        for v in Array(p) {
          switch v {
          case .none:
            manualNilCount += 1
          case .some(_):
            manualNonNilCount += 1
          }
        }
        let manualCount = manualNilCount + manualNonNilCount
        XCTAssertEqual(
          arity,
          manualCount
        )
        XCTAssertEqual(
          manualNilCount,
          yNilCount
        )
        XCTAssertEqual(
          manualNonNilCount,
          nNilCount
        )
        XCTAssertEqual(
          manualNilCount,
          jNilCount.countOfNil
        )
        XCTAssertEqual(
          manualNonNilCount,
          jNilCount.countOfNonNil
        )
      }
    }
  }
  
}
