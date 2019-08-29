//
//  Sum8.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Sum8 - Definition
// -------------------------------------------------------------------------- //

/// Enumeration of a 8-way "anonymous sum".
///
/// - note: This file should contain all *unconditionally-available* code for `Sum8`. Conditional conformances, etc., should be included in separate files.
public enum Sum8<A,B,C,D,E,F,G,H> {
  
  case a(A)
  case b(B)
  case c(C)
  case d(D)
  case e(E)
  case f(F)
  case g(G)
  case h(H)
  
}

// -------------------------------------------------------------------------- //
// MARK: Sum8 - Convenience Constructors
// -------------------------------------------------------------------------- //

public extension Sum8 {

  /// Constructs a `Sum8` by lazily-evaluating its arguments from left-to-right and using the first non-nil value discovered (if any).
  @inlinable
  static func firstNonNil(
    _ a: @autoclosure () -> A?,
    _ b: @autoclosure () -> B?,
    _ c: @autoclosure () -> C?,
    _ d: @autoclosure () -> D?,
    _ e: @autoclosure () -> E?,
    _ f: @autoclosure () -> F?,
    _ g: @autoclosure () -> G?,
    _ h: @autoclosure () -> H?) -> Sum8<A,B,C,D,E,F,G,H>? {
    if let a = a() {
      return .a(a)
    } else if let b = b() {
      return .b(b)
    } else if let c = c() {
      return .c(c)
    } else if let d = d() {
      return .d(d)
    } else if let e = e() {
      return .e(e)
    } else if let f = f() {
      return .f(f)
    } else if let g = g() {
      return .g(g)
    } else if let h = h() {
      return .h(h)
    } else {
      return nil
    }
  }

  /// Constructs a `Sum8` by lazily-evaluating its arguments from right-to-left and using the first non-nil value discovered (if any).
  @inlinable
  static func finalNonNil(
    _ a: @autoclosure () -> A?,
    _ b: @autoclosure () -> B?,
    _ c: @autoclosure () -> C?,
    _ d: @autoclosure () -> D?,
    _ e: @autoclosure () -> E?,
    _ f: @autoclosure () -> F?,
    _ g: @autoclosure () -> G?,
    _ h: @autoclosure () -> H?) -> Sum8<A,B,C,D,E,F,G,H>? {
    if let h = h() {
      return .h(h)
    } else if let g = g() {
      return .g(g)
    } else if let f = f() {
      return .f(f)
    } else if let e = e() {
      return .e(e)
    } else if let d = d() {
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
// MARK: Sum8 - Position Access Support
// -------------------------------------------------------------------------- //

public extension Sum8 {
  
  typealias Position = Arity8Position
  
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
      case .e(_):
        return .e
      case .f(_):
        return .f
      case .g(_):
        return .g
      case .h(_):
        return .h
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
// MARK: Sum8 - Has-Value Support
// -------------------------------------------------------------------------- //

public extension Sum8 {
  
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
  
  /// Returns `true` iff `self` is `.e(_)`; `false` otherwise.
  @inlinable
  var hasEValue: Bool {
    get {
      switch self {
      case .e(_):
        return true
      default:
        return false
      }
    }
  }
  
  /// Returns `true` iff `self` is `.f(_)`; `false` otherwise.
  @inlinable
  var hasFValue: Bool {
    get {
      switch self {
      case .f(_):
        return true
      default:
        return false
      }
    }
  }
  
  /// Returns `true` iff `self` is `.g(_)`; `false` otherwise.
  @inlinable
  var hasGValue: Bool {
    get {
      switch self {
      case .g(_):
        return true
      default:
        return false
      }
    }
  }
  
  /// Returns `true` iff `self` is `.h(_)`; `false` otherwise.
  @inlinable
  var hasHValue: Bool {
    get {
      switch self {
      case .h(_):
        return true
      default:
        return false
      }
    }
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: Sum8 - Direct Value Access Support
// -------------------------------------------------------------------------- //

public extension Sum8 {
  
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
  
  /// Directly returns the value when `self` is `.e(value)`; `nil` otherwise.
  @inlinable
  var eValue: E? {
    get {
      switch self {
      case .e(let value):
        return value
      default:
        return nil
      }
    }
  }
  
  /// Directly returns the value when `self` is `.f(value)`; `nil` otherwise.
  @inlinable
  var fValue: F? {
    get {
      switch self {
      case .f(let value):
        return value
      default:
        return nil
      }
    }
  }
  
  /// Directly returns the value when `self` is `.g(value)`; `nil` otherwise.
  @inlinable
  var gValue: G? {
    get {
      switch self {
      case .g(let value):
        return value
      default:
        return nil
      }
    }
  }
  
  /// Directly returns the value when `self` is `.h(value)`; `nil` otherwise.
  @inlinable
  var hValue: H? {
    get {
      switch self {
      case .h(let value):
        return value
      default:
        return nil
      }
    }
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: Sum8 - Reflection Support
// -------------------------------------------------------------------------- //

internal extension Sum8 {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Sum8"
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
        String(reflecting: D.self),
        String(reflecting: E.self),
        String(reflecting: F.self),
        String(reflecting: G.self),
        String(reflecting: H.self)
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Sum8 - Validatable
// -------------------------------------------------------------------------- //

extension Sum8 : Validatable {
  
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
      case .e(let e):
        return isValidOrIndifferent(e)
      case .f(let f):
        return isValidOrIndifferent(f)
      case .g(let g):
        return isValidOrIndifferent(g)
      case .h(let h):
        return isValidOrIndifferent(h)
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Sum8 - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Sum8 : CustomStringConvertible {
  
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
      case .e(let value):
        return ".e(\(String(describing: value)))"
      case .f(let value):
        return ".f(\(String(describing: value)))"
      case .g(let value):
        return ".g(\(String(describing: value)))"
      case .h(let value):
        return ".h(\(String(describing: value)))"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Sum8 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Sum8 : CustomDebugStringConvertible {
  
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
      case .e(let value):
        return "\(type(of: self).completeTypeName).e(\(String(reflecting: value)))"
      case .f(let value):
        return "\(type(of: self).completeTypeName).f(\(String(reflecting: value)))"
      case .g(let value):
        return "\(type(of: self).completeTypeName).g(\(String(reflecting: value)))"
      case .h(let value):
        return "\(type(of: self).completeTypeName).h(\(String(reflecting: value)))"
      }
    }
  }
  
}


