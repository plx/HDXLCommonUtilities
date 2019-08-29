//
//  SumChain7Collection+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain7Collection - `contains(_:)`
// -------------------------------------------------------------------------- //

public extension SumChain7Collection
  where
  A.Element: Equatable,
  B.Element: Equatable,
  C.Element: Equatable,
  D.Element: Equatable,
  E.Element: Equatable,
  F.Element: Equatable,
  G.Element: Equatable {
  
  @inlinable
  func contains(_ element: Element) -> Bool {
    return self.storage.contains(element)
  }
  
}

