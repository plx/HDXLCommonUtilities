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

  func testArity2NullityCounts() {
    self.haltingOnFirstError {
      let arity = 2
      self.enumerateArity2Probes() {
        (p: Arity2Probe<Int?>) -> Void
        in
        let yNilCount =       countOfNil(p.a,p.b)
        let nNilCount =    countOfNonNil(p.a,p.b)
        let jNilCount = countOfNilStatus(p.a,p.b)
        XCTAssertEqual(
          arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          arity,
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
      self.enumerateArity3Probes() {
        (p: Arity3Probe<Int?>) -> Void
        in
        let yNilCount =       countOfNil(p.a,p.b,p.c)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c)
        XCTAssertEqual(
          arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          arity,
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
      self.enumerateArity4Probes() {
        (p: Arity4Probe<Int?>) -> Void
        in
        let yNilCount =       countOfNil(p.a,p.b,p.c,p.d)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c,p.d)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c,p.d)
        XCTAssertEqual(
          arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          arity,
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
      self.enumerateArity5Probes() {
        (p: Arity5Probe<Int?>) -> Void
        in
        let yNilCount =       countOfNil(p.a,p.b,p.c,p.d,p.e)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c,p.d,p.e)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c,p.d,p.e)
        XCTAssertEqual(
          arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          arity,
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
      self.enumerateArity6Probes() {
        (p: Arity6Probe<Int?>) -> Void
        in
        let yNilCount =       countOfNil(p.a,p.b,p.c,p.d,p.e,p.f)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c,p.d,p.e,p.f)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c,p.d,p.e,p.f)
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
      self.enumerateArity7Probes() {
        (p: Arity7Probe<Int?>) -> Void
        in
        let yNilCount =       countOfNil(p.a,p.b,p.c,p.d,p.e,p.f,p.g)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c,p.d,p.e,p.f,p.g)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c,p.d,p.e,p.f,p.g)
        XCTAssertEqual(
          arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          arity,
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
      self.enumerateArity8Probes() {
        (p: Arity8Probe<Int?>) -> Void
        in
        let yNilCount =       countOfNil(p.a,p.b,p.c,p.d,p.e,p.f,p.g,p.h)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c,p.d,p.e,p.f,p.g,p.h)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c,p.d,p.e,p.f,p.g,p.h)
        XCTAssertEqual(
          arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          arity,
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
      self.enumerateArity9Probes() {
        (p: Arity9Probe<Int?>) -> Void
        in
        let yNilCount =       countOfNil(p.a,p.b,p.c,p.d,p.e,p.f,p.g,p.h,p.i)
        let nNilCount =    countOfNonNil(p.a,p.b,p.c,p.d,p.e,p.f,p.g,p.h,p.i)
        let jNilCount = countOfNilStatus(p.a,p.b,p.c,p.d,p.e,p.f,p.g,p.h,p.i)
        XCTAssertEqual(
          arity,
          yNilCount + nNilCount
        )
        XCTAssertEqual(
          arity,
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

fileprivate extension NullityCountingTests {
  
  typealias Arity2Probe<T> = (a: T, b: T)
  typealias Arity3Probe<T> = (a: T, b: T, c: T)
  typealias Arity4Probe<T> = (a: T, b: T, c: T, d: T)
  typealias Arity5Probe<T> = (a: T, b: T, c: T, d: T, e: T)
  typealias Arity6Probe<T> = (a: T, b: T, c: T, d: T, e: T, f: T)
  typealias Arity7Probe<T> = (a: T, b: T, c: T, d: T, e: T, f: T, g: T)
  typealias Arity8Probe<T> = (a: T, b: T, c: T, d: T, e: T, f: T, g: T, h: T)
  typealias Arity9Probe<T> = (a: T, b: T, c: T, d: T, e: T, f: T, g: T, h: T, i: T)

  func enumerateArity2Probes(_ accessor: (Arity2Probe<Int?>) -> Void) {
    for a in self.aa {
      for b in self.bb {
        accessor((
          a: a,
          b: b
        ))
      }
    }
  }

  func enumerateArity3Probes(_ accessor: (Arity3Probe<Int?>) -> Void) {
    for a in self.aa {
      for b in self.bb {
        for c in self.cc {
          accessor((
            a: a,
            b: b,
            c: c
          ))
        }
      }
    }
  }

  func enumerateArity4Probes(_ accessor: (Arity4Probe<Int?>) -> Void) {
    for a in self.aa {
      for b in self.bb {
        for c in self.cc {
          for d in self.dd {
            accessor((
              a: a,
              b: b,
              c: c,
              d: d
            ))
          }
        }
      }
    }
  }

  func enumerateArity5Probes(_ accessor: (Arity5Probe<Int?>) -> Void) {
    for a in self.aa {
      for b in self.bb {
        for c in self.cc {
          for d in self.dd {
            for e in self.ee {
              accessor((
                a: a,
                b: b,
                c: c,
                d: d,
                e: e
              ))
            }
          }
        }
      }
    }
  }

  func enumerateArity6Probes(_ accessor: (Arity6Probe<Int?>) -> Void) {
    for a in self.aa {
      for b in self.bb {
        for c in self.cc {
          for d in self.dd {
            for e in self.ee {
              for f in self.ff {
                accessor((
                  a: a,
                  b: b,
                  c: c,
                  d: d,
                  e: e,
                  f: f
                ))
              }
            }
          }
        }
      }
    }
  }

  func enumerateArity7Probes(_ accessor: (Arity7Probe<Int?>) -> Void) {
    for a in self.aa {
      for b in self.bb {
        for c in self.cc {
          for d in self.dd {
            for e in self.ee {
              for f in self.ff {
                for g in self.gg {
                  accessor((
                    a: a,
                    b: b,
                    c: c,
                    d: d,
                    e: e,
                    f: f,
                    g: g
                  ))
                }
              }
            }
          }
        }
      }
    }
  }

  func enumerateArity8Probes(_ accessor: (Arity8Probe<Int?>) -> Void) {
    for a in self.aa {
      for b in self.bb {
        for c in self.cc {
          for d in self.dd {
            for e in self.ee {
              for f in self.ff {
                for g in self.gg {
                  for h in self.hh {
                    accessor((
                      a: a,
                      b: b,
                      c: c,
                      d: d,
                      e: e,
                      f: f,
                      g: g,
                      h: h
                    ))
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  func enumerateArity9Probes(_ accessor: (Arity9Probe<Int?>) -> Void) {
    for a in self.aa {
      for b in self.bb {
        for c in self.cc {
          for d in self.dd {
            for e in self.ee {
              for f in self.ff {
                for g in self.gg {
                  for h in self.hh {
                    for i in self.ii {
                      accessor((
                        a: a,
                        b: b,
                        c: c,
                        d: d,
                        e: e,
                        f: f,
                        g: g,
                        h: h,
                        i: i
                      ))
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

}

fileprivate extension Array {
  
  // clunky and lame but it'll work until i figure out the status of the algebraic
  // collection types:
  
  init(_ p: NullityCountingTests.Arity2Probe<Element>) {
    self.init()
    self.append(
      contentsOf: [
        p.a,
        p.b
      ]
    )
  }

  init(_ p: NullityCountingTests.Arity3Probe<Element>) {
    self.init()
    self.append(
      contentsOf: [
        p.a,
        p.b,
        p.c
      ]
    )
  }

  init(_ p: NullityCountingTests.Arity4Probe<Element>) {
    self.init()
    self.append(
      contentsOf: [
        p.a,
        p.b,
        p.c,
        p.d
      ]
    )
  }

  init(_ p: NullityCountingTests.Arity5Probe<Element>) {
    self.init()
    self.append(
      contentsOf: [
        p.a,
        p.b,
        p.c,
        p.d,
        p.e
      ]
    )
  }

  init(_ p: NullityCountingTests.Arity6Probe<Element>) {
    self.init()
    self.append(
      contentsOf: [
        p.a,
        p.b,
        p.c,
        p.d,
        p.e,
        p.f
      ]
    )
  }

  init(_ p: NullityCountingTests.Arity7Probe<Element>) {
    self.init()
    self.append(
      contentsOf: [
        p.a,
        p.b,
        p.c,
        p.d,
        p.e,
        p.f,
        p.g
      ]
    )
  }

  init(_ p: NullityCountingTests.Arity8Probe<Element>) {
    self.init()
    self.append(
      contentsOf: [
        p.a,
        p.b,
        p.c,
        p.d,
        p.e,
        p.f,
        p.g,
        p.h
      ]
    )
  }

  init(_ p: NullityCountingTests.Arity9Probe<Element>) {
    self.init()
    self.append(
      contentsOf: [
        p.a,
        p.b,
        p.c,
        p.d,
        p.e,
        p.f,
        p.g,
        p.h,
        p.i
      ]
    )
  }
  
}
