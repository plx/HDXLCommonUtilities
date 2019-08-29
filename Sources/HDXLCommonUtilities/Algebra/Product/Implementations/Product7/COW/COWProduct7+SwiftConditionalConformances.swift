//
//  COWProduct7+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct7 - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct7 : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable,
  F:Equatable,
  G:Equatable {
  
  @inlinable
  public static func ==(
    lhs: COWProduct7<A,B,C,D,E,F,G>,
    rhs: COWProduct7<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: COWProduct7<A,B,C,D,E,F,G>,
    rhs: COWProduct7<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7 - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct7 : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable,
  E:Comparable,
  F:Comparable,
  G:Comparable {
  
  @inlinable
  public static func <(
    lhs: COWProduct7<A,B,C,D,E,F,G>,
    rhs: COWProduct7<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: COWProduct7<A,B,C,D,E,F,G>,
    rhs: COWProduct7<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: COWProduct7<A,B,C,D,E,F,G>,
    rhs: COWProduct7<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: COWProduct7<A,B,C,D,E,F,G>,
    rhs: COWProduct7<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7 - Hashable
// -------------------------------------------------------------------------- //

extension COWProduct7 : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable,
  F:Hashable,
  G:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7 - Codable
// -------------------------------------------------------------------------- //

extension COWProduct7 : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable,
  F:Codable,
  G:Codable {
  
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
// MARK: COWProduct7 - CaseIterable
// -------------------------------------------------------------------------- //

extension COWProduct7 : CaseIterable
  where
  A:CaseIterable,
  B:CaseIterable,
  C:CaseIterable,
  D:CaseIterable,
  E:CaseIterable,
  F:CaseIterable,
  G:CaseIterable {
  
  public typealias AllCases = Product7Collection<
    A.AllCases,
    B.AllCases,
    C.AllCases,
    D.AllCases,
    E.AllCases,
    F.AllCases,
    G.AllCases,
    InlineProduct7<
      A.AllCases.Index,
      B.AllCases.Index,
      C.AllCases.Index,
      D.AllCases.Index,
      E.AllCases.Index,
      F.AllCases.Index,
      G.AllCases.Index
    >,
    COWProduct7<
      A,
      B,
      C,
      D,
      E,
      F,
      G
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
        E.allCases,
        F.allCases,
        G.allCases
      )
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7Storage - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct7Storage : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable,
  F:Equatable,
  G:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: COWProduct7Storage<A,B,C,D,E,F,G>,
    rhs: COWProduct7Storage<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage == rhs.storage
  }

  @inlinable
  internal static func !=(
    lhs: COWProduct7Storage<A,B,C,D,E,F,G>,
    rhs: COWProduct7Storage<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7Storage - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct7Storage : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable,
  E:Comparable,
  F:Comparable,
  G:Comparable {
  
  @inlinable
  internal static func <(
    lhs: COWProduct7Storage<A,B,C,D,E,F,G>,
    rhs: COWProduct7Storage<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage < rhs.storage
  }

  @inlinable
  internal static func >(
    lhs: COWProduct7Storage<A,B,C,D,E,F,G>,
    rhs: COWProduct7Storage<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage > rhs.storage
  }

  @inlinable
  internal static func <=(
    lhs: COWProduct7Storage<A,B,C,D,E,F,G>,
    rhs: COWProduct7Storage<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage <= rhs.storage
  }

  @inlinable
  internal static func >=(
    lhs: COWProduct7Storage<A,B,C,D,E,F,G>,
    rhs: COWProduct7Storage<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7Storage - Hashable
// -------------------------------------------------------------------------- //

extension COWProduct7Storage : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable,
  F:Hashable,
  G:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7Storage - Codable
// -------------------------------------------------------------------------- //

extension COWProduct7Storage : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable,
  F:Codable,
  G:Codable {

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
