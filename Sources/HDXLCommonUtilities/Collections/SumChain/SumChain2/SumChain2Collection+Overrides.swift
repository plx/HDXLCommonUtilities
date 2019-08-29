//
//  SumChain2Collection+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain2Collection - `contains(_:)`
// -------------------------------------------------------------------------- //

public extension SumChain2Collection
  where
  A.Element: Equatable,
  B.Element: Equatable {
  
  @inlinable
  func contains(_ element: Element) -> Bool {
    return self.storage.contains(element)
  }
  
}

