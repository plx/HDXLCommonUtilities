//
//  Arity7Position.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Arity7Position - Definition
// -------------------------------------------------------------------------- //

public enum Arity7Position : UInt8 {
  
  case a
  case b
  case c
  case d
  case e
  case f
  case g
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity7Position - Equatable
// -------------------------------------------------------------------------- //

extension Arity7Position : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Arity7Position,
    rhs: Arity7Position) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  @inlinable
  public static func !=(
    lhs: Arity7Position,
    rhs: Arity7Position) -> Bool {
    return lhs.rawValue != rhs.rawValue
  }

}

// -------------------------------------------------------------------------- //
// MARK: Arity7Position - Comparable
// -------------------------------------------------------------------------- //

extension Arity7Position : Comparable {
  
  @inlinable
  public static func <(
    lhs: Arity7Position,
    rhs: Arity7Position) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  public static func >(
    lhs: Arity7Position,
    rhs: Arity7Position) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  public static func >=(
    lhs: Arity7Position,
    rhs: Arity7Position) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }

  @inlinable
  public static func <=(
    lhs: Arity7Position,
    rhs: Arity7Position) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity7Position - Hashable
// -------------------------------------------------------------------------- //

extension Arity7Position : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity7Position - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Arity7Position : CustomStringConvertible {
  
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
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity7Position - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Arity7Position : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Arity7Position\(self.description)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity7Position - Codable
// -------------------------------------------------------------------------- //

extension Arity7Position : Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity7Position - CaseIterable
// -------------------------------------------------------------------------- //

extension Arity7Position : CaseIterable {
  
  public typealias AllCases = [Arity7Position]
  
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
        .g
      ]
    }
  }
  
}
