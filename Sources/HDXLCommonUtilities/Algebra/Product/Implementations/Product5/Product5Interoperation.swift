//
//  Product5Interoperation.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MAR: COWProduct5 <- InlineProduct5
// -------------------------------------------------------------------------- //

public extension COWProduct5 {
  
  typealias InlineEquivalent = InlineProduct5<A,B,C,D,E>
  
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
// MAR: InlineProduct5 <- COWProduct5
// -------------------------------------------------------------------------- //

public extension InlineProduct5 {
  
  typealias COWEquivalent = COWProduct5<A,B,C,D,E>
  
  @inlinable
  init(_ other: COWEquivalent) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(other.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self = other.storage.storage
  }
  
}
