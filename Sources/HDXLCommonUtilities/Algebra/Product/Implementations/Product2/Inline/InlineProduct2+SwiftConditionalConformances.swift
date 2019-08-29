//
//  InlineProduct2+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct2 - Equatable
// -------------------------------------------------------------------------- //

extension InlineProduct2 : Equatable
  where
  A:Equatable,
  B:Equatable {
  
  @inlinable
  public static func ==(
    lhs: InlineProduct2<A,B>,
    rhs: InlineProduct2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b else {
        return false
    }
    return true
  }
  
  @inlinable
  public static func !=(
    lhs: InlineProduct2<A,B>,
    rhs: InlineProduct2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b else {
        return true
    }
    return false
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct2 - Comparable
// -------------------------------------------------------------------------- //

extension InlineProduct2 : Comparable
  where
  A:Comparable,
  B:Comparable {
  
  @inlinable
  public static func <(
    lhs: InlineProduct2<A,B>,
    rhs: InlineProduct2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b
    ).impliesLessThan
  }
  
  @inlinable
  public static func >(
    lhs: InlineProduct2<A,B>,
    rhs: InlineProduct2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b
    ).impliesGreaterThan
  }
  
  @inlinable
  public static func <=(
    lhs: InlineProduct2<A,B>,
    rhs: InlineProduct2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b
    ).impliesLessThanOrEqual
  }

  @inlinable
  public static func >=(
    lhs: InlineProduct2<A,B>,
    rhs: InlineProduct2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      lhs.a <=> rhs.a,
      lhs.b <=> rhs.b
    ).impliesGreaterThanOrEqual
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct2 - Hashable
// -------------------------------------------------------------------------- //

extension InlineProduct2 : Hashable
  where
  A:Hashable,
  B:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct2 - Codable
// -------------------------------------------------------------------------- //

extension InlineProduct2 : Codable
  where
  A:Codable,
  B:Codable {
  
  public enum CodingKeys : String, CodingKey {
    
    case a = "a"
    case b = "b"

    @inlinable
    public var intValue: Int? {
      get {
        switch self {
        case .a:
          return 0
        case .b:
          return 1
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
    self.init(
      a,
      b
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct2 - CaseIterable
// -------------------------------------------------------------------------- //

extension InlineProduct2 : CaseIterable
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
    InlineProduct2<
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
