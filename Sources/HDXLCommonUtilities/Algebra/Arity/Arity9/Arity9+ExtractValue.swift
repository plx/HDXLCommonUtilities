//
//  Arity9+ExtractValue.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - extractValue
// -------------------------------------------------------------------------- //

public extension InlineProduct9 {
  
  @inlinable
  func extractValue<T>(using extractor: Sum9<
    (A) -> T,
    (B) -> T,
    (C) -> T,
    (D) -> T,
    (E) -> T,
    (F) -> T,
    (G) -> T,
    (H) -> T,
    (I) -> T>) -> T {
    switch extractor {
    case .a(let a):
      return a(self.a)
    case .b(let b):
      return b(self.b)
    case .c(let c):
      return c(self.c)
    case .d(let d):
      return d(self.d)
    case .e(let e):
      return e(self.e)
    case .f(let f):
      return f(self.f)
    case .g(let g):
      return g(self.g)
    case .h(let h):
      return h(self.h)
    case .i(let i):
      return i(self.i)
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - extractValue
// -------------------------------------------------------------------------- //

public extension COWProduct9 {
  
  @inlinable
  func extractValue<T>(using extractor: Sum9<
    (A) -> T,
    (B) -> T,
    (C) -> T,
    (D) -> T,
    (E) -> T,
    (F) -> T,
    (G) -> T,
    (H) -> T,
    (I) -> T>) -> T {
    return self.storage.extractValue(
      using: extractor
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Storage - extractValue
// -------------------------------------------------------------------------- //

internal extension COWProduct9Storage {
  
  @usableFromInline
  func extractValue<T>(using extractor: Sum9<
    (A) -> T,
    (B) -> T,
    (C) -> T,
    (D) -> T,
    (E) -> T,
    (F) -> T,
    (G) -> T,
    (H) -> T,
    (I) -> T>) -> T {
    return self.storage.extractValue(
      using: extractor
    )
  }
  
}
