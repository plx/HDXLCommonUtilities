//
//  Product6Interoperation.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MAR: COWProduct6 <- InlineProduct6
// -------------------------------------------------------------------------- //

public extension COWProduct6 {
  
  typealias InlineEquivalent = InlineProduct6<A,B,C,D,E,F>
  
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
// MAR: InlineProduct6 <- COWProduct6
// -------------------------------------------------------------------------- //

public extension InlineProduct6 {
  
  typealias COWEquivalent = COWProduct6<A,B,C,D,E,F>
  
  @inlinable
  init(_ other: COWEquivalent) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(other.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self = other.storage.storage
  }
  
}
