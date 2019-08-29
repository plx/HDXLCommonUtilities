//
//  Arity4Position.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Arity4Position - Definition
// -------------------------------------------------------------------------- //

public enum Arity4Position : UInt8 {
  
  case a
  case b
  case c
  case d
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity4Position - Equatable
// -------------------------------------------------------------------------- //

extension Arity4Position : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Arity4Position,
    rhs: Arity4Position) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  @inlinable
  public static func !=(
    lhs: Arity4Position,
    rhs: Arity4Position) -> Bool {
    return lhs.rawValue != rhs.rawValue
  }

}

// -------------------------------------------------------------------------- //
// MARK: Arity4Position - Comparable
// -------------------------------------------------------------------------- //

extension Arity4Position : Comparable {
  
  @inlinable
  public static func <(
    lhs: Arity4Position,
    rhs: Arity4Position) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  public static func >(
    lhs: Arity4Position,
    rhs: Arity4Position) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  public static func >=(
    lhs: Arity4Position,
    rhs: Arity4Position) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }

  @inlinable
  public static func <=(
    lhs: Arity4Position,
    rhs: Arity4Position) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity4Position - Hashable
// -------------------------------------------------------------------------- //

extension Arity4Position : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity4Position - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Arity4Position : CustomStringConvertible {
  
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
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity4Position - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Arity4Position : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Arity4Position\(self.description)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity4Position - Codable
// -------------------------------------------------------------------------- //

extension Arity4Position : Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity4Position - CaseIterable
// -------------------------------------------------------------------------- //

extension Arity4Position : CaseIterable {
  
  public typealias AllCases = [Arity4Position]
  
  @inlinable
  public static var allCases: AllCases {
    get {
      return [
        .a,
        .b,
        .c,
        .d
      ]
    }
  }
  
}
