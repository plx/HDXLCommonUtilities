//
//  Sum2+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Sum2 - Equatable
// -------------------------------------------------------------------------- //

extension Sum2 : Equatable
  where
  A:Equatable,
  B:Equatable {
  
  @inlinable
  public static func ==(
    lhs: Sum2<A,B>,
    rhs: Sum2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch (lhs, rhs) {
    case (.a(let l), .a(let r)):
      return l == r
    case (.b(let l), .b(let r)):
      return l == r
    default:
      return false
    }
  }

  @inlinable
  public static func !=(
    lhs: Sum2<A,B>,
    rhs: Sum2<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch (lhs, rhs) {
    case (.a(let l), .a(let r)):
      return l != r
    case (.b(let l), .b(let r)):
      return l != r
    default:
      return true
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Sum2 - Hashable
// -------------------------------------------------------------------------- //

extension Sum2 : Hashable
  where
  A:Hashable,
  B:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.occupiedPosition.hash(into: &hasher)
    switch self {
    case .a(let value):
      value.hash(into: &hasher)
    case .b(let value):
      value.hash(into: &hasher)
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Sum2 - Codable
// -------------------------------------------------------------------------- //

extension Sum2 : Codable
  where
  A:Codable,
  B:Codable {
  
  public enum CodingKeys: String, CodingKey {
    
    case position = "position"
    
    case a = "a"
    case b = "b"
    
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
    }
  }
  
  @inlinable
  public init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    let position = try values.decode(
      Arity2Position.self,
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
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Sum2 - CaseIterable
// -------------------------------------------------------------------------- //

extension Sum2 : CaseIterable
  where
  A:CaseIterable,
  B:CaseIterable {
  
  public typealias AllCases = SumChain2Collection<
    A.AllCases,
    B.AllCases
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
