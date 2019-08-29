//
//  Chain2Collection+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Chain2Collection - `contains(_:)`
// -------------------------------------------------------------------------- //

public extension Chain2Collection
  where
  A.Element: Equatable {
  
  @inlinable
  func elementsEqual(_ other: Chain2Collection<A,B>) -> Bool {
    guard self.count == other.count else {
      return false
    }
    for (this,that) in zip(self,other) {
      guard this == that else {
        return false
      }
    }
    return true
  }
  

  @inlinable
  func contains(_ element: Element) -> Bool {
    return self.storage.contains(element)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain2Collection - `min()`, `max()`
// -------------------------------------------------------------------------- //

public extension Chain2Collection
  where
  A.Element: Comparable {
  
  @inlinable
  func min() -> Element? {
    return self.storage.min()
  }
  
  @inlinable
  func max() -> Element? {
    return self.storage.max()
  }
  
}
