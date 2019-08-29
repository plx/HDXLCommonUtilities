//
//  Product2Interoperation.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MAR: COWProduct2 <- InlineProduct2
// -------------------------------------------------------------------------- //

public extension COWProduct2 {
  
  typealias InlineEquivalent = InlineProduct2<A,B>
  
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
// MAR: InlineProduct2 <- COWProduct2
// -------------------------------------------------------------------------- //

public extension InlineProduct2 {
  
  typealias COWEquivalent = COWProduct2<A,B>
  
  @inlinable
  init(_ other: COWEquivalent) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(other.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self = other.storage.storage
  }
  
}
