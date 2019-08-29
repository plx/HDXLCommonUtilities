//
//  COWProduct9+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct9 : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable,
  F:Equatable,
  G:Equatable,
  H:Equatable,
  I:Equatable {
  
  @inlinable
  public static func ==(
    lhs: COWProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: COWProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct9 : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable,
  E:Comparable,
  F:Comparable,
  G:Comparable,
  H:Comparable,
  I:Comparable {
  
  @inlinable
  public static func <(
    lhs: COWProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: COWProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: COWProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: COWProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - Hashable
// -------------------------------------------------------------------------- //

extension COWProduct9 : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable,
  F:Hashable,
  G:Hashable,
  H:Hashable,
  I:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - Codable
// -------------------------------------------------------------------------- //

extension COWProduct9 : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable,
  F:Codable,
  G:Codable,
  H:Codable,
  I:Codable {
  
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
// MARK: COWProduct9 - CaseIterable
// -------------------------------------------------------------------------- //

extension COWProduct9 : CaseIterable
  where
  A:CaseIterable,
  B:CaseIterable,
  C:CaseIterable,
  D:CaseIterable,
  E:CaseIterable,
  F:CaseIterable,
  G:CaseIterable,
  H:CaseIterable,
  I:CaseIterable {
  
  public typealias AllCases = Product9Collection<
    A.AllCases,
    B.AllCases,
    C.AllCases,
    D.AllCases,
    E.AllCases,
    F.AllCases,
    G.AllCases,
    H.AllCases,
    I.AllCases,
    InlineProduct9<
      A.AllCases.Index,
      B.AllCases.Index,
      C.AllCases.Index,
      D.AllCases.Index,
      E.AllCases.Index,
      F.AllCases.Index,
      G.AllCases.Index,
      H.AllCases.Index,
      I.AllCases.Index
    >,
    COWProduct9<
      A,
      B,
      C,
      D,
      E,
      F,
      G,
      H,
      I
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
        G.allCases,
        H.allCases,
        I.allCases
      )
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Storage - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct9Storage : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable,
  F:Equatable,
  G:Equatable,
  H:Equatable,
  I:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage == rhs.storage
  }

  @inlinable
  internal static func !=(
    lhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Storage - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct9Storage : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable,
  E:Comparable,
  F:Comparable,
  G:Comparable,
  H:Comparable,
  I:Comparable {
  
  @inlinable
  internal static func <(
    lhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage < rhs.storage
  }

  @inlinable
  internal static func >(
    lhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage > rhs.storage
  }

  @inlinable
  internal static func <=(
    lhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage <= rhs.storage
  }

  @inlinable
  internal static func >=(
    lhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Storage - Hashable
// -------------------------------------------------------------------------- //

extension COWProduct9Storage : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable,
  F:Hashable,
  G:Hashable,
  H:Hashable,
  I:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Storage - Codable
// -------------------------------------------------------------------------- //

extension COWProduct9Storage : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable,
  F:Codable,
  G:Codable,
  H:Codable,
  I:Codable {

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
