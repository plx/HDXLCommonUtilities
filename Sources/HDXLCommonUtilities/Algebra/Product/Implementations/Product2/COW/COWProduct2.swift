//
//  COWProduct2.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct2 - Definition
// -------------------------------------------------------------------------- //

public struct COWProduct2<A,B> {
  
  @usableFromInline
  internal typealias Storage = COWProduct2Storage<A,B>
  
  @usableFromInline
  internal var storage: Storage

  /// "Designated initializer" for `COWProduct2` (pseudo-private).
  @inlinable
  internal init(storage: Storage) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(storage.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.storage = storage
  }

  /// "Designated initializer" for `COWProduct2` (pseudo-private).
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

  /// Construct a `COWProduct2` from the individual components.
  @inlinable
  public init(
    _ a: A,
    _ b: B) {
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.init(
      storage: Storage(
        a,
        b
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2 - Property Exposure
// -------------------------------------------------------------------------- //

public extension COWProduct2 {
  
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
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2 - Mutation
// -------------------------------------------------------------------------- //

public extension COWProduct2 {
  
  /// In-place mutates `self`, *after first obtaining a unique copy*.
  @inlinable
  mutating func mutateInPlace(using mutation: (inout COWProduct2<A,B>) -> Void) {
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
// MARK: COWProduct2 - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProduct2 {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWProduct2"
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
// MARK: COWProduct2 - AlgebraicProduct2
// -------------------------------------------------------------------------- //

extension COWProduct2 : AlgebraicProduct2 {
  
  public typealias ArityPosition = Arity2Position

  @inlinable
  public static var withDerivationShouldEnsureUniqueCopyByDefault: Bool {
    get {
      return false
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2 - Validatable
// -------------------------------------------------------------------------- //

extension COWProduct2 : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2 - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct2 : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct2 : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}

