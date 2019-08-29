//
//  Arity3Position.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Arity3Position - Definition
// -------------------------------------------------------------------------- //

public enum Arity3Position : UInt8 {
  
  case a
  case b
  case c
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity3Position - Equatable
// -------------------------------------------------------------------------- //

extension Arity3Position : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Arity3Position,
    rhs: Arity3Position) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  @inlinable
  public static func !=(
    lhs: Arity3Position,
    rhs: Arity3Position) -> Bool {
    return lhs.rawValue != rhs.rawValue
  }

}

// -------------------------------------------------------------------------- //
// MARK: Arity3Position - Comparable
// -------------------------------------------------------------------------- //

extension Arity3Position : Comparable {
  
  @inlinable
  public static func <(
    lhs: Arity3Position,
    rhs: Arity3Position) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  public static func >(
    lhs: Arity3Position,
    rhs: Arity3Position) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  public static func >=(
    lhs: Arity3Position,
    rhs: Arity3Position) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }

  @inlinable
  public static func <=(
    lhs: Arity3Position,
    rhs: Arity3Position) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity3Position - Hashable
// -------------------------------------------------------------------------- //

extension Arity3Position : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity3Position - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Arity3Position : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      switch self {
      case .a:
        return ".a"
      case .b:
        return ".b"
      case .c:
        return ".c"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity3Position - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Arity3Position : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Arity3Position\(self.description)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity3Position - Codable
// -------------------------------------------------------------------------- //

extension Arity3Position : Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity3Position - CaseIterable
// -------------------------------------------------------------------------- //

extension Arity3Position : CaseIterable {
  
  public typealias AllCases = [Arity3Position]
  
  @inlinable
  public static var allCases: AllCases {
    get {
      return [
        .a,
        .b,
        .c
      ]
    }
  }
  
}
