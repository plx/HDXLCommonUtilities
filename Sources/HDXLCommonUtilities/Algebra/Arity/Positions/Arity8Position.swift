//
//  Arity8Position.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Arity8Position - Definition
// -------------------------------------------------------------------------- //

public enum Arity8Position : UInt8 {
  
  case a
  case b
  case c
  case d
  case e
  case f
  case g
  case h
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity8Position - Equatable
// -------------------------------------------------------------------------- //

extension Arity8Position : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Arity8Position,
    rhs: Arity8Position) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  @inlinable
  public static func !=(
    lhs: Arity8Position,
    rhs: Arity8Position) -> Bool {
    return lhs.rawValue != rhs.rawValue
  }

}

// -------------------------------------------------------------------------- //
// MARK: Arity8Position - Comparable
// -------------------------------------------------------------------------- //

extension Arity8Position : Comparable {
  
  @inlinable
  public static func <(
    lhs: Arity8Position,
    rhs: Arity8Position) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  public static func >(
    lhs: Arity8Position,
    rhs: Arity8Position) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  public static func >=(
    lhs: Arity8Position,
    rhs: Arity8Position) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }

  @inlinable
  public static func <=(
    lhs: Arity8Position,
    rhs: Arity8Position) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity8Position - Hashable
// -------------------------------------------------------------------------- //

extension Arity8Position : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity8Position - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Arity8Position : CustomStringConvertible {
  
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
      case .g:
        return ".g"
      case .h:
        return ".h"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity8Position - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Arity8Position : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Arity8Position\(self.description)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity8Position - Codable
// -------------------------------------------------------------------------- //

extension Arity8Position : Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity8Position - CaseIterable
// -------------------------------------------------------------------------- //

extension Arity8Position : CaseIterable {
  
  public typealias AllCases = [Arity8Position]
  
  @inlinable
  public static var allCases: AllCases {
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
