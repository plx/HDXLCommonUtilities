//
//  SumChain6Collection+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain6Collection - `contains(_:)`
// -------------------------------------------------------------------------- //

public extension SumChain6Collection
  where
  A.Element: Equatable,
  B.Element: Equatable,
  C.Element: Equatable,
  D.Element: Equatable,
  E.Element: Equatable,
  F.Element: Equatable {
  
  @inlinable
  func contains(_ element: Element) -> Bool {
    return self.storage.contains(element)
  }
  
}

