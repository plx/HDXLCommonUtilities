//
//  COWProduct4+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct4 - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct4 : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable {
  
  @inlinable
  public static func ==(
    lhs: COWProduct4<A,B,C,D>,
    rhs: COWProduct4<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: COWProduct4<A,B,C,D>,
    rhs: COWProduct4<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4 - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct4 : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable {
  
  @inlinable
  public static func <(
    lhs: COWProduct4<A,B,C,D>,
    rhs: COWProduct4<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: COWProduct4<A,B,C,D>,
    rhs: COWProduct4<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: COWProduct4<A,B,C,D>,
    rhs: COWProduct4<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: COWProduct4<A,B,C,D>,
    rhs: COWProduct4<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4 - Hashable
// -------------------------------------------------------------------------- //

extension COWProduct4 : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4 - Codable
// -------------------------------------------------------------------------- //

extension COWProduct4 : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable {
  
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
// MARK: COWProduct4 - CaseIterable
// -------------------------------------------------------------------------- //

extension COWProduct4 : CaseIterable
  where
  A:CaseIterable,
  B:CaseIterable,
  C:CaseIterable,
  D:CaseIterable {
  
  public typealias AllCases = Product4Collection<
    A.AllCases,
    B.AllCases,
    C.AllCases,
    D.AllCases,
    InlineProduct4<
      A.AllCases.Index,
      B.AllCases.Index,
      C.AllCases.Index,
      D.AllCases.Index
    >,
    COWProduct4<
      A,
      B,
      C,
      D
    >
  >

  @inlinable
  public static var allCases: AllCases {
    get {
      return AllCases(
        A.allCases,
        B.allCases,
        C.allCases,
        D.allCases
      )
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4Storage - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct4Storage : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: COWProduct4Storage<A,B,C,D>,
    rhs: COWProduct4Storage<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage == rhs.storage
  }

  @inlinable
  internal static func !=(
    lhs: COWProduct4Storage<A,B,C,D>,
    rhs: COWProduct4Storage<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4Storage - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct4Storage : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable {
  
  @inlinable
  internal static func <(
    lhs: COWProduct4Storage<A,B,C,D>,
    rhs: COWProduct4Storage<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage < rhs.storage
  }

  @inlinable
  internal static func >(
    lhs: COWProduct4Storage<A,B,C,D>,
    rhs: COWProduct4Storage<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage > rhs.storage
  }

  @inlinable
  internal static func <=(
    lhs: COWProduct4Storage<A,B,C,D>,
    rhs: COWProduct4Storage<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage <= rhs.storage
  }

  @inlinable
  internal static func >=(
    lhs: COWProduct4Storage<A,B,C,D>,
    rhs: COWProduct4Storage<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4Storage - Hashable
// -------------------------------------------------------------------------- //

extension COWProduct4Storage : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4Storage - Codable
// -------------------------------------------------------------------------- //

extension COWProduct4Storage : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable {

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
