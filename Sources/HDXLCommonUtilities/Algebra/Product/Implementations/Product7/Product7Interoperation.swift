//
//  Product7Interoperation.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MAR: COWProduct7 <- InlineProduct7
// -------------------------------------------------------------------------- //

public extension COWProduct7 {
  
  typealias InlineEquivalent = InlineProduct7<A,B,C,D,E,F,G>
  
  @inlinable
  init(_ other: InlineEquivalent) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(other.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.init(
      storage: Storage(
        storage: other
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MAR: InlineProduct7 <- COWProduct7
// -------------------------------------------------------------------------- //

public extension InlineProduct7 {
  
  typealias COWEquivalent = COWProduct7<A,B,C,D,E,F,G>
  
  @inlinable
  init(_ other: COWEquivalent) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(other.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self = other.storage.storage
  }
  
}
