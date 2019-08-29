//
//  Chain5CollectionStorage+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Chain5CollectionStorage - `contains(_:)`
// -------------------------------------------------------------------------- //

internal extension Chain5CollectionStorage
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
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain5CollectionStorage - `min()`, `max()`
// -------------------------------------------------------------------------- //

internal extension Chain5CollectionStorage
  where
  A.Element: Comparable {
  
  @inlinable
  func min() -> Element? {
    return weakMinimum(
      self.a.min(),
      self.b.min(),
      self.c.min(),
      self.d.min(),
      self.e.min()
    )
  }
  
  @inlinable
  func max() -> Element? {
    return weakMaximum(
      self.a.max(),
      self.b.max(),
      self.c.max(),
      self.d.max(),
      self.e.max()
    )
  }
  
}
