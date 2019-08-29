//
//  InlineProduct5+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct5 - Equatable
// -------------------------------------------------------------------------- //

extension InlineProduct5 : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable {
  
  @inlinable
  public static func ==(
    lhs: InlineProduct5<A,B,C,D,E>,
    rhs: InlineProduct5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d,
      lhs.e == rhs.e else {
        return false
    }
    return true
  }
  
  @inlinable
  public static func !=(
    lhs: InlineProduct5<A,B,C,D,E>,
    rhs: InlineProduct5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d,
      lhs.e == rhs.e else {
        return true
    }
    return false
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct5 - Comparable
// -------------------------------------------------------------------------- //

extension InlineProduct5 : Comparable
  where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable,
  E:Comparable {
  
  @inlinable
  public static func <(
    lhs: InlineProduct5<A,B,C,D,E>,
    rhs: InlineProduct5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c,
      lhs.d <=> rhs.d,
      lhs.e <=> rhs.e
    ).impliesLessThan
  }
  
  @inlinable
  public static func >(
    lhs: InlineProduct5<A,B,C,D,E>,
    rhs: InlineProduct5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c,
      lhs.d <=> rhs.d,
      lhs.e <=> rhs.e
    ).impliesGreaterThan
  }
  
  @inlinable
  public static func <=(
    lhs: InlineProduct5<A,B,C,D,E>,
    rhs: InlineProduct5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c,
      lhs.d <=> rhs.d,
      lhs.e <=> rhs.e
    ).impliesLessThanOrEqual
  }

  @inlinable
  public static func >=(
    lhs: InlineProduct5<A,B,C,D,E>,
    rhs: InlineProduct5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c,
      lhs.d <=> rhs.d,
      lhs.e <=> rhs.e
    ).impliesGreaterThanOrEqual
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct5 - Hashable
// -------------------------------------------------------------------------- //

extension InlineProduct5 : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
    self.d.hash(into: &hasher)
    self.e.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct5 - Codable
// -------------------------------------------------------------------------- //

extension InlineProduct5 : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable {
  
  public enum CodingKeys : String, CodingKey {
    
    case a = "a"
    case b = "b"
    case c = "c"
    case d = "d"
    case e = "e"

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
        case .e:
          return 4
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
      case 4:
        self = .e
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
    try values.encode(
      self.e,
      forKey: .e
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
    let e = try values.decode(
      E.self,
      forKey: .e
    )
    self.init(
      a,
      b,
      c,
      d,
      e
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct5 - CaseIterable
// -------------------------------------------------------------------------- //

extension InlineProduct5 : CaseIterable
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
    InlineProduct5<
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
