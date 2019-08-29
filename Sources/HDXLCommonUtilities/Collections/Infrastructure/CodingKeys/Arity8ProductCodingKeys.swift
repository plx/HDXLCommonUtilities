//
//  Arity8ProductCodingKeys.swift
//

import Foundation

public enum Arity8ProductCodingKeys : String, CodingKey, CaseIterable {
  
  case a = "a"
  case b = "b"
  case c = "c"
  case d = "d"
  case e = "e"
  case f = "f"
  case g = "g"
  case h = "h"
  
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
    default:
      return nil
    }
  }
  
  public typealias AllCases = [Arity8ProductCodingKeys]
  
  @inlinable
  public static var allCases: [Arity8ProductCodingKeys] {
    get {
      return [
        .a,
        .b,
        .c,
        .d,
        .e,
        .f,
        .g,
        .h
      ]
    }
  }
  
}

