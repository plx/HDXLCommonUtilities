//
//  Product8Interoperation.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MAR: COWProduct8 <- InlineProduct8
// -------------------------------------------------------------------------- //

public extension COWProduct8 {
  
  typealias InlineEquivalent = InlineProduct8<A,B,C,D,E,F,G,H>
  
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
// MAR: InlineProduct8 <- COWProduct8
// -------------------------------------------------------------------------- //

public extension InlineProduct8 {
  
  typealias COWEquivalent = COWProduct8<A,B,C,D,E,F,G,H>
  
  @inlinable
  init(_ other: COWEquivalent) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(other.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self = other.storage.storage
  }
  
}
