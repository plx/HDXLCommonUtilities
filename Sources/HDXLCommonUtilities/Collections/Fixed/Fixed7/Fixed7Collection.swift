//
//  Fixed7Collection.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: Fixed7Collection - Definition
// ------------------------------------------------------------------------ //

public struct Fixed7Collection<Representation>
  where
  Representation:AlgebraicProduct7,
  Representation.A == Representation.B,
  Representation.A == Representation.C,
  Representation.A == Representation.D,
  Representation.A == Representation.E,
  Representation.A == Representation.F,
  Representation.A == Representation.G {
  
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
    _ g: Element) {
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

// ------------------------------------------------------------------------ //
// MARK: Fixed7Collection - Property Exposure
// ------------------------------------------------------------------------ //

public extension Fixed7Collection {
  
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
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed7Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension Fixed7Collection {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Fixed7Collection"
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
        String(reflecting: self.g)
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
        "g: \(String(reflecting: self.g))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed7Collection - Validatable
// ------------------------------------------------------------------------ //

extension Fixed7Collection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed7Collection - Equatable
// ------------------------------------------------------------------------ //

extension Fixed7Collection : Equatable where Representation:Equatable {
  
  @inlinable
  public static func ==(
    lhs: Fixed7Collection<Representation>,
    rhs: Fixed7Collection<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: Fixed7Collection<Representation>,
    rhs: Fixed7Collection<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed7Collection - Hashable
// ------------------------------------------------------------------------ //

extension Fixed7Collection : Hashable where Representation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed7Collection - CustomStringConvertible
// ------------------------------------------------------------------------ //

extension Fixed7Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed7Collection - CustomDebugStringConvertible
// ------------------------------------------------------------------------ //

extension Fixed7Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed7Collection - Codable
// ------------------------------------------------------------------------ //

extension Fixed7Collection : Codable where Representation:Codable {
  
  // synthesized ok
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed7Collection - RandomAccessCollection, MutableCollection
// ------------------------------------------------------------------------ //

extension Fixed7Collection : RandomAccessCollection, MutableCollection {
  
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
      return 7
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

