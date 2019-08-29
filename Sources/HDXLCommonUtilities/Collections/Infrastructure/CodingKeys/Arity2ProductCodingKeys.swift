//
//  Arity2ProductCodingKeys.swift
//

import Foundation

public enum Arity2ProductCodingKeys : String, CodingKey, CaseIterable {
  
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
  
  public typealias AllCases = [Arity2ProductCodingKeys]

  @inlinable
  public static var allCases: [Arity2ProductCodingKeys] {
    get {
      return [
        .a,
        .b
      ]
    }
  }
  
}

