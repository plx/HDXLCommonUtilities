//
//  InlineProduct9+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - Equatable
// -------------------------------------------------------------------------- //

extension InlineProduct9 : Equatable
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
    lhs: InlineProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9<A,B,C,D,E,F,G,H,I>) -> Bool {
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
      lhs.g == rhs.g,
      lhs.h == rhs.h,
      lhs.i == rhs.i else {
        return false
    }
    return true
  }
  
  @inlinable
  public static func !=(
    lhs: InlineProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9<A,B,C,D,E,F,G,H,I>) -> Bool {
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
      lhs.g == rhs.g,
      lhs.h == rhs.h,
      lhs.i == rhs.i else {
        return true
    }
    return false
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - Comparable
// -------------------------------------------------------------------------- //

extension InlineProduct9 : Comparable
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
    lhs: InlineProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9<A,B,C,D,E,F,G,H,I>) -> Bool {
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
      lhs.g <=> rhs.g,
      lhs.h <=> rhs.h,
      lhs.i <=> rhs.i
    ).impliesLessThan
  }
  
  @inlinable
  public static func >(
    lhs: InlineProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9<A,B,C,D,E,F,G,H,I>) -> Bool {
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
      lhs.g <=> rhs.g,
      lhs.h <=> rhs.h,
      lhs.i <=> rhs.i
    ).impliesGreaterThan
  }
  
  @inlinable
  public static func <=(
    lhs: InlineProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9<A,B,C,D,E,F,G,H,I>) -> Bool {
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
      lhs.g <=> rhs.g,
      lhs.h <=> rhs.h,
      lhs.i <=> rhs.i
    ).impliesLessThanOrEqual
  }

  @inlinable
  public static func >=(
    lhs: InlineProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9<A,B,C,D,E,F,G,H,I>) -> Bool {
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
      lhs.g <=> rhs.g,
      lhs.h <=> rhs.h,
      lhs.i <=> rhs.i
    ).impliesGreaterThanOrEqual
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - Hashable
// -------------------------------------------------------------------------- //

extension InlineProduct9 : Hashable
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
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
    self.d.hash(into: &hasher)
    self.e.hash(into: &hasher)
    self.f.hash(into: &hasher)
    self.g.hash(into: &hasher)
    self.h.hash(into: &hasher)
    self.i.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - Codable
// -------------------------------------------------------------------------- //

extension InlineProduct9 : Codable
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
  
  public enum CodingKeys : String, CodingKey {
    
    case a = "a"
    case b = "b"
    case c = "c"
    case d = "d"
    case e = "e"
    case f = "f"
    case g = "g"
    case h = "h"
    case i = "i"

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
        case .h:
          return 7
        case .i:
          return 8
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
      case 7:
        self = .h
      case 8:
        self = .i
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
    try values.encode(
      self.h,
      forKey: .h
    )
    try values.encode(
      self.i,
      forKey: .i
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
    let h = try values.decode(
      H.self,
      forKey: .h
    )
    let i = try values.decode(
      I.self,
      forKey: .i
    )
    self.init(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - CaseIterable
// -------------------------------------------------------------------------- //

extension InlineProduct9 : CaseIterable
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
  
  public typealias AllCases =  OnDemandDirectMap<
    Product9Collection<
      A.AllCases,
      B.AllCases,
      C.AllCases,
      D.AllCases,
      E.AllCases,
      F.AllCases,
      G.AllCases,
      H.AllCases,
      I.AllCases
    >,
    InlineProduct9<A,B,C,D,E,F,G,H,I>
  >
  
  @inlinable
  public static var allCases: AllCases {
    get {
      return Product9Collection<
        A.AllCases,
        B.AllCases,
        C.AllCases,
        D.AllCases,
        E.AllCases,
        F.AllCases,
        G.AllCases,
        H.AllCases,
        I.AllCases
        >(
          A.allCases,
          B.allCases,
          C.allCases,
          D.allCases,
          E.allCases,
          F.allCases,
          G.allCases,
          H.allCases,
          I.allCases
        ).directlyMappedOnDemand() {
          (value: COWProduct9<A,B,C,D,E,F,G,H,I>) -> InlineProduct9<A,B,C,D,E,F,G,H,I>
          in
          return InlineProduct9<A,B,C,D,E,F,G,H,I>(
            value.a,
            value.b,
            value.c,
            value.d,
            value.e,
            value.f,
            value.g,
            value.h,
            value.i
          )
      }
    }
  }
  
}
