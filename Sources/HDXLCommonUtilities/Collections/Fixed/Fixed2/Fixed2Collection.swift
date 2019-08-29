//
//  Fixed2Collection.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: Fixed2Collection - Definition
// ------------------------------------------------------------------------ //

public struct Fixed2Collection<Representation>
  where
  Representation:AlgebraicProduct2,
  Representation.A == Representation.B {
  
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
    _ b: Element) {
    self.init(
      storage: Storage(
        a,
        b
      )
    )
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed2Collection - Property Exposure
// ------------------------------------------------------------------------ //

public extension Fixed2Collection {
  
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

}

// ------------------------------------------------------------------------ //
// MARK: Fixed2Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension Fixed2Collection {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Fixed2Collection"
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
        String(reflecting: self.b)
        ].joined(separator: ", ")
      
    }
  }
  
  @inlinable
  var parameterDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed2Collection - Validatable
// ------------------------------------------------------------------------ //

extension Fixed2Collection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed2Collection - Equatable
// ------------------------------------------------------------------------ //

extension Fixed2Collection : Equatable where Representation:Equatable {
  
  @inlinable
  public static func ==(
    lhs: Fixed2Collection<Representation>,
    rhs: Fixed2Collection<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: Fixed2Collection<Representation>,
    rhs: Fixed2Collection<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed2Collection - Hashable
// ------------------------------------------------------------------------ //

extension Fixed2Collection : Hashable where Representation:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed2Collection - CustomStringConvertible
// ------------------------------------------------------------------------ //

extension Fixed2Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed2Collection - CustomDebugStringConvertible
// ------------------------------------------------------------------------ //

extension Fixed2Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed2Collection - Codable
// ------------------------------------------------------------------------ //

extension Fixed2Collection : Codable where Representation:Codable {
  
  // synthesized ok
  
}

// ------------------------------------------------------------------------ //
// MARK: Fixed2Collection - RandomAccessCollection, MutableCollection
// ------------------------------------------------------------------------ //

extension Fixed2Collection : RandomAccessCollection, MutableCollection {
  
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
      return 2
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

