//
//  Collection+SubscriptableIndices.swift
//

import Foundation

public extension Collection {
  
  @inlinable
  var firstSubscriptableIndex: Index? {
    get {
      guard !self.isEmpty else {
        return nil
      }
      return self.startIndex
    }
  }
  
  @inlinable
  var finalSubscriptableIndex: Index? {
    get {
      guard !self.isEmpty else {
        return nil
      }
      return self.locateFinalSubscriptableIndex(
        assumingCount: self.count
      )
    }
  }
  
  @usableFromInline
  internal func locateFinalSubscriptableIndex(assumingCount count: Int) -> Index? {
    guard count > 0 else {
      return nil
    }
    return self.index(
      self.startIndex,
      offsetBy: count - 1
    )
  }
  
}
