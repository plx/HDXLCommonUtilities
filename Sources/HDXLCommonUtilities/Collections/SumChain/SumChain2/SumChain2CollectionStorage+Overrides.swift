//
//  SumChain2CollectionStorage+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain2CollectionStorage - `contains(_:)`
// -------------------------------------------------------------------------- //

internal extension SumChain2CollectionStorage
  where
  A.Element: Equatable,
  B.Element: Equatable {
  
  @inlinable
  func contains(_ element: Element) -> Bool {
    switch element {
    case .a(let a):
      return self.a.contains(a)
    case .b(let b):
      return self.b.contains(b)
    }
  }
  
}

