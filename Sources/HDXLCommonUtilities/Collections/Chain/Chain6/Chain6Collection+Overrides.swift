//
//  Chain6Collection+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Chain6Collection - `contains(_:)`
// -------------------------------------------------------------------------- //

public extension Chain6Collection
  where
  A.Element: Equatable {
  
  @inlinable
  func elementsEqual(_ other: Chain6Collection<A,B,C,D,E,F>) -> Bool {
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
// MARK: Chain6Collection - `min()`, `max()`
// -------------------------------------------------------------------------- //

public extension Chain6Collection
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
