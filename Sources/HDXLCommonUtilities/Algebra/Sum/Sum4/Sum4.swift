//
//  Sum4.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Sum4 - Definition
// -------------------------------------------------------------------------- //

/// Enumeration of a 4-way "anonymous sum".
///
/// - note: This file should contain all *unconditionally-available* code for `Sum4`. Conditional conformances, etc., should be included in separate files.
public enum Sum4<A,B,C,D> {
  
  case a(A)
  case b(B)
  case c(C)
  case d(D)
  
}

// -------------------------------------------------------------------------- //
// MARK: Sum4 - Convenience Constructors
// -------------------------------------------------------------------------- //

public extension Sum4 {

  /// Constructs a `Sum4` by lazily-evaluating its arguments from left-to-right and using the first non-nil value discovered (if any).
  @inlinable
  static func firstNonNil(
    _ a: @autoclosure () -> A?,
    _ b: @autoclosure () -> B?,
    _ c: @autoclosure () -> C?,
    _ d: @autoclosure () -> D?) -> Sum4<A,B,C,D>? {
    if let a = a() {
      return .a(a)
    } else if let b = b() {
      return .b(b)
    } else if let c = c() {
      return .c(c)
    } else if let d = d() {
      return .d(d)
    } else {
      return nil
    }
  }

  /// Constructs a `Sum4` by lazily-evaluating its arguments from right-to-left and using the first non-nil value discovered (if any).
  @inlinable
  static func finalNonNil(
    _ a: @autoclosure () -> A?,
    _ b: @autoclosure () -> B?,
    _ c: @autoclosure () -> C?,
    _ d: @autoclosure () -> D?) -> Sum4<A,B,C,D>? {
    if let d = d() {
      return .d(d)
    } else if let c = c() {
      return .c(c)
    } else if let b = b() {
      return .b(b)
    } else if let a = a() {
      return .a(a)
    } else {
      return nil
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Sum4 - Position Access Support
// -------------------------------------------------------------------------- //

public extension Sum4 {
  
  typealias Position = Arity4Position
  
  @inlinable
  var occupiedPosition: Position {
    get {
      switch self {
      case .a(_):
        return .a
      case .b(_):
        return .b
      case .c(_):
        return .c
      case .d(_):
        return .d
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
// MARK: Sum4 - Has-Value Support
// -------------------------------------------------------------------------- //

public extension Sum4 {
  
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
  
  /// Returns `true` iff `self` is `.c(_)`; `false` otherwise.
  @inlinable
  var hasCValue: Bool {
    get {
      switch self {
      case .c(_):
        return true
      default:
        return false
      }
    }
  }
  
  /// Returns `true` iff `self` is `.d(_)`; `false` otherwise.
  @inlinable
  var hasDValue: Bool {
    get {
      switch self {
      case .d(_):
        return true
      default:
        return false
      }
    }
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: Sum4 - Direct Value Access Support
// -------------------------------------------------------------------------- //

public extension Sum4 {
  
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
  
  /// Directly returns the value when `self` is `.c(value)`; `nil` otherwise.
  @inlinable
  var cValue: C? {
    get {
      switch self {
      case .c(let value):
        return value
      default:
        return nil
      }
    }
  }
  
  /// Directly returns the value when `self` is `.d(value)`; `nil` otherwise.
  @inlinable
  var dValue: D? {
    get {
      switch self {
      case .d(let value):
        return value
      default:
        return nil
      }
    }
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: Sum4 - Reflection Support
// -------------------------------------------------------------------------- //

internal extension Sum4 {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Sum4"
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
        String(reflecting: B.self),
        String(reflecting: C.self),
        String(reflecting: D.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Sum4 - Validatable
// -------------------------------------------------------------------------- //

extension Sum4 : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      switch self {
      case .a(let a):
        return isValidOrIndifferent(a)
      case .b(let b):
        return isValidOrIndifferent(b)
      case .c(let c):
        return isValidOrIndifferent(c)
      case .d(let d):
        return isValidOrIndifferent(d)
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Sum4 - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Sum4 : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      switch self {
      case .a(let value):
        return ".a(\(String(describing: value)))"
      case .b(let value):
        return ".b(\(String(describing: value)))"
      case .c(let value):
        return ".c(\(String(describing: value)))"
      case .d(let value):
        return ".d(\(String(describing: value)))"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Sum4 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Sum4 : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      switch self {
      case .a(let value):
        return "\(type(of: self).completeTypeName).a(\(String(reflecting: value)))"
      case .b(let value):
        return "\(type(of: self).completeTypeName).b(\(String(reflecting: value)))"
      case .c(let value):
        return "\(type(of: self).completeTypeName).c(\(String(reflecting: value)))"
      case .d(let value):
        return "\(type(of: self).completeTypeName).d(\(String(reflecting: value)))"
      }
    }
  }
  
}


