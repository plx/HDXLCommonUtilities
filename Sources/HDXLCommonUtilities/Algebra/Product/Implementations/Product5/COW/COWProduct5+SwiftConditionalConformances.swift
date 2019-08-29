//
//  COWProduct5+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct5 - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct5 : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable {
  
  @inlinable
  public static func ==(
    lhs: COWProduct5<A,B,C,D,E>,
    rhs: COWProduct5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: COWProduct5<A,B,C,D,E>,
    rhs: COWProduct5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5 - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct5 : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable,
  E:Comparable {
  
  @inlinable
  public static func <(
    lhs: COWProduct5<A,B,C,D,E>,
    rhs: COWProduct5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: COWProduct5<A,B,C,D,E>,
    rhs: COWProduct5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: COWProduct5<A,B,C,D,E>,
    rhs: COWProduct5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: COWProduct5<A,B,C,D,E>,
    rhs: COWProduct5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5 - Hashable
// -------------------------------------------------------------------------- //

extension COWProduct5 : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5 - Codable
// -------------------------------------------------------------------------- //

extension COWProduct5 : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable {
  
  @inlinable
  public func encode(to encoder: Encoder) throws {
    var value = encoder.singleValueContainer()
    try value.encode(self.storage)
  }
  
  @inlinable
  public init(from decoder: Decoder) throws {
    let value = try decoder.singleValueContainer()
    let storage = try value.decode(Storage.self)
    self.init(
      storage: storage
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5 - CaseIterable
// -------------------------------------------------------------------------- //

extension COWProduct5 : CaseIterable
  where
  A:CaseIterable,
  B:CaseIterable,
  C:CaseIterable,
  D:CaseIterable,
  E:CaseIterable {
  
  public typealias AllCases = Product5Collection<
    A.AllCases,
    B.AllCases,
    C.AllCases,
    D.AllCases,
    E.AllCases,
    InlineProduct5<
      A.AllCases.Index,
      B.AllCases.Index,
      C.AllCases.Index,
      D.AllCases.Index,
      E.AllCases.Index
    >,
    COWProduct5<
      A,
      B,
      C,
      D,
      E
    >
  >

  @inlinable
  public static var allCases: AllCases {
    get {
      return AllCases(
        A.allCases,
        B.allCases,
        C.allCases,
        D.allCases,
        E.allCases
      )
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5Storage - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct5Storage : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: COWProduct5Storage<A,B,C,D,E>,
    rhs: COWProduct5Storage<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage == rhs.storage
  }

  @inlinable
  internal static func !=(
    lhs: COWProduct5Storage<A,B,C,D,E>,
    rhs: COWProduct5Storage<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5Storage - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct5Storage : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable,
  E:Comparable {
  
  @inlinable
  internal static func <(
    lhs: COWProduct5Storage<A,B,C,D,E>,
    rhs: COWProduct5Storage<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage < rhs.storage
  }

  @inlinable
  internal static func >(
    lhs: COWProduct5Storage<A,B,C,D,E>,
    rhs: COWProduct5Storage<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage > rhs.storage
  }

  @inlinable
  internal static func <=(
    lhs: COWProduct5Storage<A,B,C,D,E>,
    rhs: COWProduct5Storage<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage <= rhs.storage
  }

  @inlinable
  internal static func >=(
    lhs: COWProduct5Storage<A,B,C,D,E>,
    rhs: COWProduct5Storage<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5Storage - Hashable
// -------------------------------------------------------------------------- //

extension COWProduct5Storage : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5Storage - Codable
// -------------------------------------------------------------------------- //

extension COWProduct5Storage : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable {

  @inlinable
  internal func encode(to encoder: Encoder) throws {
    var value = encoder.singleValueContainer()
    try value.encode(self.storage)
  }
  
  @inlinable
  internal convenience init(from decoder: Decoder) throws {
    let value = try decoder.singleValueContainer()
    let storage = try value.decode(Storage.self)
    self.init(
      storage: storage
    )
  }
  
}
