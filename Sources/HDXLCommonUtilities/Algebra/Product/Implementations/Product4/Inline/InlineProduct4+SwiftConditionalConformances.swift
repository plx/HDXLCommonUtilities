//
//  InlineProduct4+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct4 - Equatable
// -------------------------------------------------------------------------- //

extension InlineProduct4 : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable {
  
  @inlinable
  public static func ==(
    lhs: InlineProduct4<A,B,C,D>,
    rhs: InlineProduct4<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d else {
        return false
    }
    return true
  }
  
  @inlinable
  public static func !=(
    lhs: InlineProduct4<A,B,C,D>,
    rhs: InlineProduct4<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d else {
        return true
    }
    return false
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct4 - Comparable
// -------------------------------------------------------------------------- //

extension InlineProduct4 : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable {
  
  @inlinable
  public static func <(
    lhs: InlineProduct4<A,B,C,D>,
    rhs: InlineProduct4<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c,
      lhs.d <=> rhs.d
    ).impliesLessThan
  }
  
  @inlinable
  public static func >(
    lhs: InlineProduct4<A,B,C,D>,
    rhs: InlineProduct4<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c,
      lhs.d <=> rhs.d
    ).impliesGreaterThan
  }
  
  @inlinable
  public static func <=(
    lhs: InlineProduct4<A,B,C,D>,
    rhs: InlineProduct4<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c,
      lhs.d <=> rhs.d
    ).impliesLessThanOrEqual
  }

  @inlinable
  public static func >=(
    lhs: InlineProduct4<A,B,C,D>,
    rhs: InlineProduct4<A,B,C,D>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c,
      lhs.d <=> rhs.d
    ).impliesGreaterThanOrEqual
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct4 - Hashable
// -------------------------------------------------------------------------- //

extension InlineProduct4 : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
    self.d.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct4 - Codable
// -------------------------------------------------------------------------- //

extension InlineProduct4 : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable {
  
  public enum CodingKeys : String, CodingKey {
    
    case a = "a"
    case b = "b"
    case c = "c"
    case d = "d"

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
        case .d:
          return 3
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
      case 3:
        self = .d
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
    try values.encode(
      self.d,
      forKey: .d
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
    let d = try values.decode(
      D.self,
      forKey: .d
    )
    self.init(
      a,
      b,
      c,
      d
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct4 - CaseIterable
// -------------------------------------------------------------------------- //

extension InlineProduct4 : CaseIterable
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
    InlineProduct4<
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
