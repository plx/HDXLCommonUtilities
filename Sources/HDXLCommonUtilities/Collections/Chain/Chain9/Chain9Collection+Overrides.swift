//
//  Chain9Collection+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Chain9Collection - `contains(_:)`
// -------------------------------------------------------------------------- //

public extension Chain9Collection
  where
  A.Element: Equatable {
  
  @inlinable
  func elementsEqual(_ other: Chain9Collection<A,B,C,D,E,F,G,H,I>) -> Bool {
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
// MARK: Chain9Collection - `min()`, `max()`
// -------------------------------------------------------------------------- //

public extension Chain9Collection
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
