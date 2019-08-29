//
//  Fixed4Collection.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: Fixed4Collection - Definition
// ------------------------------------------------------------------------ //

public struct Fixed4Collection<Representation>
  where
  Representation:AlgebraicProduct4,
  Representation.A == Representation.B,
  Representation.A == Representation.C,
  Representation.A == Representation.D {
  
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
    _ d: Element) {
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

// ------------------------------------------------------------------------ //
// MARK: Fixed4Collection - Property Exposure
// ------------------------------------------------------------------------ //

public extension Fixed4Collection {
  
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
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed4Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension Fixed4Collection {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Fixed4Collection"
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
        String(reflecting: self.d)
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
        "d: \(String(reflecting: self.d))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed4Collection - Validatable
// ------------------------------------------------------------------------ //

extension Fixed4Collection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed4Collection - Equatable
// ------------------------------------------------------------------------ //

extension Fixed4Collection : Equatable where Representation:Equatable {
  
  @inlinable
  public static func ==(
    lhs: Fixed4Collection<Representation>,
    rhs: Fixed4Collection<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: Fixed4Collection<Representation>,
    rhs: Fixed4Collection<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed4Collection - Hashable
// ------------------------------------------------------------------------ //

extension Fixed4Collection : Hashable where Representation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed4Collection - CustomStringConvertible
// ------------------------------------------------------------------------ //

extension Fixed4Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed4Collection - CustomDebugStringConvertible
// ------------------------------------------------------------------------ //

extension Fixed4Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed4Collection - Codable
// ------------------------------------------------------------------------ //

extension Fixed4Collection : Codable where Representation:Codable {
  
  // synthesized ok
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed4Collection - RandomAccessCollection, MutableCollection
// ------------------------------------------------------------------------ //

extension Fixed4Collection : RandomAccessCollection, MutableCollection {
  
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
      return 4
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

