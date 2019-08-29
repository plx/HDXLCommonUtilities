//
//  Chain7CollectionStorage+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Chain7CollectionStorage - `contains(_:)`
// -------------------------------------------------------------------------- //

internal extension Chain7CollectionStorage
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
      ||
      self.e.contains(element)
      ||
      self.f.contains(element)
      ||
      self.g.contains(element)
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain7CollectionStorage - `min()`, `max()`
// -------------------------------------------------------------------------- //

internal extension Chain7CollectionStorage
  where
  A.Element: Comparable {
  
  @inlinable
  func min() -> Element? {
    return weakMinimum(
      self.a.min(),
      self.b.min(),
      self.c.min(),
      self.d.min(),
      self.e.min(),
      self.f.min(),
      self.g.min()
    )
  }
  
  @inlinable
  func max() -> Element? {
    return weakMaximum(
      self.a.max(),
      self.b.max(),
      self.c.max(),
      self.d.max(),
      self.e.max(),
      self.f.max(),
      self.g.max()
    )
  }
  
}
