//
//  COWProduct3+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct3 - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct3 : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable {
  
  @inlinable
  public static func ==(
    lhs: COWProduct3<A,B,C>,
    rhs: COWProduct3<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: COWProduct3<A,B,C>,
    rhs: COWProduct3<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3 - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct3 : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable {
  
  @inlinable
  public static func <(
    lhs: COWProduct3<A,B,C>,
    rhs: COWProduct3<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: COWProduct3<A,B,C>,
    rhs: COWProduct3<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: COWProduct3<A,B,C>,
    rhs: COWProduct3<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: COWProduct3<A,B,C>,
    rhs: COWProduct3<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3 - Hashable
// -------------------------------------------------------------------------- //

extension COWProduct3 : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3 - Codable
// -------------------------------------------------------------------------- //

extension COWProduct3 : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable {
  
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
// MARK: COWProduct3 - CaseIterable
// -------------------------------------------------------------------------- //

extension COWProduct3 : CaseIterable
  where
  A:CaseIterable,
  B:CaseIterable,
  C:CaseIterable {
  
  public typealias AllCases = Product3Collection<
    A.AllCases,
    B.AllCases,
    C.AllCases,
    InlineProduct3<
      A.AllCases.Index,
      B.AllCases.Index,
      C.AllCases.Index
    >,
    COWProduct3<
      A,
      B,
      C
    >
  >

  @inlinable
  public static var allCases: AllCases {
    get {
      return AllCases(
        A.allCases,
        B.allCases,
        C.allCases
      )
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3Storage - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct3Storage : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: COWProduct3Storage<A,B,C>,
    rhs: COWProduct3Storage<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage == rhs.storage
  }

  @inlinable
  internal static func !=(
    lhs: COWProduct3Storage<A,B,C>,
    rhs: COWProduct3Storage<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3Storage - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct3Storage : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable {
  
  @inlinable
  internal static func <(
    lhs: COWProduct3Storage<A,B,C>,
    rhs: COWProduct3Storage<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage < rhs.storage
  }

  @inlinable
  internal static func >(
    lhs: COWProduct3Storage<A,B,C>,
    rhs: COWProduct3Storage<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage > rhs.storage
  }

  @inlinable
  internal static func <=(
    lhs: COWProduct3Storage<A,B,C>,
    rhs: COWProduct3Storage<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage <= rhs.storage
  }

  @inlinable
  internal static func >=(
    lhs: COWProduct3Storage<A,B,C>,
    rhs: COWProduct3Storage<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3Storage - Hashable
// -------------------------------------------------------------------------- //

extension COWProduct3Storage : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3Storage - Codable
// -------------------------------------------------------------------------- //

extension COWProduct3Storage : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable {

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
