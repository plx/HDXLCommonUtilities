//
//  Arity9Position.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Arity9Position - Definition
// -------------------------------------------------------------------------- //

public enum Arity9Position : UInt8 {
  
  case a
  case b
  case c
  case d
  case e
  case f
  case g
  case h
  case i
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity9Position - Equatable
// -------------------------------------------------------------------------- //

extension Arity9Position : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Arity9Position,
    rhs: Arity9Position) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  @inlinable
  public static func !=(
    lhs: Arity9Position,
    rhs: Arity9Position) -> Bool {
    return lhs.rawValue != rhs.rawValue
  }

}

// -------------------------------------------------------------------------- //
// MARK: Arity9Position - Comparable
// -------------------------------------------------------------------------- //

extension Arity9Position : Comparable {
  
  @inlinable
  public static func <(
    lhs: Arity9Position,
    rhs: Arity9Position) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  public static func >(
    lhs: Arity9Position,
    rhs: Arity9Position) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  public static func >=(
    lhs: Arity9Position,
    rhs: Arity9Position) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }

  @inlinable
  public static func <=(
    lhs: Arity9Position,
    rhs: Arity9Position) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity9Position - Hashable
// -------------------------------------------------------------------------- //

extension Arity9Position : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity9Position - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Arity9Position : CustomStringConvertible {
  
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
      case .i:
        return ".i"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity9Position - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Arity9Position : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Arity9Position\(self.description)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity9Position - Codable
// -------------------------------------------------------------------------- //

extension Arity9Position : Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity9Position - CaseIterable
// -------------------------------------------------------------------------- //

extension Arity9Position : CaseIterable {
  
  public typealias AllCases = [Arity9Position]
  
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
        .h,
        .i
      ]
    }
  }
  
}
