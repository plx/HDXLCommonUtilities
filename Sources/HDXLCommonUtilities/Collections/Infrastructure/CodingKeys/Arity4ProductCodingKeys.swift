//
//  Arity4ProductCodingKeys.swift
//

import Foundation

public enum Arity4ProductCodingKeys : String, CodingKey, CaseIterable {
  
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

  public typealias AllCases = [Arity4ProductCodingKeys]

  @inlinable
  public static var allCases: [Arity4ProductCodingKeys] {
    get {
      return [
        .a,
        .b,
        .c,
        .d
      ]
    }
  }

}

