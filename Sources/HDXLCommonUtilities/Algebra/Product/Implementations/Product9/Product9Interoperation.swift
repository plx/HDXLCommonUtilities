//
//  Product9Interoperation.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MAR: COWProduct9 <- InlineProduct9
// -------------------------------------------------------------------------- //

public extension COWProduct9 {
  
  typealias InlineEquivalent = InlineProduct9<A,B,C,D,E,F,G,H,I>
  
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
// MAR: InlineProduct9 <- COWProduct9
// -------------------------------------------------------------------------- //

public extension InlineProduct9 {
  
  typealias COWEquivalent = COWProduct9<A,B,C,D,E,F,G,H,I>
  
  @inlinable
  init(_ other: COWEquivalent) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(other.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self = other.storage.storage
  }
  
}
