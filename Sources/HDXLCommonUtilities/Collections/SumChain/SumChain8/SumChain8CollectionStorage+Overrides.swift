//
//  SumChain8CollectionStorage+Overrides.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain8CollectionStorage - `contains(_:)`
// -------------------------------------------------------------------------- //

internal extension SumChain8CollectionStorage
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
    switch element {
    case .a(let a):
      return self.a.contains(a)
    case .b(let b):
      return self.b.contains(b)
    case .c(let c):
      return self.c.contains(c)
    case .d(let d):
      return self.d.contains(d)
    case .e(let e):
      return self.e.contains(e)
    case .f(let f):
      return self.f.contains(f)
    case .g(let g):
      return self.g.contains(g)
    case .h(let h):
      return self.h.contains(h)
    }
  }
  
}

