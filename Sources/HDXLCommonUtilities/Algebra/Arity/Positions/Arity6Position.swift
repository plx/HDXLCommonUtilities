//
//  Arity6Position.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Arity6Position - Definition
// -------------------------------------------------------------------------- //

public enum Arity6Position : UInt8 {
  
  case a
  case b
  case c
  case d
  case e
  case f
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity6Position - Equatable
// -------------------------------------------------------------------------- //

extension Arity6Position : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Arity6Position,
    rhs: Arity6Position) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  @inlinable
  public static func !=(
    lhs: Arity6Position,
    rhs: Arity6Position) -> Bool {
    return lhs.rawValue != rhs.rawValue
  }

}

// -------------------------------------------------------------------------- //
// MARK: Arity6Position - Comparable
// -------------------------------------------------------------------------- //

extension Arity6Position : Comparable {
  
  @inlinable
  public static func <(
    lhs: Arity6Position,
    rhs: Arity6Position) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  public static func >(
    lhs: Arity6Position,
    rhs: Arity6Position) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  public static func >=(
    lhs: Arity6Position,
    rhs: Arity6Position) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }

  @inlinable
  public static func <=(
    lhs: Arity6Position,
    rhs: Arity6Position) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity6Position - Hashable
// -------------------------------------------------------------------------- //

extension Arity6Position : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity6Position - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Arity6Position : CustomStringConvertible {
  
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
      case .d:
        return ".d"
      case .e:
        return ".e"
      case .f:
        return ".f"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity6Position - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Arity6Position : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Arity6Position\(self.description)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity6Position - Codable
// -------------------------------------------------------------------------- //

extension Arity6Position : Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity6Position - CaseIterable
// -------------------------------------------------------------------------- //

extension Arity6Position : CaseIterable {
  
  public typealias AllCases = [Arity6Position]
  
  @inlinable
  public static var allCases: AllCases {
    get {
      return [
        .a,
        .b,
        .c,
        .d,
        .e,
        .f
      ]
    }
  }
  
}
