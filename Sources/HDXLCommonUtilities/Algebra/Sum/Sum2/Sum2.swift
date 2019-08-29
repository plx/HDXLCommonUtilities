//
//  Sum2.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Sum2 - Definition
// -------------------------------------------------------------------------- //

/// Enumeration of a 2-way "anonymous sum".
///
/// - note: This file should contain all *unconditionally-available* code for `Sum2`. Conditional conformances, etc., should be included in separate files.
public enum Sum2<A,B> {
  
  case a(A)
  case b(B)
  
}

// -------------------------------------------------------------------------- //
// MARK: Sum2 - Convenience Constructors
// -------------------------------------------------------------------------- //

public extension Sum2 {

  /// Constructs a `Sum2` by lazily-evaluating its arguments from left-to-right and using the first non-nil value discovered (if any).
  @inlinable
  static func firstNonNil(
    _ a: @autoclosure () -> A?,
    _ b: @autoclosure () -> B?) -> Sum2<A,B>? {
    if let a = a() {
      return .a(a)
    } else if let b = b() {
      return .b(b)
    } else {
      return nil
    }
  }

  /// Constructs a `Sum2` by lazily-evaluating its arguments from right-to-left and using the first non-nil value discovered (if any).
  @inlinable
  static func finalNonNil(
    _ a: @autoclosure () -> A?,
    _ b: @autoclosure () -> B?) -> Sum2<A,B>? {
    if let b = b() {
      return .b(b)
    } else if let a = a() {
      return .a(a)
    } else {
      return nil
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Sum2 - Position Access Support
// -------------------------------------------------------------------------- //

public extension Sum2 {
  
  typealias Position = Arity2Position
  
  @inlinable
  var occupiedPosition: Position {
    get {
      switch self {
      case .a(_):
        return .a
      case .b(_):
        return .b
      }
    }
  }
  
  /// `true` iff `position` is `self`'s occupied position.
  @inlinable
  func isOccupied(at position: Position) -> Bool {
    return self.occupiedPosition == position
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Sum2 - Has-Value Support
// -------------------------------------------------------------------------- //

public extension Sum2 {
  
  /// Returns `true` iff `self` is `.a(_)`; `false` otherwise.
  @inlinable
  var hasAValue: Bool {
    get {
      switch self {
      case .a(_):
        return true
      default:
        return false
      }
    }
  }
  
  /// Returns `true` iff `self` is `.b(_)`; `false` otherwise.
  @inlinable
  var hasBValue: Bool {
    get {
      switch self {
      case .b(_):
        return true
      default:
        return false
      }
    }
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: Sum2 - Direct Value Access Support
// -------------------------------------------------------------------------- //

public extension Sum2 {
  
  /// Directly returns the value when `self` is `.a(value)`; `nil` otherwise.
  @inlinable
  var aValue: A? {
    get {
      switch self {
      case .a(let value):
        return value
      default:
        return nil
      }
    }
  }
  
  /// Directly returns the value when `self` is `.b(value)`; `nil` otherwise.
  @inlinable
  var bValue: B? {
    get {
      switch self {
      case .b(let value):
        return value
      default:
        return nil
      }
    }
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: Sum2 - Reflection Support
// -------------------------------------------------------------------------- //

internal extension Sum2 {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Sum2"
    }
  }
  
  @inlinable
  static var completeTypeName: String {
    get {
      return "\(self.shortTypeName)<\(self.typeParameterNames)>"
    }
  }
  
  @inlinable
  static var typeParameterNames: String {
    get {
      return [
        String(reflecting: A.self),
        String(reflecting: B.self)
      ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Sum2 - Validatable
// -------------------------------------------------------------------------- //

extension Sum2 : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      switch self {
      case .a(let a):
        return isValidOrIndifferent(a)
      case .b(let b):
        return isValidOrIndifferent(b)
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Sum2 - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Sum2 : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      switch self {
      case .a(let value):
        return ".a(\(String(describing: value)))"
      case .b(let value):
        return ".b(\(String(describing: value)))"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Sum2 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Sum2 : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      switch self {
      case .a(let value):
        return "\(type(of: self).completeTypeName).a(\(String(reflecting: value)))"
      case .b(let value):
        return "\(type(of: self).completeTypeName).b(\(String(reflecting: value)))"
      }
    }
  }
  
}


