//
//  InlineProduct3+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct3 - Equatable
// -------------------------------------------------------------------------- //

extension InlineProduct3 : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable {
  
  @inlinable
  public static func ==(
    lhs: InlineProduct3<A,B,C>,
    rhs: InlineProduct3<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c else {
        return false
    }
    return true
  }
  
  @inlinable
  public static func !=(
    lhs: InlineProduct3<A,B,C>,
    rhs: InlineProduct3<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c else {
        return true
    }
    return false
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct3 - Comparable
// -------------------------------------------------------------------------- //

extension InlineProduct3 : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable {
  
  @inlinable
  public static func <(
    lhs: InlineProduct3<A,B,C>,
    rhs: InlineProduct3<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c
    ).impliesLessThan
  }
  
  @inlinable
  public static func >(
    lhs: InlineProduct3<A,B,C>,
    rhs: InlineProduct3<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c
    ).impliesGreaterThan
  }
  
  @inlinable
  public static func <=(
    lhs: InlineProduct3<A,B,C>,
    rhs: InlineProduct3<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c
    ).impliesLessThanOrEqual
  }

  @inlinable
  public static func >=(
    lhs: InlineProduct3<A,B,C>,
    rhs: InlineProduct3<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c
    ).impliesGreaterThanOrEqual
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct3 - Hashable
// -------------------------------------------------------------------------- //

extension InlineProduct3 : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct3 - Codable
// -------------------------------------------------------------------------- //

extension InlineProduct3 : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable {
  
  public enum CodingKeys : String, CodingKey {
    
    case a = "a"
    case b = "b"
    case c = "c"

    @inlinable
    public var intValue: Int? {
      get {
        switch self {
        case .a:
          return 0
        case .b:
          return 1
        case .c:
          return 2
        }
      }
    }
    
    @inlinable
    public init?(intValue: Int) {
      switch intValue {
      case 0:
        self = .a
      case 1:
        self = .b
      case 2:
        self = .c
      default:
        return nil
      }
    }
    
  }
  
  @inlinable
  public func encode(to encoder: Encoder) throws {
    var values = encoder.container(keyedBy: CodingKeys.self)
    try values.encode(
      self.a,
      forKey: .a
    )
    try values.encode(
      self.b,
      forKey: .b
    )
    try values.encode(
      self.c,
      forKey: .c
    )
  }
  
  @inlinable
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let a = try values.decode(
      A.self,
      forKey: .a
    )
    let b = try values.decode(
      B.self,
      forKey: .b
    )
    let c = try values.decode(
      C.self,
      forKey: .c
    )
    self.init(
      a,
      b,
      c
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct3 - CaseIterable
// -------------------------------------------------------------------------- //

extension InlineProduct3 : CaseIterable
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
    InlineProduct3<
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
