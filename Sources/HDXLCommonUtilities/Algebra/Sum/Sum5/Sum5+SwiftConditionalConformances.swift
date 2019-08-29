//
//  Sum5+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Sum5 - Equatable
// -------------------------------------------------------------------------- //

extension Sum5 : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable {
  
  @inlinable
  public static func ==(
    lhs: Sum5<A,B,C,D,E>,
    rhs: Sum5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch (lhs, rhs) {
    case (.a(let l), .a(let r)):
      return l == r
    case (.b(let l), .b(let r)):
      return l == r
    case (.c(let l), .c(let r)):
      return l == r
    case (.d(let l), .d(let r)):
      return l == r
    case (.e(let l), .e(let r)):
      return l == r
    default:
      return false
    }
  }

  @inlinable
  public static func !=(
    lhs: Sum5<A,B,C,D,E>,
    rhs: Sum5<A,B,C,D,E>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch (lhs, rhs) {
    case (.a(let l), .a(let r)):
      return l != r
    case (.b(let l), .b(let r)):
      return l != r
    case (.c(let l), .c(let r)):
      return l != r
    case (.d(let l), .d(let r)):
      return l != r
    case (.e(let l), .e(let r)):
      return l != r
    default:
      return true
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Sum5 - Hashable
// -------------------------------------------------------------------------- //

extension Sum5 : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.occupiedPosition.hash(into: &hasher)
    switch self {
    case .a(let value):
      value.hash(into: &hasher)
    case .b(let value):
      value.hash(into: &hasher)
    case .c(let value):
      value.hash(into: &hasher)
    case .d(let value):
      value.hash(into: &hasher)
    case .e(let value):
      value.hash(into: &hasher)
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Sum5 - Codable
// -------------------------------------------------------------------------- //

extension Sum5 : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable {
  
  public enum CodingKeys: String, CodingKey {
    
    case position = "position"
    
    case a = "a"
    case b = "b"
    case c = "c"
    case d = "d"
    case e = "e"
    
    @inlinable
    public var intValue: Int? {
      get {
        switch self {
        case .position:
          return 0
        case .a:
          return 1
        case .b:
          return 2
        case .c:
          return 3
        case .d:
          return 4
        case .e:
          return 5
        }
      }
    }
    
    @inlinable
    public init?(intValue: Int) {
      switch intValue {
      case 0:
        self = .position
      case 1:
        self = .a
      case 2:
        self = .b
      case 3:
        self = .c
      case 4:
        self = .d
      case 5:
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
      self.occupiedPosition,
      forKey: .position
    )
    switch self {
    case .a(let a):
      try values.encode(
        a,
        forKey: .a
      )
    case .b(let b):
      try values.encode(
        b,
        forKey: .b
      )
    case .c(let c):
      try values.encode(
        c,
        forKey: .c
      )
    case .d(let d):
      try values.encode(
        d,
        forKey: .d
      )
    case .e(let e):
      try values.encode(
        e,
        forKey: .e
      )
    }
  }
  
  @inlinable
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let position = try values.decode(
      Arity5Position.self,
      forKey: .position
    )
    switch position {
    case .a:
      self = .a(
        try values.decode(
          A.self,
          forKey: .a
        )
      )
    case .b:
      self = .b(
        try values.decode(
          B.self,
          forKey: .b
        )
      )
    case .c:
      self = .c(
        try values.decode(
          C.self,
          forKey: .c
        )
      )
    case .d:
      self = .d(
        try values.decode(
          D.self,
          forKey: .d
        )
      )
    case .e:
      self = .e(
        try values.decode(
          E.self,
          forKey: .e
        )
      )
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Sum5 - CaseIterable
// -------------------------------------------------------------------------- //

extension Sum5 : CaseIterable
  where
  A:CaseIterable,
  B:CaseIterable,
  C:CaseIterable,
  D:CaseIterable,
  E:CaseIterable {
  
  public typealias AllCases = SumChain5Collection<
    A.AllCases,
    B.AllCases,
    C.AllCases,
    D.AllCases,
    E.AllCases
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
