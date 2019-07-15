//
//  COWProduct9Collection+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Collection - `contains(_:)`
// -------------------------------------------------------------------------- //

public extension COWProduct9Collection
  where
  A.Element: Equatable,
  B.Element: Equatable,
  C.Element: Equatable,
  D.Element: Equatable,
  E.Element: Equatable,
  F.Element: Equatable,
  G.Element: Equatable,
  H.Element: Equatable,
  I.Element: Equatable {
  
  @inlinable
  func contains(_ element: Element) -> Bool {
    return self.storage.contains(element)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Collection - `min()`, `max()`
// -------------------------------------------------------------------------- //

public extension COWProduct9Collection
  where
  A.Element: Comparable,
  B.Element: Comparable,
  C.Element: Comparable,
  D.Element: Comparable,
  E.Element: Comparable,
  F.Element: Comparable,
  G.Element: Comparable,
  H.Element: Comparable,
  I.Element: Comparable {
  
  @inlinable
  func min() -> Element? {
    return self.storage.min()
  }
  
  @inlinable
  func max() -> Element? {
    return self.storage.max()
  }
  
}
