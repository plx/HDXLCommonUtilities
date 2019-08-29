//
//  SumChain5Collection+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain5Collection - `contains(_:)`
// -------------------------------------------------------------------------- //

public extension SumChain5Collection
  where
  A.Element: Equatable,
  B.Element: Equatable,
  C.Element: Equatable,
  D.Element: Equatable,
  E.Element: Equatable {
  
  @inlinable
  func contains(_ element: Element) -> Bool {
    return self.storage.contains(element)
  }
  
}

