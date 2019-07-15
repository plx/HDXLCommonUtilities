//
//  Chain9CollectionTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class Chain9CollectionTests: XCTestCase {
  
  func testEmptyChain() {
    let empty: [Int] = []
    HDXLAssertCollectionIndexSanity(
      Chain9Collection(
        empty,
        empty,
        empty,
        empty,
        empty,
        empty,
        empty,
        empty,
        empty
      )
    )
  }

  func testRangeCollections() {
    let range = 0...3
    let lengthRanges = InlineProduct9Collection(
      range,
      range,
      range,
      range,
      range,
      range,
      range,
      range,
      range
    )
    self.haltingOnFirstError() {
      lengthRanges.stridedConcurrentVisit(stride: 100) {
        (lengths: UniformInlineProduct9<Int>) -> Void
        in
        let aRange = 0..<lengths.a
        let bRange = aRange.upperBound..<(aRange.upperBound + lengths.b)
        let cRange = bRange.upperBound..<(bRange.upperBound + lengths.c)
        let dRange = cRange.upperBound..<(cRange.upperBound + lengths.d)
        let eRange = dRange.upperBound..<(dRange.upperBound + lengths.e)
        let fRange = eRange.upperBound..<(eRange.upperBound + lengths.f)
        let gRange = fRange.upperBound..<(fRange.upperBound + lengths.g)
        let hRange = gRange.upperBound..<(gRange.upperBound + lengths.h)
        let iRange = hRange.upperBound..<(hRange.upperBound + lengths.i)
        let count = iRange.upperBound
        let probeChain = Chain9Collection(
          aRange,
          bRange,
          cRange,
          dRange,
          eRange,
          fRange,
          gRange,
          hRange,
          iRange
        )
        XCTAssertEqual(
          probeChain.count,
          count
        )
        XCTAssertEqual(
          probeChain.count == 0,
          probeChain.isEmpty
        )
        HDXLAssertCollectionBasicSanity(
          probeChain
        )
        HDXLAssertCollectionIndexSanity(
          probeChain
        )
      }
    }
  }
  
}
