//
//  Chain8CollectionStorage+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Chain8CollectionStorage - `contains(_:)`
// -------------------------------------------------------------------------- //

internal extension Chain8CollectionStorage
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
      ||
      self.h.contains(element)
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain8CollectionStorage - `min()`, `max()`
// -------------------------------------------------------------------------- //

internal extension Chain8CollectionStorage
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
      self.g.min(),
      self.h.min()
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
      self.g.max(),
      self.h.max()
    )
  }
  
}
