//
//  Fixed9Collection.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: Fixed9Collection - Definition
// ------------------------------------------------------------------------ //

public struct Fixed9Collection<Representation>
  where
  Representation:AlgebraicProduct9,
  Representation.A == Representation.B,
  Representation.A == Representation.C,
  Representation.A == Representation.D,
  Representation.A == Representation.E,
  Representation.A == Representation.F,
  Representation.A == Representation.G,
  Representation.A == Representation.H,
  Representation.A == Representation.I {
  
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
    _ h: Element,
    _ i: Element) {
    self.init(
      storage: Storage(
        a,
        b,
        c,
        d,
        e,
        f,
        g,
        h,
        i
      )
    )
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed9Collection - Property Exposure
// ------------------------------------------------------------------------ //

public extension Fixed9Collection {
  
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
  
  @inlinable
  var i: Element {
    get {
      return self.storage.i
    }
    set {
      self.storage.i = newValue
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed9Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension Fixed9Collection {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Fixed9Collection"
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
        String(reflecting: self.h),
        String(reflecting: self.i)
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
        "h: \(String(reflecting: self.h))",
        "i: \(String(reflecting: self.i))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed9Collection - Validatable
// ------------------------------------------------------------------------ //

extension Fixed9Collection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed9Collection - Equatable
// ------------------------------------------------------------------------ //

extension Fixed9Collection : Equatable where Representation:Equatable {
  
  @inlinable
  public static func ==(
    lhs: Fixed9Collection<Representation>,
    rhs: Fixed9Collection<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: Fixed9Collection<Representation>,
    rhs: Fixed9Collection<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed9Collection - Hashable
// ------------------------------------------------------------------------ //

extension Fixed9Collection : Hashable where Representation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed9Collection - CustomStringConvertible
// ------------------------------------------------------------------------ //

extension Fixed9Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed9Collection - CustomDebugStringConvertible
// ------------------------------------------------------------------------ //

extension Fixed9Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed9Collection - Codable
// ------------------------------------------------------------------------ //

extension Fixed9Collection : Codable where Representation:Codable {
  
  // synthesized ok
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed9Collection - RandomAccessCollection, MutableCollection
// ------------------------------------------------------------------------ //

extension Fixed9Collection : RandomAccessCollection, MutableCollection {
  
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
      return 9
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

