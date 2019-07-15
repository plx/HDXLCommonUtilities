//
//  InlineProduct9CollectionBasicTests.swift
//

import Foundation
import XCTest
@testable import HDXLCommonUtilities
@testable import HDXLTestingUtilities

class InlineProduct9CollectionBasicTests: XCTestCase {
  
  func testEmptyProduct() {
    let empty: [Int] = []
    HDXLAssertCollectionBasicSanity(empty)
    HDXLAssertCollectionIndexSanity(
      InlineProduct9Collection(
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
  
  func testSingleEmptyPosition() {
    let range = 0..<1
    let empty = 0..<0
    let allButA = InlineProduct9Collection(
      empty,
      range,
      range,
      range,
      range,
      range,
      range,
      range,
      range
    )
    let allButB = InlineProduct9Collection(
      range,
      empty,
      range,
      range,
      range,
      range,
      range,
      range,
      range
    )
    let allButC = InlineProduct9Collection(
      range,
      range,
      empty,
      range,
      range,
      range,
      range,
      range,
      range
    )
    let allButD = InlineProduct9Collection(
      range,
      range,
      range,
      empty,
      range,
      range,
      range,
      range,
      range
    )
    let allButE = InlineProduct9Collection(
      range,
      range,
      range,
      range,
      empty,
      range,
      range,
      range,
      range
    )
    let allButF = InlineProduct9Collection(
      range,
      range,
      range,
      range,
      range,
      empty,
      range,
      range,
      range
    )
    let allButG = InlineProduct9Collection(
      range,
      range,
      range,
      range,
      range,
      range,
      empty,
      range,
      range
    )
    let allButH = InlineProduct9Collection(
      range,
      range,
      range,
      range,
      range,
      range,
      range,
      empty,
      range
    )
    let allButI = InlineProduct9Collection(
      range,
      range,
      range,
      range,
      range,
      range,
      range,
      range,
      empty
    )
    HDXLAssertCollectionBasicSanity(allButA)
    HDXLAssertCollectionBasicSanity(allButB)
    HDXLAssertCollectionBasicSanity(allButC)
    HDXLAssertCollectionBasicSanity(allButD)
    HDXLAssertCollectionBasicSanity(allButE)
    HDXLAssertCollectionBasicSanity(allButF)
    HDXLAssertCollectionBasicSanity(allButG)
    HDXLAssertCollectionBasicSanity(allButH)
    HDXLAssertCollectionBasicSanity(allButI)
    
    HDXLAssertCollectionIndexSanity(allButA)
    HDXLAssertCollectionIndexSanity(allButB)
    HDXLAssertCollectionIndexSanity(allButC)
    HDXLAssertCollectionIndexSanity(allButD)
    HDXLAssertCollectionIndexSanity(allButE)
    HDXLAssertCollectionIndexSanity(allButF)
    HDXLAssertCollectionIndexSanity(allButG)
    HDXLAssertCollectionIndexSanity(allButH)
    HDXLAssertCollectionIndexSanity(allButI)
    
    XCTAssertTrue(allButA.isEmpty)
    XCTAssertTrue(allButB.isEmpty)
    XCTAssertTrue(allButC.isEmpty)
    XCTAssertTrue(allButD.isEmpty)
    XCTAssertTrue(allButE.isEmpty)
    XCTAssertTrue(allButF.isEmpty)
    XCTAssertTrue(allButG.isEmpty)
    XCTAssertTrue(allButH.isEmpty)
    XCTAssertTrue(allButI.isEmpty)
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
        let count = (
          aRange.count
          *
          bRange.count
          *
          cRange.count
          *
          dRange.count
          *
          eRange.count
          *
          fRange.count
          *
          gRange.count
          *
          hRange.count
          *
          iRange.count
        )
        let probe = InlineProduct9Collection(
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
          probe.count,
          count
        )
        XCTAssertEqual(
          probe.count == 0,
          probe.isEmpty
        )
        HDXLAssertCollectionBasicSanity(
          probe
        )
        HDXLAssertCollectionIndexSanity(
          probe
        )
      }
    }
  }
  
}
