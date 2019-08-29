//
//  Arity5Position.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Arity5Position - Definition
// -------------------------------------------------------------------------- //

public enum Arity5Position : UInt8 {
  
  case a
  case b
  case c
  case d
  case e
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity5Position - Equatable
// -------------------------------------------------------------------------- //

extension Arity5Position : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Arity5Position,
    rhs: Arity5Position) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  @inlinable
  public static func !=(
    lhs: Arity5Position,
    rhs: Arity5Position) -> Bool {
    return lhs.rawValue != rhs.rawValue
  }

}

// -------------------------------------------------------------------------- //
// MARK: Arity5Position - Comparable
// -------------------------------------------------------------------------- //

extension Arity5Position : Comparable {
  
  @inlinable
  public static func <(
    lhs: Arity5Position,
    rhs: Arity5Position) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  public static func >(
    lhs: Arity5Position,
    rhs: Arity5Position) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  public static func >=(
    lhs: Arity5Position,
    rhs: Arity5Position) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }

  @inlinable
  public static func <=(
    lhs: Arity5Position,
    rhs: Arity5Position) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity5Position - Hashable
// -------------------------------------------------------------------------- //

extension Arity5Position : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity5Position - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Arity5Position : CustomStringConvertible {
  
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
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity5Position - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Arity5Position : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Arity5Position\(self.description)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity5Position - Codable
// -------------------------------------------------------------------------- //

extension Arity5Position : Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity5Position - CaseIterable
// -------------------------------------------------------------------------- //

extension Arity5Position : CaseIterable {
  
  public typealias AllCases = [Arity5Position]
  
  @inlinable
  public static var allCases: AllCases {
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
