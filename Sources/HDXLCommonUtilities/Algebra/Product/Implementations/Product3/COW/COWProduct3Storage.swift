//
//  COWProduct3Storage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct3Storage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class COWProduct3Storage<A,B,C> {
  
  @usableFromInline
  internal typealias Storage = InlineProduct3<A,B,C>
  
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
    _ c: C) {
    self.init(
      storage: Storage(
        a,
        b,
        c
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3Storage - Cloning
// -------------------------------------------------------------------------- //

internal extension COWProduct3Storage {
  
  @inlinable
  func obtainClone() -> COWProduct3Storage<A,B,C> {
    return COWProduct3Storage<A,B,C>(
      storage: self.storage
    )
  }
  
  @inlinable
  func obtainMutatedClone(mutation: (COWProduct3Storage<A,B,C>) -> Void) -> COWProduct3Storage<A,B,C> {
    let result = self.obtainClone()
    mutation(result)
    return result
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3Storage - Property Exposure
// -------------------------------------------------------------------------- //

internal extension COWProduct3Storage {
  
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
    
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3Storage - With-Derivations
// -------------------------------------------------------------------------- //

internal extension COWProduct3Storage {
  
  @inlinable
  func with(a: A) -> COWProduct3Storage<A,B,C> {
    return COWProduct3Storage<A,B,C>(
      a,
      b,
      c
    )
  }
  
  @inlinable
  func with(b: B) -> COWProduct3Storage<A,B,C> {
    return COWProduct3Storage<A,B,C>(
      a,
      b,
      c
    )
  }
  
  @inlinable
  func with(c: C) -> COWProduct3Storage<A,B,C> {
    return COWProduct3Storage<A,B,C>(
      a,
      b,
      c
    )
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3Storage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProduct3Storage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWProduct3Storage"
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
        String(reflecting: C.self)
        ].joined(separator: ", ")
    }
  }
  
  @inlinable
  var componentDescriptions: String {
    get {
      return [
        String(describing: self.a),
        String(describing: self.b),
        String(describing: self.c)
        ].joined(separator: ", ")
    }
  }
  
  @inlinable
  var componentDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))",
        "c: \(String(reflecting: self.c))"
        ].joined(separator: ", ")
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3Storage - Validatable
// -------------------------------------------------------------------------- //

extension COWProduct3Storage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3Storage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct3Storage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3Storage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct3Storage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}
