//
//  Product4Interoperation.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MAR: COWProduct4 <- InlineProduct4
// -------------------------------------------------------------------------- //

public extension COWProduct4 {
  
  typealias InlineEquivalent = InlineProduct4<A,B,C,D>
  
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
// MAR: InlineProduct4 <- COWProduct4
// -------------------------------------------------------------------------- //

public extension InlineProduct4 {
  
  typealias COWEquivalent = COWProduct4<A,B,C,D>
  
  @inlinable
  init(_ other: COWEquivalent) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(other.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self = other.storage.storage
  }
  
}
