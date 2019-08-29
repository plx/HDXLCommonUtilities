//
//  COWProduct5Storage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct5Storage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class COWProduct5Storage<A,B,C,D,E> {
  
  @usableFromInline
  internal typealias Storage = InlineProduct5<A,B,C,D,E>
  
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
    _ e: E) {
    self.init(
      storage: Storage(
        a,
        b,
        c,
        d,
        e
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5Storage - Cloning
// -------------------------------------------------------------------------- //

internal extension COWProduct5Storage {
  
  @inlinable
  func obtainClone() -> COWProduct5Storage<A,B,C,D,E> {
    return COWProduct5Storage<A,B,C,D,E>(
      storage: self.storage
    )
  }
  
  @inlinable
  func obtainMutatedClone(mutation: (COWProduct5Storage<A,B,C,D,E>) -> Void) -> COWProduct5Storage<A,B,C,D,E> {
    let result = self.obtainClone()
    mutation(result)
    return result
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5Storage - Property Exposure
// -------------------------------------------------------------------------- //

internal extension COWProduct5Storage {
  
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
    
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5Storage - With-Derivations
// -------------------------------------------------------------------------- //

internal extension COWProduct5Storage {
  
  @inlinable
  func with(a: A) -> COWProduct5Storage<A,B,C,D,E> {
    return COWProduct5Storage<A,B,C,D,E>(
      a,
      b,
      c,
      d,
      e
    )
  }
  
  @inlinable
  func with(b: B) -> COWProduct5Storage<A,B,C,D,E> {
    return COWProduct5Storage<A,B,C,D,E>(
      a,
      b,
      c,
      d,
      e
    )
  }
  
  @inlinable
  func with(c: C) -> COWProduct5Storage<A,B,C,D,E> {
    return COWProduct5Storage<A,B,C,D,E>(
      a,
      b,
      c,
      d,
      e
    )
  }
  
  @inlinable
  func with(d: D) -> COWProduct5Storage<A,B,C,D,E> {
    return COWProduct5Storage<A,B,C,D,E>(
      a,
      b,
      c,
      d,
      e
    )
  }
  
  @inlinable
  func with(e: E) -> COWProduct5Storage<A,B,C,D,E> {
    return COWProduct5Storage<A,B,C,D,E>(
      a,
      b,
      c,
      d,
      e
    )
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5Storage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProduct5Storage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWProduct5Storage"
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
// MARK: COWProduct5Storage - Validatable
// -------------------------------------------------------------------------- //

extension COWProduct5Storage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5Storage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct5Storage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5Storage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct5Storage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}
