//
//  Collection+CommonDistanceCalculations.swift
//

import Foundation

public extension Collection {
  
  /// Convenience for the common query "how far from `startIndex` to `index`?"
  @inlinable
  func distanceFromStart(to index: Index) -> Int {
    return self.distance(
      from: self.startIndex,
      to: index
    )
  }

  /// Convenience for the common query "how far from `index` to `startIndex`?"
  @inlinable
  func distanceToStart(from index: Index) -> Int {
    return self.distance(
      from: index,
      to: self.startIndex
    )
  }
  

  /// Convenience for the common query "how far from `index` to the `endIndex`?"
  @inlinable
  func distanceToEnd(from index: Index) -> Int {
    return self.distance(
      from: index,
      to: self.endIndex
    )
  }

  /// Convenience for the common query "how far from `endIndex` to `index`?"
  @inlinable
  func distanceFromEnd(to index: Index) -> Int {
    return self.distance(
      from: self.endIndex,
      to: index
    )
  }

}
