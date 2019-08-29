//
//  SumChain3CollectionStorage+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain3CollectionStorage - `contains(_:)`
// -------------------------------------------------------------------------- //

internal extension SumChain3CollectionStorage
  where
  A.Element: Equatable,
  B.Element: Equatable,
  C.Element: Equatable {
  
  @inlinable
  func contains(_ element: Element) -> Bool {
    switch element {
    case .a(let a):
      return self.a.contains(a)
    case .b(let b):
      return self.b.contains(b)
    case .c(let c):
      return self.c.contains(c)
    }
  }
  
}

