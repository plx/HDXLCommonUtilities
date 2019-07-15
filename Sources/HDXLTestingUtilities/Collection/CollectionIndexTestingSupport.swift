//
//  CollectionIndexTestingSupport.swift
//

import Foundation
import XCTest

@inlinable
public func HDXLAssertCollectionIndexSanity<C:Collection>(_ collection: C) {
  
  // validate start/end ordering is consistent:
  XCTAssertLessThanOrEqual(
    collection.startIndex,
    collection.endIndex,
    "`collection.startIndex` should be <= `collection.endIndex`, but \(String(reflecting: collection.startIndex)) isn't <= \(String(reflecting: collection.endIndex))"
  )

  // validate emptiness
  XCTAssertEqual(
    collection.isEmpty,
    collection.indices.isEmpty,
    "`collection.isEmpty` (\(collection.isEmpty)) should equal `collection.indices.isEmpty` \(collection.indices.isEmpty))!"
  )

  // validate count sanity
  XCTAssertEqual(
    collection.count,
    collection.indices.count,
    "`collection.count` (\(collection.count)) should equal `collection.indices.count` \(collection.indices.count))!"
  )
  
  // basic sanity-check on collection indices:
  HDXLAssertCoherentOrdering(
    forAscendingDistinctValues: collection.indices
  )
  
  // TODO: chain2 to tack on the `endIndex` and run again

  // validate `collection.indices` contains only *subscriptable* indices:
  for index in collection.indices {
    XCTAssertGreaterThanOrEqual(
      index,
      collection.startIndex,
      "`collection.indices` should only contain *subscriptable* indices, but \(String(reflecting: collection)).indices (\(String(reflecting: collection.indices))) contained non-subscriptable index \(String(reflecting: index))!"
    )
    XCTAssertLessThan(
      index,
      collection.endIndex,
      "`collection.indices` should only contain *subscriptable* indices, but \(String(reflecting: collection)).indices (\(String(reflecting: collection.indices))) contained non-subscriptable index \(String(reflecting: index))!"
    )
  }

  // validate round-trip index => distance-from-start => index
  for index in collection.indices {
    let distanceFromStart = collection.distance(
      from: collection.startIndex,
      to: index
    )
    let indexAtDistance = collection.index(
      collection.startIndex,
      offsetBy: distanceFromStart
    )
    XCTAssertEqual(
      index,
      indexAtDistance,
      "Failed to round-trip index \(String(reflecting: index)) via distance-from-start \(distanceFromStart); arrived at \(indexAtDistance)!"
    )
  }
  
  // validate distances:
  for (lLocation,lIndex) in collection.indices.enumerated() {
    // still n^2 but making fewer visits this way:
    for (_rLocation,rIndex) in collection.indices[lIndex..<collection.endIndex].enumerated() {
      let rLocation = lLocation + _rLocation
      XCTAssertEqual(
        collection.distance(
          from: lIndex,
          to: rIndex
        ),
        -collection.distance(
          from: rIndex,
          to: lIndex
        ),
        "Index-distance symmetry violation \(String(reflecting: lIndex)) and \(String(reflecting: rIndex))!"
      )
      XCTAssertEqual(
        rLocation - lLocation,
        collection.distance(
          from: lIndex,
          to: rIndex
        ),
        "Found distance-mismatch between \(String(reflecting: lIndex)) and \(String(reflecting: rIndex)): should-be \(rLocation - lLocation) but got \(collection.distance(from: lIndex, to: rIndex))!"
      )
    }
  }
  
  // validate forward iteration:
  for index in collection.indices {
    let next = collection.index(after: index)
    XCTAssertEqual(
      collection.distance(
        from: index,
        to: next
      ),
      1,
      "`collection.index(after:)` should advance by one, but went from \(String(reflecting: index)) to \(String(reflecting: next)) w/ distance \(collection.distance(from: index, to: next))"
    )
  }
  
}
