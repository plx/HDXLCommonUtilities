//
//  SumChain3Collection+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain3Collection - `contains(_:)`
// -------------------------------------------------------------------------- //

public extension SumChain3Collection
  where
  A.Element: Equatable,
  B.Element: Equatable,
  C.Element: Equatable {
  
  @inlinable
  func contains(_ element: Element) -> Bool {
    return self.storage.contains(element)
  }
  
}

