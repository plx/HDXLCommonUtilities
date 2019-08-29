//
//  InlineProduct4.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct4 - Definition
// -------------------------------------------------------------------------- //

/// Product-9 that stores all values "inline" as a struct. Exists to avoid COW overhead for cases when we
/// know that we are better-off without that indirection, but in general @ arity-9 prefer the COW variant.
public struct InlineProduct4<A,B,C,D> {
  
  public var a: A
  public var b: B
  public var c: C
  public var d: D
  
  @inlinable
  public init(
    _ a: A,
    _ b: B,
    _ c: C,
    _ d: D) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(a))
    pedantic_assert(isValidOrIndifferent(b))
    pedantic_assert(isValidOrIndifferent(c))
    pedantic_assert(isValidOrIndifferent(d))
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.a = a
    self.b = b
    self.c = c
    self.d = d
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct4 - Reflection Support
// -------------------------------------------------------------------------- //

internal extension InlineProduct4 {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "InlineProduct4"
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
  
  @inlinable
  var componentDescriptions: String {
    get {
      return [
        String(describing: self.a),
        String(describing: self.b),
        String(describing: self.c),
        String(describing: self.d)
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
        "d: \(String(reflecting: self.d))"
      ].joined(separator: ", ")
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct4 - AlgebraicProduct4
// -------------------------------------------------------------------------- //

extension InlineProduct4 : AlgebraicProduct4 {
  
  public typealias ArityPosition = Arity4Position

  @inlinable
  public static var withDerivationShouldEnsureUniqueCopyByDefault: Bool {
    get {
      return true
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct4 - Validatable
// -------------------------------------------------------------------------- //

extension InlineProduct4 : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b),
        isValidOrIndifferent(self.c),
        isValidOrIndifferent(self.d) else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct4 - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension InlineProduct4 : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.componentDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct4 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension InlineProduct4 : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}
