//
//  Collection+LinearIndices.swift
//

import Foundation

public extension Collection {

  /// Utility to get the index @ `distance` from `self.startIndex`.
  @inlinable
  func index(offsetFromStartBy distance: Int) -> Index {
    precondition(distance >= 0)
    return self.index(
      self.startIndex,
      offsetBy: distance
    )
  }
  
  /// Utility to get the index @ `distance` from `self.endIndex`.
  ///
  /// - precondition: `distance <= 0`
  /// - precondition: `|distance| <= self.count`
  ///
  @inlinable
  func index(offsetFromEndBy distance: Int) -> Index {
    precondition(distance <= 0)
    // works even for `Collection`s that can't go backwards, at cost of being
    // marginally-pessimal for non-`RandomAccessCollection`s that are still
    // `BidirectionalCollection` and have O(n) `count` implementations. Feels
    // acceptable, may change my mind.
    return self.index(
      offsetFromStartBy: self.count + distance
    )
  }
  
}
