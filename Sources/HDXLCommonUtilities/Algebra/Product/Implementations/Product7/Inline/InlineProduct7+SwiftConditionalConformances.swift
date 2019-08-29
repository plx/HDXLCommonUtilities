//
//  InlineProduct7+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct7 - Equatable
// -------------------------------------------------------------------------- //

extension InlineProduct7 : Equatable
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
    lhs: InlineProduct7<A,B,C,D,E,F,G>,
    rhs: InlineProduct7<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d,
      lhs.e == rhs.e,
      lhs.f == rhs.f,
      lhs.g == rhs.g else {
        return false
    }
    return true
  }
  
  @inlinable
  public static func !=(
    lhs: InlineProduct7<A,B,C,D,E,F,G>,
    rhs: InlineProduct7<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d,
      lhs.e == rhs.e,
      lhs.f == rhs.f,
      lhs.g == rhs.g else {
        return true
    }
    return false
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct7 - Comparable
// -------------------------------------------------------------------------- //

extension InlineProduct7 : Comparable
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
    lhs: InlineProduct7<A,B,C,D,E,F,G>,
    rhs: InlineProduct7<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c,
      lhs.d <=> rhs.d,
      lhs.e <=> rhs.e,
      lhs.f <=> rhs.f,
      lhs.g <=> rhs.g
    ).impliesLessThan
  }
  
  @inlinable
  public static func >(
    lhs: InlineProduct7<A,B,C,D,E,F,G>,
    rhs: InlineProduct7<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c,
      lhs.d <=> rhs.d,
      lhs.e <=> rhs.e,
      lhs.f <=> rhs.f,
      lhs.g <=> rhs.g
    ).impliesGreaterThan
  }
  
  @inlinable
  public static func <=(
    lhs: InlineProduct7<A,B,C,D,E,F,G>,
    rhs: InlineProduct7<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c,
      lhs.d <=> rhs.d,
      lhs.e <=> rhs.e,
      lhs.f <=> rhs.f,
      lhs.g <=> rhs.g
    ).impliesLessThanOrEqual
  }

  @inlinable
  public static func >=(
    lhs: InlineProduct7<A,B,C,D,E,F,G>,
    rhs: InlineProduct7<A,B,C,D,E,F,G>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b,
      lhs.c <=> rhs.c,
      lhs.d <=> rhs.d,
      lhs.e <=> rhs.e,
      lhs.f <=> rhs.f,
      lhs.g <=> rhs.g
    ).impliesGreaterThanOrEqual
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct7 - Hashable
// -------------------------------------------------------------------------- //

extension InlineProduct7 : Hashable
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
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
    self.d.hash(into: &hasher)
    self.e.hash(into: &hasher)
    self.f.hash(into: &hasher)
    self.g.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct7 - Codable
// -------------------------------------------------------------------------- //

extension InlineProduct7 : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable,
  F:Codable,
  G:Codable {
  
  public enum CodingKeys : String, CodingKey {
    
    case a = "a"
    case b = "b"
    case c = "c"
    case d = "d"
    case e = "e"
    case f = "f"
    case g = "g"

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
        case .f:
          return 5
        case .g:
          return 6
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
      case 5:
        self = .f
      case 6:
        self = .g
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
    try values.encode(
      self.f,
      forKey: .f
    )
    try values.encode(
      self.g,
      forKey: .g
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
    let f = try values.decode(
      F.self,
      forKey: .f
    )
    let g = try values.decode(
      G.self,
      forKey: .g
    )
    self.init(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct7 - CaseIterable
// -------------------------------------------------------------------------- //

extension InlineProduct7 : CaseIterable
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
    InlineProduct7<
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
