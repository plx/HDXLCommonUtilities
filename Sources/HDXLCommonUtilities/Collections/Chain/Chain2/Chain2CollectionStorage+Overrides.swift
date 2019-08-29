//
//  Chain2CollectionStorage+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Chain2CollectionStorage - `contains(_:)`
// -------------------------------------------------------------------------- //

internal extension Chain2CollectionStorage
  where
  A.Element: Equatable {
  
  @inlinable
  func contains(_ element: Element) -> Bool {
    return (
      self.a.contains(element)
      ||
      self.b.contains(element)
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain2CollectionStorage - `min()`, `max()`
// -------------------------------------------------------------------------- //

internal extension Chain2CollectionStorage
  where
  A.Element: Comparable {
  
  @inlinable
  func min() -> Element? {
    return weakMinimum(
      self.a.min(),
      self.b.min()
    )
  }
  
  @inlinable
  func max() -> Element? {
    return weakMaximum(
      self.a.max(),
      self.b.max()
    )
  }
  
}
