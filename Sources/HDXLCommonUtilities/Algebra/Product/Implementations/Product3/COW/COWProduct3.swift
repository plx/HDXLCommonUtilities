//
//  COWProduct3.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct3 - Definition
// -------------------------------------------------------------------------- //

public struct COWProduct3<A,B,C> {
  
  @usableFromInline
  internal typealias Storage = COWProduct3Storage<A,B,C>
  
  @usableFromInline
  internal var storage: Storage

  /// "Designated initializer" for `COWProduct3` (pseudo-private).
  @inlinable
  internal init(storage: Storage) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(storage.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.storage = storage
  }

  /// "Designated initializer" for `COWProduct3` (pseudo-private).
  @inlinable
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

  /// Construct a `COWProduct3` from the individual components.
  @inlinable
  public init(
    _ a: A,
    _ b: B,
    _ c: C) {
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
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
// MARK: COWProduct3 - Property Exposure
// -------------------------------------------------------------------------- //

public extension COWProduct3 {
  
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
    
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3 - Mutation
// -------------------------------------------------------------------------- //

public extension COWProduct3 {
  
  /// In-place mutates `self`, *after first obtaining a unique copy*.
  @inlinable
  mutating func mutateInPlace(using mutation: (inout COWProduct3<A,B,C>) -> Void) {
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
// MARK: COWProduct3 - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProduct3 {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWProduct3"
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
// MARK: COWProduct3 - AlgebraicProduct3
// -------------------------------------------------------------------------- //

extension COWProduct3 : AlgebraicProduct3 {
  
  public typealias ArityPosition = Arity3Position

  @inlinable
  public static var withDerivationShouldEnsureUniqueCopyByDefault: Bool {
    get {
      return false
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3 - Validatable
// -------------------------------------------------------------------------- //

extension COWProduct3 : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3 - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct3 : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct3 : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}

