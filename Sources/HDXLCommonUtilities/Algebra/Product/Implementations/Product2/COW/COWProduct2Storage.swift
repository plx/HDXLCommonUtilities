//
//  COWProduct2Storage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct2Storage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class COWProduct2Storage<A,B> {
  
  @usableFromInline
  internal typealias Storage = InlineProduct2<A,B>
  
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
    _ b: B) {
    self.init(
      storage: Storage(
        a,
        b
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2Storage - Cloning
// -------------------------------------------------------------------------- //

internal extension COWProduct2Storage {
  
  @inlinable
  func obtainClone() -> COWProduct2Storage<A,B> {
    return COWProduct2Storage<A,B>(
      storage: self.storage
    )
  }
  
  @inlinable
  func obtainMutatedClone(mutation: (COWProduct2Storage<A,B>) -> Void) -> COWProduct2Storage<A,B> {
    let result = self.obtainClone()
    mutation(result)
    return result
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2Storage - Property Exposure
// -------------------------------------------------------------------------- //

internal extension COWProduct2Storage {
  
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
    
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2Storage - With-Derivations
// -------------------------------------------------------------------------- //

internal extension COWProduct2Storage {
  
  @inlinable
  func with(a: A) -> COWProduct2Storage<A,B> {
    return COWProduct2Storage<A,B>(
      a,
      b
    )
  }
  
  @inlinable
  func with(b: B) -> COWProduct2Storage<A,B> {
    return COWProduct2Storage<A,B>(
      a,
      b
    )
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2Storage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProduct2Storage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWProduct2Storage"
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
// MARK: COWProduct2Storage - Validatable
// -------------------------------------------------------------------------- //

extension COWProduct2Storage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2Storage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct2Storage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2Storage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct2Storage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}
