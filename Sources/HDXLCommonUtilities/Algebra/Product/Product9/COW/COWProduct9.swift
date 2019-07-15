//
//  COWProduct9.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - Definition
// -------------------------------------------------------------------------- //

public struct COWProduct9<A,B,C,D,E,F,G,H,I> {
  
  @usableFromInline
  internal typealias Storage = COWProduct9Storage<A,B,C,D,E,F,G,H,I>
  
  @usableFromInline
  internal var storage: Storage

  /// "Designated initializer" for `COWProduct9` (pseudo-private).
  @usableFromInline
  internal init(storage: Storage) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(storage.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.storage = storage
  }

  /// "Designated initializer" for `COWProduct9` (pseudo-private).
  @usableFromInline
  internal init?(storage: Storage?) {
    guard let storage = storage else {
      return nil
    }
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(storage.isValid)
    // /////////////////////////////////////////////////////////////////////////
    self.storage = storage
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    // /////////////////////////////////////////////////////////////////////////
  }

  /// Construct a `COWProduct9` from the individual components.
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
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.init(
      storage: Storage(
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
    )
  }
  
  /// Construct a `COWProduct9` from the individual components whenever they're all non-nil.
  @inlinable
  public init?(
    _ a: @autoclosure () -> A?,
    _ b: @autoclosure () -> B?,
    _ c: @autoclosure () -> C?,
    _ d: @autoclosure () -> D?,
    _ e: @autoclosure () -> E?,
    _ f: @autoclosure () -> F?,
    _ g: @autoclosure () -> G?,
    _ h: @autoclosure () -> H?,
    _ i: @autoclosure () -> I?) {
    guard let (a,b,c,d,e,f,g,h,i) = unwrap(a(), b(), c(), d(), e(), f(), g(), h(), i()) else {
      return nil
    }
    self.init(
      storage: Storage(
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
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - Property Exposure
// -------------------------------------------------------------------------- //

public extension COWProduct9 {
  
  @inlinable
  var a: A {
    get {
      return self.storage.a
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(newValue))
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      // ///////////////////////////////////////////////////////////////////////
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.a = newValue
      } else {
        self.storage = self.storage.with(
          a: newValue
        )
      }
    }
  }
  
  @inlinable
  var b: B {
    get {
      return self.storage.b
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(newValue))
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      // ///////////////////////////////////////////////////////////////////////
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.b = newValue
      } else {
        self.storage = self.storage.with(
          b: newValue
        )
      }
    }
  }
  
  @inlinable
  var c: C {
    get {
      return self.storage.c
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(newValue))
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      // ///////////////////////////////////////////////////////////////////////
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.c = newValue
      } else {
        self.storage = self.storage.with(
          c: newValue
        )
      }
    }
  }
  
  @inlinable
  var d: D {
    get {
      return self.storage.d
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(newValue))
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      // ///////////////////////////////////////////////////////////////////////
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.d = newValue
      } else {
        self.storage = self.storage.with(
          d: newValue
        )
      }
    }
  }
  
  @inlinable
  var e: E {
    get {
      return self.storage.e
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(newValue))
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      // ///////////////////////////////////////////////////////////////////////
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.e = newValue
      } else {
        self.storage = self.storage.with(
          e: newValue
        )
      }
    }
  }
  
  @inlinable
  var f: F {
    get {
      return self.storage.f
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(newValue))
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      // ///////////////////////////////////////////////////////////////////////
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.f = newValue
      } else {
        self.storage = self.storage.with(
          f: newValue
        )
      }
    }
  }
  
  @inlinable
  var g: G {
    get {
      return self.storage.g
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(newValue))
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      // ///////////////////////////////////////////////////////////////////////
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.g = newValue
      } else {
        self.storage = self.storage.with(
          g: newValue
        )
      }
    }
  }
  
  @inlinable
  var h: H {
    get {
      return self.storage.h
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(newValue))
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      // ///////////////////////////////////////////////////////////////////////
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.h = newValue
      } else {
        self.storage = self.storage.with(
          h: newValue
        )
      }
    }
  }
  
  @inlinable
  var i: I {
    get {
      return self.storage.i
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(newValue))
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      // ///////////////////////////////////////////////////////////////////////
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.i = newValue
      } else {
        self.storage = self.storage.with(
          i: newValue
        )
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - Mutation
// -------------------------------------------------------------------------- //

public extension COWProduct9 {
  
  /// In-place mutates `self`, *after first obtaining a unique copy*.
  @inlinable
  mutating func mutateInPlace(using mutation: (inout COWProduct9<A,B,C,D,E,F,G,H,I>) -> Void) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
    // /////////////////////////////////////////////////////////////////////////
    if !isKnownUniquelyReferenced(&self.storage) {
      self.storage = self.storage.obtainClone()
    }
    mutation(&self)
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - With Derivation
// -------------------------------------------------------------------------- //

public extension COWProduct9 {
  
  @inlinable
  func with(a: A) -> COWProduct9<A,B,C,D,E,F,G,H,I> {
    return COWProduct9<A,B,C,D,E,F,G,H,I>(
      storage: self.storage.with(a: a)
    )
  }

  @inlinable
  func with(b: B) -> COWProduct9<A,B,C,D,E,F,G,H,I> {
    return COWProduct9<A,B,C,D,E,F,G,H,I>(
      storage: self.storage.with(b: b)
    )
  }

  @inlinable
  func with(c: C) -> COWProduct9<A,B,C,D,E,F,G,H,I> {
    return COWProduct9<A,B,C,D,E,F,G,H,I>(
      storage: self.storage.with(c: c)
    )
  }

  @inlinable
  func with(d: D) -> COWProduct9<A,B,C,D,E,F,G,H,I> {
    return COWProduct9<A,B,C,D,E,F,G,H,I>(
      storage: self.storage.with(d: d)
    )
  }

  @inlinable
  func with(e: E) -> COWProduct9<A,B,C,D,E,F,G,H,I> {
    return COWProduct9<A,B,C,D,E,F,G,H,I>(
      storage: self.storage.with(e: e)
    )
  }

  @inlinable
  func with(f: F) -> COWProduct9<A,B,C,D,E,F,G,H,I> {
    return COWProduct9<A,B,C,D,E,F,G,H,I>(
      storage: self.storage.with(f: f)
    )
  }

  @inlinable
  func with(g: G) -> COWProduct9<A,B,C,D,E,F,G,H,I> {
    return COWProduct9<A,B,C,D,E,F,G,H,I>(
      storage: self.storage.with(g: g)
    )
  }

  @inlinable
  func with(h: H) -> COWProduct9<A,B,C,D,E,F,G,H,I> {
    return COWProduct9<A,B,C,D,E,F,G,H,I>(
      storage: self.storage.with(h: h)
    )
  }

  @inlinable
  func with(i: I) -> COWProduct9<A,B,C,D,E,F,G,H,I> {
    return COWProduct9<A,B,C,D,E,F,G,H,I>(
      storage: self.storage.with(i: i)
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProduct9 {
  
  @usableFromInline
  static var shortTypeName: String {
    get {
      return "COWProduct9"
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
// MARK: COWProduct9 - Validatable
// -------------------------------------------------------------------------- //

extension COWProduct9 : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct9 : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct9 : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}

