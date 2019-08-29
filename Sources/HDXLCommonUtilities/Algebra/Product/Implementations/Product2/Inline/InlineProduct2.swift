//
//  InlineProduct2.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct2 - Definition
// -------------------------------------------------------------------------- //

/// Product-2 that stores all values "inline" as a struct. Exists to avoid COW overhead for cases when we
/// know that we are better-off without that indirection, but in general @ arity-9 prefer the COW variant.
public struct InlineProduct2<A,B> {
  
  public var a: A
  public var b: B
  
  @inlinable
  public init(
    _ a: A,
    _ b: B) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(a))
    pedantic_assert(isValidOrIndifferent(b))
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.a = a
    self.b = b
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct2 - Reflection Support
// -------------------------------------------------------------------------- //

internal extension InlineProduct2 {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "InlineProduct2"
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
  
  @inlinable
  var componentDescriptions: String {
    get {
      return [
        String(describing: self.a),
        String(describing: self.b)
      ].joined(separator: ", ")
    }
  }

  @inlinable
  var componentDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))"
      ].joined(separator: ", ")
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct2 - AlgebraicProduct2
// -------------------------------------------------------------------------- //

extension InlineProduct2 : AlgebraicProduct2 {
  
  public typealias ArityPosition = Arity2Position

  @inlinable
  public static var withDerivationShouldEnsureUniqueCopyByDefault: Bool {
    get {
      return true
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct2 - Validatable
// -------------------------------------------------------------------------- //

extension InlineProduct2 : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b) else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct2 - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension InlineProduct2 : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.componentDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct2 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension InlineProduct2 : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}
