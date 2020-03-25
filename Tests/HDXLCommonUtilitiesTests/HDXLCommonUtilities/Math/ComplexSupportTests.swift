//
//  ComplexSupportTests.swift
//

import XCTest
import Numerics
@testable import HDXLCommonUtilities

class ComplexSupportTests: XCTestCase {
  
  typealias CD = Complex<Double>
  typealias CF = Complex<Float>
  
  func testFinitenessForWellKnownValues() {
    XCTAssertTrue(
      CD.zero.isFinite
    )
    XCTAssertTrue(
      CD.one.isFinite
    )
    XCTAssertTrue(
      CD.i.isFinite
    )
    
    XCTAssertTrue(
      CF.zero.isFinite
    )
    XCTAssertTrue(
      CF.one.isFinite
    )
    XCTAssertTrue(
      CF.i.isFinite
    )

    XCTAssertFalse(
      CD.infinity.isFinite
    )
    XCTAssertFalse(
      CF.infinity.isFinite
    )
  }
  
  func testInfinityNormDistances() {
    
    XCTAssertEqual(
      0,
      CD.infinityNormDistance(
        from: .zero,
        to: .zero
      )
    )
    XCTAssertEqual(
      0,
      CF.infinityNormDistance(
        from: .zero,
        to: .zero
      )
    )
    
    XCTAssertEqual(
      0,
      CD.infinityNormDistance(
        from: .one,
        to: .one
      )
    )
    XCTAssertEqual(
      0,
      CF.infinityNormDistance(
        from: .one,
        to: .one
      )
    )

    XCTAssertEqual(
      0,
      CD.infinityNormDistance(
        from: .i,
        to: .i
      )
    )
    XCTAssertEqual(
      0,
      CF.infinityNormDistance(
        from: .i,
        to: .i
      )
    )

    XCTAssertEqual(
      1,
      CD.infinityNormDistance(
        from: .zero,
        to: .one
      )
    )
    XCTAssertEqual(
      1,
      CD.infinityNormDistance(
        from: .zero,
        to: .i
      )
    )
    XCTAssertEqual(
      1,
      CD.infinityNormDistance(
        from: .zero,
        to: (.one + .i)
      )
    )

    XCTAssertEqual(
      1,
      CD.infinityNormDistance(
        from: .one,
        to: .zero
      )
    )
    XCTAssertEqual(
      1,
      CD.infinityNormDistance(
        from: .i,
        to: .zero
      )
    )
    XCTAssertEqual(
      1,
      CD.infinityNormDistance(
        from: (.one + .i),
        to: .zero
      )
    )

    XCTAssertEqual(
      1,
      CF.infinityNormDistance(
        from: .zero,
        to: .one
      )
    )
    XCTAssertEqual(
      1,
      CF.infinityNormDistance(
        from: .zero,
        to: .i
      )
    )
    XCTAssertEqual(
      1,
      CF.infinityNormDistance(
        from: .zero,
        to: (.one + .i)
      )
    )

    XCTAssertEqual(
      1,
      CF.infinityNormDistance(
        from: .one,
        to: .zero
      )
    )
    XCTAssertEqual(
      1,
      CF.infinityNormDistance(
        from: .i,
        to: .zero
      )
    )
    XCTAssertEqual(
      1,
      CF.infinityNormDistance(
        from: (.one + .i),
        to: .zero
      )
    )

    XCTAssertEqual(
      1,
      CD.infinityNormDistance(
        from: .one,
        to: .i
      )
    )
    XCTAssertEqual(
      1,
      CD.infinityNormDistance(
        from: .one,
        to: .one + .i
      )
    )
    XCTAssertEqual(
      1,
      CD.infinityNormDistance(
        from: .i,
        to: .one
      )
    )
    XCTAssertEqual(
      1,
      CD.infinityNormDistance(
        from: .one + .i,
        to: .one
      )
    )
    XCTAssertEqual(
      1,
      CD.infinityNormDistance(
        from: .i,
        to: .one + .i
      )
    )
    XCTAssertEqual(
      1,
      CD.infinityNormDistance(
        from: .one + .i,
        to: .i
      )
    )

    XCTAssertEqual(
      1,
      CF.infinityNormDistance(
        from: .one,
        to: .i
      )
    )
    XCTAssertEqual(
      1,
      CF.infinityNormDistance(
        from: .one,
        to: .one + .i
      )
    )
    XCTAssertEqual(
      1,
      CF.infinityNormDistance(
        from: .i,
        to: .one
      )
    )
    XCTAssertEqual(
      1,
      CF.infinityNormDistance(
        from: .one + .i,
        to: .one
      )
    )
    XCTAssertEqual(
      1,
      CF.infinityNormDistance(
        from: .i,
        to: .one + .i
      )
    )
    XCTAssertEqual(
      1,
      CF.infinityNormDistance(
        from: .one + .i,
        to: .i
      )
    )

  }

}
