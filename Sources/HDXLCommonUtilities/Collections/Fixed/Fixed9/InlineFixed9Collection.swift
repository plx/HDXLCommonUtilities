//
//  InlineFixed9Collection.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: InlineFixed9Collection - Definition
// ------------------------------------------------------------------------ //

public struct InlineFixed9Collection<T> {
  
  @usableFromInline
  internal typealias Storage = UniformInlineProduct9<T>
  
  @usableFromInline
  internal var storage: Storage
  
  @usableFromInline
  init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  public init(
    _ a: T,
    _ b: T,
    _ c: T,
    _ d: T,
    _ e: T,
    _ f: T,
    _ g: T,
    _ h: T,
    _ i: T) {
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
// MARK: InlineFixed9Collection - Property Exposure
// ------------------------------------------------------------------------ //

public extension InlineFixed9Collection {
  
  @inlinable
  var a: T {
    get {
      return self.storage.a
    }
    set {
      self.storage.a = newValue
    }
  }
  
  @inlinable
  var b: T {
    get {
      return self.storage.b
    }
    set {
      self.storage.b = newValue
    }
  }
  
  @inlinable
  var c: T {
    get {
      return self.storage.c
    }
    set {
      self.storage.c = newValue
    }
  }
  
  @inlinable
  var d: T {
    get {
      return self.storage.d
    }
    set {
      self.storage.d = newValue
    }
  }
  
  @inlinable
  var e: T {
    get {
      return self.storage.e
    }
    set {
      self.storage.e = newValue
    }
  }
  
  @inlinable
  var f: T {
    get {
      return self.storage.f
    }
    set {
      self.storage.f = newValue
    }
  }
  
  @inlinable
  var g: T {
    get {
      return self.storage.g
    }
    set {
      self.storage.g = newValue
    }
  }
  
  @inlinable
  var h: T {
    get {
      return self.storage.h
    }
    set {
      self.storage.h = newValue
    }
  }
  
  @inlinable
  var i: T {
    get {
      return self.storage.i
    }
    set {
      self.storage.i = newValue
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: InlineFixed9Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension InlineFixed9Collection {
  
  @usableFromInline
  static var shortTypeName: String {
    get {
      return "InlineFixed9Collection"
    }
  }
  
  @usableFromInline
  static var completeTypeName: String {
    get {
      return "\(self.shortTypeName)<\(self.typeParameterNames)>"
    }
  }
  
  @usableFromInline
  static var typeParameterNames: String {
    get {
      return String(reflecting: T.self)
    }
  }
  
  @usableFromInline
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
  
  @usableFromInline
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
// MARK: InlineFixed9Collection - Validatable
// ------------------------------------------------------------------------ //

extension InlineFixed9Collection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: InlineFixed9Collection - Equatable
// ------------------------------------------------------------------------ //

extension InlineFixed9Collection : Equatable where T:Equatable {
  
  @inlinable
  public static func ==(
    lhs: InlineFixed9Collection<T>,
    rhs: InlineFixed9Collection<T>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: InlineFixed9Collection<T>,
    rhs: InlineFixed9Collection<T>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: InlineFixed9Collection - Hashable
// ------------------------------------------------------------------------ //

extension InlineFixed9Collection : Hashable where T:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: InlineFixed9Collection - CustomStringConvertible
// ------------------------------------------------------------------------ //

extension InlineFixed9Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: InlineFixed9Collection - CustomDebugStringConvertible
// ------------------------------------------------------------------------ //

extension InlineFixed9Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: InlineFixed9Collection - Codable
// ------------------------------------------------------------------------ //

extension InlineFixed9Collection : Codable where T:Codable {
  
  // synthesized ok
  
}

// ------------------------------------------------------------------------ //
// MARK: InlineFixed9Collection - RandomAccessCollection, MutableCollection
// ------------------------------------------------------------------------ //

extension InlineFixed9Collection : RandomAccessCollection, MutableCollection {
  
  public typealias Index = Int
  public typealias Element = T
  
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
  public subscript(index: Int) -> T {
    get {
      return self.storage.value(at: index)
    }
    set {
      precondition(self.indices.contains(index))
      self.storage.setValue(
        newValue,
        at: index
      )
    }
  }
  
}

