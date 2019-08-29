//
//  SumChain8Collection+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain8Collection - `contains(_:)`
// -------------------------------------------------------------------------- //

public extension SumChain8Collection
  where
  A.Element: Equatable,
  B.Element: Equatable,
  C.Element: Equatable,
  D.Element: Equatable,
  E.Element: Equatable,
  F.Element: Equatable,
  G.Element: Equatable,
  H.Element: Equatable {
  
  @inlinable
  func contains(_ element: Element) -> Bool {
    return self.storage.contains(element)
  }
  
}

