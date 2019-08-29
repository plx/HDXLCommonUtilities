//
//  Chain4CollectionStorage+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Chain4CollectionStorage - `contains(_:)`
// -------------------------------------------------------------------------- //

internal extension Chain4CollectionStorage
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
      ||
      self.d.contains(element)
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain4CollectionStorage - `min()`, `max()`
// -------------------------------------------------------------------------- //

internal extension Chain4CollectionStorage
  where
  A.Element: Comparable {
  
  @inlinable
  func min() -> Element? {
    return weakMinimum(
      self.a.min(),
      self.b.min(),
      self.c.min(),
      self.d.min()
    )
  }
  
  @inlinable
  func max() -> Element? {
    return weakMaximum(
      self.a.max(),
      self.b.max(),
      self.c.max(),
      self.d.max()
    )
  }
  
}
