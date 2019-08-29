//
//  Fixed8Collection.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: Fixed8Collection - Definition
// ------------------------------------------------------------------------ //

public struct Fixed8Collection<Representation>
  where
  Representation:AlgebraicProduct8,
  Representation.A == Representation.B,
  Representation.A == Representation.C,
  Representation.A == Representation.D,
  Representation.A == Representation.E,
  Representation.A == Representation.F,
  Representation.A == Representation.G,
  Representation.A == Representation.H {
  
  @usableFromInline
  internal typealias Storage = Representation
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  public init(
    _ a: Element,
    _ b: Element,
    _ c: Element,
    _ d: Element,
    _ e: Element,
    _ f: Element,
    _ g: Element,
    _ h: Element) {
    self.init(
      storage: Storage(
        a,
        b,
        c,
        d,
        e,
        f,
        g,
        h
      )
    )
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed8Collection - Property Exposure
// ------------------------------------------------------------------------ //

public extension Fixed8Collection {
  
  @inlinable
  var a: Element {
    get {
      return self.storage.a
    }
    set {
      self.storage.a = newValue
    }
  }
  
  @inlinable
  var b: Element {
    get {
      return self.storage.b
    }
    set {
      self.storage.b = newValue
    }
  }
  
  @inlinable
  var c: Element {
    get {
      return self.storage.c
    }
    set {
      self.storage.c = newValue
    }
  }
  
  @inlinable
  var d: Element {
    get {
      return self.storage.d
    }
    set {
      self.storage.d = newValue
    }
  }
  
  @inlinable
  var e: Element {
    get {
      return self.storage.e
    }
    set {
      self.storage.e = newValue
    }
  }
  
  @inlinable
  var f: Element {
    get {
      return self.storage.f
    }
    set {
      self.storage.f = newValue
    }
  }
  
  @inlinable
  var g: Element {
    get {
      return self.storage.g
    }
    set {
      self.storage.g = newValue
    }
  }
  
  @inlinable
  var h: Element {
    get {
      return self.storage.h
    }
    set {
      self.storage.h = newValue
    }
  }

}

// ------------------------------------------------------------------------ //
// MARK: Fixed8Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension Fixed8Collection {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Fixed8Collection"
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
      return String(reflecting: Element.self)
    }
  }
  
  @inlinable
  var parameterDescriptions: String {
    get {
      return [
        String(reflecting: self.a),
        String(reflecting: self.b),
        String(reflecting: self.c),
        String(reflecting: self.d),
        String(reflecting: self.e),
        String(reflecting: self.f),
        String(reflecting: self.g),
        String(reflecting: self.h)
        ].joined(separator: ", ")
      
    }
  }
  
  @inlinable
  var parameterDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))",
        "c: \(String(reflecting: self.c))",
        "d: \(String(reflecting: self.d))",
        "e: \(String(reflecting: self.e))",
        "f: \(String(reflecting: self.f))",
        "g: \(String(reflecting: self.g))",
        "h: \(String(reflecting: self.h))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed8Collection - Validatable
// ------------------------------------------------------------------------ //

extension Fixed8Collection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed8Collection - Equatable
// ------------------------------------------------------------------------ //

extension Fixed8Collection : Equatable where Representation:Equatable {
  
  @inlinable
  public static func ==(
    lhs: Fixed8Collection<Representation>,
    rhs: Fixed8Collection<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: Fixed8Collection<Representation>,
    rhs: Fixed8Collection<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed8Collection - Hashable
// ------------------------------------------------------------------------ //

extension Fixed8Collection : Hashable where Representation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed8Collection - CustomStringConvertible
// ------------------------------------------------------------------------ //

extension Fixed8Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed8Collection - CustomDebugStringConvertible
// ------------------------------------------------------------------------ //

extension Fixed8Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed8Collection - Codable
// ------------------------------------------------------------------------ //

extension Fixed8Collection : Codable where Representation:Codable {
  
  // synthesized ok
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed8Collection - RandomAccessCollection, MutableCollection
// ------------------------------------------------------------------------ //

extension Fixed8Collection : RandomAccessCollection, MutableCollection {
  
  public typealias Index = Int
  public typealias Element = Representation.A
  
  @inlinable
  public var isEmpty: Bool {
    get {
      return false
    }
  }
  
  @inlinable
  public var count: Int {
    get {
      return 8
    }
  }
  
  @inlinable
  public var startIndex: Int {
    get {
      return 0
    }
  }
  
  @inlinable
  public var endIndex: Int {
    get {
      return self.count
    }
  }
  
  @inlinable
  public subscript(index: Int) -> Element {
    get {
      return self.storage.uniformValue(at: index)
    }
    set {
      precondition(self.indices.contains(index))
      self.storage.setUniformValue(
        newValue,
        at: index
      )
    }
  }
  
}

