//
//  CollectionBasicTestingSupport.swift
//

import Foundation
import XCTest

public extension Collection {
  
  /// Obtain the count by iterating from start-to-finish.
  ///
  /// - note: Motivated by collections with (a) complex iteration logic but (b) easily-calculable counts; easy to get the right calculation but wrong iteration!
  @inlinable
  func countByIterating() -> Int {
    var count = 0
    for _ in self {
      count += 1
    }
    return count
  }
  
}

/// Function tests basic invariants of `Collection` (like `isEmpty <=> count == 0`, etc..).
@inlinable
public func HDXLAssertCollectionBasicSanity<C:Collection>(_ collection: C) {
  
  // non-negative count:
  XCTAssertTrue(
    collection.count >= 0
  )
  
  XCTAssertEqual(
    collection.isEmpty,
    collection.count == 0
  )

  XCTAssertEqual(
    collection.isEmpty,
    collection.startIndex == collection.endIndex
  )

  XCTAssertEqual(
    collection.count,
    collection.distance(
      from: collection.startIndex,
      to: collection.endIndex
    )
  )

  // first == nil <=> isEmpty
  XCTAssertEqual(
    collection.first == nil,
    collection.isEmpty
  )

  // count matches manual count:
  XCTAssertEqual(
    collection.count,
    collection.countByIterating()
  )

}

