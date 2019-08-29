//
//  Arity5ProductCodingKeys.swift
//

import Foundation

public enum Arity5ProductCodingKeys : String, CodingKey, CaseIterable {
  
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

  public typealias AllCases = [Arity5ProductCodingKeys]

  @inlinable
  public static var allCases: [Arity5ProductCodingKeys] {
    get {
      return [
        .a,
        .b,
        .c,
        .d,
        .e
      ]
    }
  }

}

