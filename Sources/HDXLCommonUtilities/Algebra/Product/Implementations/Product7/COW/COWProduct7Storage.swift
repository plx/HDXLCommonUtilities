//
//  COWProduct7Storage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct7Storage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class COWProduct7Storage<A,B,C,D,E,F,G> {
  
  @usableFromInline
  internal typealias Storage = InlineProduct7<A,B,C,D,E,F,G>
  
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
    _ g: G) {
    self.init(
      storage: Storage(
        a,
        b,
        c,
        d,
        e,
        f,
        g
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7Storage - Cloning
// -------------------------------------------------------------------------- //

internal extension COWProduct7Storage {
  
  @inlinable
  func obtainClone() -> COWProduct7Storage<A,B,C,D,E,F,G> {
    return COWProduct7Storage<A,B,C,D,E,F,G>(
      storage: self.storage
    )
  }
  
  @inlinable
  func obtainMutatedClone(mutation: (COWProduct7Storage<A,B,C,D,E,F,G>) -> Void) -> COWProduct7Storage<A,B,C,D,E,F,G> {
    let result = self.obtainClone()
    mutation(result)
    return result
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7Storage - Property Exposure
// -------------------------------------------------------------------------- //

internal extension COWProduct7Storage {
  
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
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7Storage - With-Derivations
// -------------------------------------------------------------------------- //

internal extension COWProduct7Storage {
  
  @inlinable
  func with(a: A) -> COWProduct7Storage<A,B,C,D,E,F,G> {
    return COWProduct7Storage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
  
  @inlinable
  func with(b: B) -> COWProduct7Storage<A,B,C,D,E,F,G> {
    return COWProduct7Storage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
  
  @inlinable
  func with(c: C) -> COWProduct7Storage<A,B,C,D,E,F,G> {
    return COWProduct7Storage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
  
  @inlinable
  func with(d: D) -> COWProduct7Storage<A,B,C,D,E,F,G> {
    return COWProduct7Storage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
  
  @inlinable
  func with(e: E) -> COWProduct7Storage<A,B,C,D,E,F,G> {
    return COWProduct7Storage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
  
  @inlinable
  func with(f: F) -> COWProduct7Storage<A,B,C,D,E,F,G> {
    return COWProduct7Storage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
  
  @inlinable
  func with(g: G) -> COWProduct7Storage<A,B,C,D,E,F,G> {
    return COWProduct7Storage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7Storage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProduct7Storage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWProduct7Storage"
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
        String(reflecting: G.self)
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
        String(describing: self.g)
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
        "g: \(String(reflecting: self.g))"
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7Storage - Validatable
// -------------------------------------------------------------------------- //

extension COWProduct7Storage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7Storage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct7Storage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7Storage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct7Storage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}
