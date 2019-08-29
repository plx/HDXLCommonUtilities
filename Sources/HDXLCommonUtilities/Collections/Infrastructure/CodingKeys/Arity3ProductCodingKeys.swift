//
//  Arity3ProductCodingKeys.swift
//

import Foundation

public enum Arity3ProductCodingKeys : String, CodingKey, CaseIterable {
  
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

  public typealias AllCases = [Arity3ProductCodingKeys]

  @inlinable
  public static var allCases: [Arity3ProductCodingKeys] {
    get {
      return [
        .a,
        .b,
        .c
      ]
    }
  }

}

