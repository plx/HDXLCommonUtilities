//
//  Product3Interoperation.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MAR: COWProduct3 <- InlineProduct3
// -------------------------------------------------------------------------- //

public extension COWProduct3 {
  
  typealias InlineEquivalent = InlineProduct3<A,B,C>
  
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
// MAR: InlineProduct3 <- COWProduct3
// -------------------------------------------------------------------------- //

public extension InlineProduct3 {
  
  typealias COWEquivalent = COWProduct3<A,B,C>
  
  @inlinable
  init(_ other: COWEquivalent) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(other.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self = other.storage.storage
  }
  
}
