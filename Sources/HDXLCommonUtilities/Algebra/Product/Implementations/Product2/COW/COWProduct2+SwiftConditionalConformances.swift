//
//  COWProduct2+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct2 - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct2 : Equatable
  where
  A:Equatable,
  B:Equatable {
  
  @inlinable
  public static func ==(
    lhs: COWProduct2<A,B>,
    rhs: COWProduct2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: COWProduct2<A,B>,
    rhs: COWProduct2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2 - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct2 : Comparable
  where
  A:Comparable,
  B:Comparable {
  
  @inlinable
  public static func <(
    lhs: COWProduct2<A,B>,
    rhs: COWProduct2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: COWProduct2<A,B>,
    rhs: COWProduct2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: COWProduct2<A,B>,
    rhs: COWProduct2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: COWProduct2<A,B>,
    rhs: COWProduct2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage >= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2 - Hashable
// -------------------------------------------------------------------------- //

extension COWProduct2 : Hashable
  where
  A:Hashable,
  B:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2 - Codable
// -------------------------------------------------------------------------- //

extension COWProduct2 : Codable
  where
  A:Codable,
  B:Codable {
  
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
// MARK: COWProduct2 - CaseIterable
// -------------------------------------------------------------------------- //

extension COWProduct2 : CaseIterable
  where
  A:CaseIterable,
  B:CaseIterable {
  
  public typealias AllCases = Product2Collection<
    A.AllCases,
    B.AllCases,
    InlineProduct2<
      A.AllCases.Index,
      B.AllCases.Index
    >,
    COWProduct2<
      A,
      B
    >
  >

  @inlinable
  public static var allCases: AllCases {
    get {
      return AllCases(
        A.allCases,
        B.allCases
      )
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2Storage - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct2Storage : Equatable
  where
  A:Equatable,
  B:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: COWProduct2Storage<A,B>,
    rhs: COWProduct2Storage<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage == rhs.storage
  }

  @inlinable
  internal static func !=(
    lhs: COWProduct2Storage<A,B>,
    rhs: COWProduct2Storage<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2Storage - Comparable
// -------------------------------------------------------------------------- //

extension COWProduct2Storage : Comparable
  where
  A:Comparable,
  B:Comparable {
  
  @inlinable
  internal static func <(
    lhs: COWProduct2Storage<A,B>,
    rhs: COWProduct2Storage<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage < rhs.storage
  }

  @inlinable
  internal static func >(
    lhs: COWProduct2Storage<A,B>,
    rhs: COWProduct2Storage<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs !== rhs && lhs.storage > rhs.storage
  }

  @inlinable
  internal static func <=(
    lhs: COWProduct2Storage<A,B>,
    rhs: COWProduct2Storage<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage <= rhs.storage
  }

  @inlinable
  internal static func >=(
    lhs: COWProduct2Storage<A,B>,
    rhs: COWProduct2Storage<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs === rhs || lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2Storage - Hashable
// -------------------------------------------------------------------------- //

extension COWProduct2Storage : Hashable
  where
  A:Hashable,
  B:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2Storage - Codable
// -------------------------------------------------------------------------- //

extension COWProduct2Storage : Codable
  where
  A:Codable,
  B:Codable {

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
