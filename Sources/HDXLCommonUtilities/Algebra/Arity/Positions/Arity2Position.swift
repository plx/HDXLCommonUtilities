//
//  Arity2Position.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Arity2Position - Definition
// -------------------------------------------------------------------------- //

public enum Arity2Position : UInt8 {
  
  case a
  case b
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity2Position - Equatable
// -------------------------------------------------------------------------- //

extension Arity2Position : Equatable {
  
  @inlinable
  public static func ==(
    lhs: Arity2Position,
    rhs: Arity2Position) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

  @inlinable
  public static func !=(
    lhs: Arity2Position,
    rhs: Arity2Position) -> Bool {
    return lhs.rawValue != rhs.rawValue
  }

}

// -------------------------------------------------------------------------- //
// MARK: Arity2Position - Comparable
// -------------------------------------------------------------------------- //

extension Arity2Position : Comparable {
  
  @inlinable
  public static func <(
    lhs: Arity2Position,
    rhs: Arity2Position) -> Bool {
    return lhs.rawValue < rhs.rawValue
  }

  @inlinable
  public static func >(
    lhs: Arity2Position,
    rhs: Arity2Position) -> Bool {
    return lhs.rawValue > rhs.rawValue
  }
  
  @inlinable
  public static func >=(
    lhs: Arity2Position,
    rhs: Arity2Position) -> Bool {
    return lhs.rawValue >= rhs.rawValue
  }

  @inlinable
  public static func <=(
    lhs: Arity2Position,
    rhs: Arity2Position) -> Bool {
    return lhs.rawValue <= rhs.rawValue
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity2Position - Hashable
// -------------------------------------------------------------------------- //

extension Arity2Position : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity2Position - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Arity2Position : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      switch self {
      case .a:
        return ".a"
      case .b:
        return ".b"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity2Position - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Arity2Position : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Arity2Position\(self.description)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity2Position - Codable
// -------------------------------------------------------------------------- //

extension Arity2Position : Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity2Position - CaseIterable
// -------------------------------------------------------------------------- //

extension Arity2Position : CaseIterable {
  
  public typealias AllCases = [Arity2Position]
  
  @inlinable
  public static var allCases: AllCases {
    get {
      return [
        .a,
        .b
      ]
    }
  }
  
}
