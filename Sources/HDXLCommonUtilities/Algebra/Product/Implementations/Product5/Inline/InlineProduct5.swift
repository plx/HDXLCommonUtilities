//
//  InlineProduct5.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct5 - Definition
// -------------------------------------------------------------------------- //

/// Product-9 that stores all values "inline" as a struct. Exists to avoid COW overhead for cases when we
/// know that we are better-off without that indirection, but in general @ arity-9 prefer the COW variant.
public struct InlineProduct5<A,B,C,D,E> {
  
  public var a: A
  public var b: B
  public var c: C
  public var d: D
  public var e: E
  
  @inlinable
  public init(
    _ a: A,
    _ b: B,
    _ c: C,
    _ d: D,
    _ e: E) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(a))
    pedantic_assert(isValidOrIndifferent(b))
    pedantic_assert(isValidOrIndifferent(c))
    pedantic_assert(isValidOrIndifferent(d))
    pedantic_assert(isValidOrIndifferent(e))
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct5 - Reflection Support
// -------------------------------------------------------------------------- //

internal extension InlineProduct5 {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "InlineProduct5"
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
        String(reflecting: E.self)
        ].joined(separator: ", ")
    }
  }
  
  @inlinable
  var componentDescriptions: String {
    get {
      return [
        String(describing: self.a),
        String(describing: self.b),
        String(describing: self.c),
        String(describing: self.d),
        String(describing: self.e)
      ].joined(separator: ", ")
    }
  }

  @inlinable
  var componentDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))",
        "c: \(String(reflecting: self.c))",
        "d: \(String(reflecting: self.d))",
        "e: \(String(reflecting: self.e))"
      ].joined(separator: ", ")
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct5 - AlgebraicProduct5
// -------------------------------------------------------------------------- //

extension InlineProduct5 : AlgebraicProduct5 {
  
  public typealias ArityPosition = Arity5Position

  @inlinable
  public static var withDerivationShouldEnsureUniqueCopyByDefault: Bool {
    get {
      return true
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct5 - Validatable
// -------------------------------------------------------------------------- //

extension InlineProduct5 : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b),
        isValidOrIndifferent(self.c),
        isValidOrIndifferent(self.d),
        isValidOrIndifferent(self.e) else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct5 - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension InlineProduct5 : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.componentDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct5 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension InlineProduct5 : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}
