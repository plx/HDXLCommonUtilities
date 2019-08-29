//
//  COWProduct9Storage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Storage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
  
  @usableFromInline
  internal typealias Storage = InlineProduct9<A,B,C,D,E,F,G,H,I>
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal required init(storage: Storage) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(storage.isValid)
    defer { pedantic_assert(storage.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.storage = storage
  }
  
  @inlinable
  internal convenience init(
    _ a: A,
    _ b: B,
    _ c: C,
    _ d: D,
    _ e: E,
    _ f: F,
    _ g: G,
    _ h: H,
    _ i: I) {
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
// MARK: COWProduct9Storage - Cloning
// -------------------------------------------------------------------------- //

internal extension COWProduct9Storage {
  
  @inlinable
  func obtainClone() -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
      storage: self.storage
    )
  }
  
  @inlinable
  func obtainMutatedClone(mutation: (COWProduct9Storage<A,B,C,D,E,F,G,H,I>) -> Void) -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    let result = self.obtainClone()
    mutation(result)
    return result
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Storage - Property Exposure
// -------------------------------------------------------------------------- //

internal extension COWProduct9Storage {
  
  @inlinable
  var a: A {
    get {
      return self.storage.a
    }
    set {
      self.storage.a = newValue
    }
  }
  
  @inlinable
  var b: B {
    get {
      return self.storage.b
    }
    set {
      self.storage.b = newValue
    }
  }
  
  @inlinable
  var c: C {
    get {
      return self.storage.c
    }
    set {
      self.storage.c = newValue
    }
  }
  
  @inlinable
  var d: D {
    get {
      return self.storage.d
    }
    set {
      self.storage.d = newValue
    }
  }
  
  @inlinable
  var e: E {
    get {
      return self.storage.e
    }
    set {
      self.storage.e = newValue
    }
  }
  
  @inlinable
  var f: F {
    get {
      return self.storage.f
    }
    set {
      self.storage.f = newValue
    }
  }
  
  @inlinable
  var g: G {
    get {
      return self.storage.g
    }
    set {
      self.storage.g = newValue
    }
  }
  
  @inlinable
  var h: H {
    get {
      return self.storage.h
    }
    set {
      self.storage.h = newValue
    }
  }
  
  @inlinable
  var i: I {
    get {
      return self.storage.i
    }
    set {
      self.storage.i = newValue
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Storage - With-Derivations
// -------------------------------------------------------------------------- //

internal extension COWProduct9Storage {
  
  @inlinable
  func with(a: A) -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
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
  func with(b: B) -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
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
  func with(c: C) -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
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
  func with(d: D) -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
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
  func with(e: E) -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
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
  func with(f: F) -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
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
  func with(g: G) -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
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
  func with(h: H) -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
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
  func with(i: I) -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
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
// MARK: COWProduct9Storage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProduct9Storage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWProduct9Storage"
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
        String(reflecting: H.self),
        String(reflecting: I.self)
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
        String(describing: self.e),
        String(describing: self.f),
        String(describing: self.g),
        String(describing: self.h),
        String(describing: self.i)
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
// MARK: COWProduct9Storage - Validatable
// -------------------------------------------------------------------------- //

extension COWProduct9Storage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Storage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct9Storage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Storage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct9Storage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}



