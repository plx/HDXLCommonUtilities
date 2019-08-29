//
//  COWProduct6Storage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct6Storage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class COWProduct6Storage<A,B,C,D,E,F> {
  
  @usableFromInline
  internal typealias Storage = InlineProduct6<A,B,C,D,E,F>
  
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
    _ f: F) {
    self.init(
      storage: Storage(
        a,
        b,
        c,
        d,
        e,
        f
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct6Storage - Cloning
// -------------------------------------------------------------------------- //

internal extension COWProduct6Storage {
  
  @inlinable
  func obtainClone() -> COWProduct6Storage<A,B,C,D,E,F> {
    return COWProduct6Storage<A,B,C,D,E,F>(
      storage: self.storage
    )
  }
  
  @inlinable
  func obtainMutatedClone(mutation: (COWProduct6Storage<A,B,C,D,E,F>) -> Void) -> COWProduct6Storage<A,B,C,D,E,F> {
    let result = self.obtainClone()
    mutation(result)
    return result
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct6Storage - Property Exposure
// -------------------------------------------------------------------------- //

internal extension COWProduct6Storage {
  
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
    
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct6Storage - With-Derivations
// -------------------------------------------------------------------------- //

internal extension COWProduct6Storage {
  
  @inlinable
  func with(a: A) -> COWProduct6Storage<A,B,C,D,E,F> {
    return COWProduct6Storage<A,B,C,D,E,F>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(b: B) -> COWProduct6Storage<A,B,C,D,E,F> {
    return COWProduct6Storage<A,B,C,D,E,F>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(c: C) -> COWProduct6Storage<A,B,C,D,E,F> {
    return COWProduct6Storage<A,B,C,D,E,F>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(d: D) -> COWProduct6Storage<A,B,C,D,E,F> {
    return COWProduct6Storage<A,B,C,D,E,F>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(e: E) -> COWProduct6Storage<A,B,C,D,E,F> {
    return COWProduct6Storage<A,B,C,D,E,F>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(f: F) -> COWProduct6Storage<A,B,C,D,E,F> {
    return COWProduct6Storage<A,B,C,D,E,F>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct6Storage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProduct6Storage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWProduct6Storage"
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
        String(reflecting: F.self)
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
        String(describing: self.f)
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
        "f: \(String(reflecting: self.f))"
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct6Storage - Validatable
// -------------------------------------------------------------------------- //

extension COWProduct6Storage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct6Storage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct6Storage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct6Storage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct6Storage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}
