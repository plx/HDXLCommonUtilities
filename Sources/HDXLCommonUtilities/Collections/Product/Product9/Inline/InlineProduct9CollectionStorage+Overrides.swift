//
//  InlineProduct9CollectionStorage+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9CollectionStorage - `contains(_:)`
// -------------------------------------------------------------------------- //

internal extension InlineProduct9CollectionStorage
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
  
  @usableFromInline
  func contains(_ element: Element) -> Bool {
    guard
      self.a.contains(element.a),
      self.b.contains(element.b),
      self.c.contains(element.c),
      self.d.contains(element.d),
      self.e.contains(element.e),
      self.f.contains(element.f),
      self.g.contains(element.g),
      self.h.contains(element.h),
      self.i.contains(element.i) else {
        return false
    }
    return true
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9CollectionStorage - `min()`, `max()`
// -------------------------------------------------------------------------- //

internal extension InlineProduct9CollectionStorage
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

  @usableFromInline
  func min() -> Element? {
    return Element(
      self.a.min(),
      self.b.min(),
      self.c.min(),
      self.d.min(),
      self.e.min(),
      self.f.min(),
      self.g.min(),
      self.h.min(),
      self.i.min()
    )
  }

  @usableFromInline
  func max() -> Element? {
    return Element(
      self.a.max(),
      self.b.max(),
      self.c.max(),
      self.d.max(),
      self.e.max(),
      self.f.max(),
      self.g.max(),
      self.h.max(),
      self.i.max()
    )
  }

}
