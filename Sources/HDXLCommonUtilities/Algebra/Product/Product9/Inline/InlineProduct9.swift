//
//  InlineProduct9.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - Definition
// -------------------------------------------------------------------------- //

/// Product-9 that stores all values "inline" as a struct. Exists to avoid COW overhead for cases when we
/// know that we are better-off without that indirection, but in general @ arity-9 prefer the COW variant.
public struct InlineProduct9<A,B,C,D,E,F,G,H,I> {
  
  public var a: A
  public var b: B
  public var c: C
  public var d: D
  public var e: E
  public var f: F
  public var g: G
  public var h: H
  public var i: I
  
  @inlinable
  public init(
    _ a: A,
    _ b: B,
    _ c: C,
    _ d: D,
    _ e: E,
    _ f: F,
    _ g: G,
    _ h: H,
    _ i: I) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(a))
    pedantic_assert(isValidOrIndifferent(b))
    pedantic_assert(isValidOrIndifferent(c))
    pedantic_assert(isValidOrIndifferent(d))
    pedantic_assert(isValidOrIndifferent(e))
    pedantic_assert(isValidOrIndifferent(f))
    pedantic_assert(isValidOrIndifferent(g))
    pedantic_assert(isValidOrIndifferent(h))
    pedantic_assert(isValidOrIndifferent(i))
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.f = f
    self.g = g
    self.h = h
    self.i = i
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - Convenience Constructors
// -------------------------------------------------------------------------- //

public extension InlineProduct9 {
  
  @inlinable
  init?(
    _ a: @autoclosure () -> A?,
    _ b: @autoclosure () -> B?,
    _ c: @autoclosure () -> C?,
    _ d: @autoclosure () -> D?,
    _ e: @autoclosure () -> E?,
    _ f: @autoclosure () -> F?,
    _ g: @autoclosure () -> G?,
    _ h: @autoclosure () -> H?,
    _ i: @autoclosure () -> I?) {
    guard let (a,b,c,d,e,f,g,h,i) = unwrap(a(),b(),c(),d(),e(),f(),g(),h(),i()) else {
      return nil
    }
    self.init(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - Reflection Support
// -------------------------------------------------------------------------- //

internal extension InlineProduct9 {
  
  @usableFromInline
  static var shortTypeName: String {
    get {
      return "InlineProduct9"
    }
  }
  
  @usableFromInline
  static var completeTypeName: String {
    get {
      return "\(self.shortTypeName)<\(self.typeParameterNames)>"
    }
  }
  
  @usableFromInline
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
        String(reflecting: H.self),
        String(reflecting: I.self)
        ].joined(separator: ", ")
    }
  }
  
  @usableFromInline
  var componentDescriptions: String {
    get {
      return [
        String(describing: self.a),
        String(describing: self.b),
        String(describing: self.c),
        String(describing: self.d),
        String(describing: self.e),
        String(describing: self.f),
        String(describing: self.g),
        String(describing: self.h),
        String(describing: self.i)
      ].joined(separator: ", ")
    }
  }

  @usableFromInline
  var componentDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))",
        "c: \(String(reflecting: self.c))",
        "d: \(String(reflecting: self.d))",
        "e: \(String(reflecting: self.e))",
        "f: \(String(reflecting: self.f))",
        "g: \(String(reflecting: self.g))",
        "h: \(String(reflecting: self.h))",
        "i: \(String(reflecting: self.i))"
      ].joined(separator: ", ")
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - With Derivations
// -------------------------------------------------------------------------- //

public extension InlineProduct9 {
  
  @inlinable
  func with(a: A) -> InlineProduct9<A,B,C,D,E,F,G,H,I> {
    return InlineProduct9<A,B,C,D,E,F,G,H,I>(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }

  @inlinable
  func with(b: B) -> InlineProduct9<A,B,C,D,E,F,G,H,I> {
    return InlineProduct9<A,B,C,D,E,F,G,H,I>(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }

  @inlinable
  func with(c: C) -> InlineProduct9<A,B,C,D,E,F,G,H,I> {
    return InlineProduct9<A,B,C,D,E,F,G,H,I>(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }

  @inlinable
  func with(d: D) -> InlineProduct9<A,B,C,D,E,F,G,H,I> {
    return InlineProduct9<A,B,C,D,E,F,G,H,I>(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }

  @inlinable
  func with(e: E) -> InlineProduct9<A,B,C,D,E,F,G,H,I> {
    return InlineProduct9<A,B,C,D,E,F,G,H,I>(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }

  @inlinable
  func with(f: F) -> InlineProduct9<A,B,C,D,E,F,G,H,I> {
    return InlineProduct9<A,B,C,D,E,F,G,H,I>(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }

  @inlinable
  func with(g: G) -> InlineProduct9<A,B,C,D,E,F,G,H,I> {
    return InlineProduct9<A,B,C,D,E,F,G,H,I>(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }

  @inlinable
  func with(h: H) -> InlineProduct9<A,B,C,D,E,F,G,H,I> {
    return InlineProduct9<A,B,C,D,E,F,G,H,I>(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }

  @inlinable
  func with(i: I) -> InlineProduct9<A,B,C,D,E,F,G,H,I> {
    return InlineProduct9<A,B,C,D,E,F,G,H,I>(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - Validatable
// -------------------------------------------------------------------------- //

extension InlineProduct9 : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b),
        isValidOrIndifferent(self.c),
        isValidOrIndifferent(self.d),
        isValidOrIndifferent(self.e),
        isValidOrIndifferent(self.f),
        isValidOrIndifferent(self.g),
        isValidOrIndifferent(self.h),
        isValidOrIndifferent(self.i) else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension InlineProduct9 : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.componentDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension InlineProduct9 : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}
