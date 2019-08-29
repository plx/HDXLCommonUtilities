//
//  COWProduct4Storage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct4Storage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class COWProduct4Storage<A,B,C,D> {
  
  @usableFromInline
  internal typealias Storage = InlineProduct4<A,B,C,D>
  
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
    _ d: D) {
    self.init(
      storage: Storage(
        a,
        b,
        c,
        d
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4Storage - Cloning
// -------------------------------------------------------------------------- //

internal extension COWProduct4Storage {
  
  @inlinable
  func obtainClone() -> COWProduct4Storage<A,B,C,D> {
    return COWProduct4Storage<A,B,C,D>(
      storage: self.storage
    )
  }
  
  @inlinable
  func obtainMutatedClone(mutation: (COWProduct4Storage<A,B,C,D>) -> Void) -> COWProduct4Storage<A,B,C,D> {
    let result = self.obtainClone()
    mutation(result)
    return result
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4Storage - Property Exposure
// -------------------------------------------------------------------------- //

internal extension COWProduct4Storage {
  
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
    
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4Storage - With-Derivations
// -------------------------------------------------------------------------- //

internal extension COWProduct4Storage {
  
  @inlinable
  func with(a: A) -> COWProduct4Storage<A,B,C,D> {
    return COWProduct4Storage<A,B,C,D>(
      a,
      b,
      c,
      d
    )
  }
  
  @inlinable
  func with(b: B) -> COWProduct4Storage<A,B,C,D> {
    return COWProduct4Storage<A,B,C,D>(
      a,
      b,
      c,
      d
    )
  }
  
  @inlinable
  func with(c: C) -> COWProduct4Storage<A,B,C,D> {
    return COWProduct4Storage<A,B,C,D>(
      a,
      b,
      c,
      d
    )
  }
  
  @inlinable
  func with(d: D) -> COWProduct4Storage<A,B,C,D> {
    return COWProduct4Storage<A,B,C,D>(
      a,
      b,
      c,
      d
    )
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4Storage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProduct4Storage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWProduct4Storage"
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
// MARK: COWProduct4Storage - Validatable
// -------------------------------------------------------------------------- //

extension COWProduct4Storage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4Storage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct4Storage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4Storage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct4Storage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}



