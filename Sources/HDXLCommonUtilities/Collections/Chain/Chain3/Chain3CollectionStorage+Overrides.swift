//
//  Chain3CollectionStorage+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Chain3CollectionStorage - `contains(_:)`
// -------------------------------------------------------------------------- //

internal extension Chain3CollectionStorage
  where
  A.Element: Equatable {
  
  @inlinable
  func contains(_ element: Element) -> Bool {
    return (
      self.a.contains(element)
      ||
      self.b.contains(element)
      ||
      self.c.contains(element)
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain3CollectionStorage - `min()`, `max()`
// -------------------------------------------------------------------------- //

internal extension Chain3CollectionStorage
  where
  A.Element: Comparable {
  
  @inlinable
  func min() -> Element? {
    return weakMinimum(
      self.a.min(),
      self.b.min(),
      self.c.min()
    )
  }
  
  @inlinable
  func max() -> Element? {
    return weakMaximum(
      self.a.max(),
      self.b.max(),
      self.c.max()
    )
  }
  
}
