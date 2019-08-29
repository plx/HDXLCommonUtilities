//
//  COWProduct7.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct7 - Definition
// -------------------------------------------------------------------------- //

public struct COWProduct7<A,B,C,D,E,F,G> {
  
  @usableFromInline
  internal typealias Storage = COWProduct7Storage<A,B,C,D,E,F,G>
  
  @usableFromInline
  internal var storage: Storage

  /// "Designated initializer" for `COWProduct7` (pseudo-private).
  @inlinable
  internal init(storage: Storage) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(storage.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.storage = storage
  }

  /// "Designated initializer" for `COWProduct7` (pseudo-private).
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

  /// Construct a `COWProduct7` from the individual components.
  @inlinable
  public init(
    _ a: A,
    _ b: B,
    _ c: C,
    _ d: D,
    _ e: E,
    _ f: F,
    _ g: G) {
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
        g
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7 - Property Exposure
// -------------------------------------------------------------------------- //

public extension COWProduct7 {
  
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
    
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7 - Mutation
// -------------------------------------------------------------------------- //

public extension COWProduct7 {
  
  /// In-place mutates `self`, *after first obtaining a unique copy*.
  @inlinable
  mutating func mutateInPlace(using mutation: (inout COWProduct7<A,B,C,D,E,F,G>) -> Void) {
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
// MARK: COWProduct7 - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProduct7 {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWProduct7"
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
// MARK: COWProduct7 - AlgebraicProduct7
// -------------------------------------------------------------------------- //

extension COWProduct7 : AlgebraicProduct7 {
  
  public typealias ArityPosition = Arity7Position

  @inlinable
  public static var withDerivationShouldEnsureUniqueCopyByDefault: Bool {
    get {
      return false
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7 - Validatable
// -------------------------------------------------------------------------- //

extension COWProduct7 : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7 - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct7 : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return self.storage.description
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct7 : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.componentDebugDescriptions))"
    }
  }
  
}
