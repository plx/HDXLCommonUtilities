//
//  Chain3Collection.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Chain3Collection - Definition
// -------------------------------------------------------------------------- //

/// A collection providing the contents of its constituent collections, one after the other.
public struct Chain3Collection<
  A:Collection,
  B:Collection,
  C:Collection>
  where
  A.Element == B.Element,
  A.Element == C.Element {
  
  @usableFromInline
  internal typealias Storage = Chain3CollectionStorage<A,B,C>
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(storage.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.storage = storage
  }
  
  @inlinable
  public init(
    _ a: A,
    _ b: B,
    _ c: C) {
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
// MARK: Chain3Collection - Property Exposure
// -------------------------------------------------------------------------- //

public extension Chain3Collection {
  
  @inlinable
  var a: A {
    get {
      return self.storage.a
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
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
// MARK: Chain3Collection - Reflection Support
// -------------------------------------------------------------------------- //

internal extension Chain3Collection {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Chain3Collection"
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
  var parameterDescriptions: String {
    get {
      return [
        String(reflecting: self.a),
        String(reflecting: self.b),
        String(reflecting: self.c)
        ].joined(separator: ", ")
      
    }
  }
  
  @inlinable
  var parameterDebugDescriptions: String {
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
// MARK: Chain3Collection - Validatable
// -------------------------------------------------------------------------- //

extension Chain3Collection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain3Collection - Equatable
// -------------------------------------------------------------------------- //

extension Chain3Collection : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable {
  
  @inlinable
  public static func ==(
    lhs: Chain3Collection<A,B,C>,
    rhs: Chain3Collection<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: Chain3Collection<A,B,C>,
    rhs: Chain3Collection<A,B,C>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain3Collection - Hashable
// -------------------------------------------------------------------------- //

extension Chain3Collection : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
}

// -------------------------------------------------------------------------- //
// MARK: Chain3Collection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Chain3Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "( \(self.parameterDescriptions) )"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain3Collection - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Chain3Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain3Collection - Codable
// -------------------------------------------------------------------------- //

extension Chain3Collection : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain3Collection - Collection
// -------------------------------------------------------------------------- //

extension Chain3Collection : Collection {
  
  public typealias Element = A.Element
  public typealias Index = Chain3CollectionIndex<A,B,C>
  
  @inlinable
  public var isEmpty: Bool {
    get {
      return self.storage.isEmpty
    }
  }
  
  @inlinable
  public var count: Int {
    get {
      return self.storage.count
    }
  }
  
  @inlinable
  public var startIndex: Index {
    get {
      return self.storage.startIndex
    }
  }
  
  @inlinable
  public var endIndex: Index {
    get {
      return self.storage.endIndex
    }
  }
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      switch index.storage {
      case .position(let position):
        return self.storage[position]
      case .end:
        preconditionFailure("Tried to subscript the end index on \(String(reflecting: self))!")
      }
    }
  }
  
  @inlinable
  internal func linearIndex(forIndex index: Index) -> Int {
    switch index.storage {
    case .position(let position):
      return self.storage.linearPosition(forPosition: position)
    case .end:
      return self.count
    }
  }
  
  @inlinable
  internal func index(forLinearIndex linearIndex: Int) -> Index {
    guard (0...self.count).contains(linearIndex) else {
      preconditionFailure("Attempted to convert invalid linearIndex \(linearIndex) to index in \(String(reflecting: self))!")
    }
    guard linearIndex < self.count else {
      return self.endIndex
    }
    return Index(
      position: self.storage.position(
        forLinearPosition: linearIndex
      )
    )
  }
  
  @inlinable
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    return (
      self.linearIndex(forIndex: end)
        -
        self.linearIndex(forIndex: start)
    )
  }
  
  @inlinable
  public func index(after index: Index) -> Index {
    switch index.storage {
    case .position(let position):
      guard let nextPosition = self.storage.position(after: position) else {
        return self.endIndex
      }
      return Index(position: nextPosition)
    case .end:
      preconditionFailure("Tried to advance the end index on \(String(reflecting: self))!")
    }
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int) -> Index {
    guard distance != 0 else {
      return i
    }
    return self.index(
      forLinearIndex: (
        self.linearIndex(forIndex: i)
          +
        distance
      )
    )
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Index? {
    let destination = self.linearIndex(forIndex: i) + distance
    let boundary = self.linearIndex(forIndex: limit)
    if distance < 0 {
      guard boundary <= destination else {
        return nil
      }
      return self.index(forLinearIndex: destination)
    } else if distance > 0 {
      guard destination <= boundary else {
        return nil
      }
      return self.index(forLinearIndex: destination)
    } else {
      return i
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain3Collection - BidirectionalCollection
// -------------------------------------------------------------------------- //

extension Chain3Collection : BidirectionalCollection
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection,
  C:BidirectionalCollection {
  
  @inlinable
  public func index(before index: Index) -> Index {
    precondition(index > self.startIndex)
    switch index.storage {
    case .position(let position):
      guard let previousPosition = self.storage.position(before: position) else {
        preconditionFailure("Tried to go back from the start index in \(String(reflecting: self))!")
      }
      return Index(position: previousPosition)
    case .end:
      guard let finalPosition = self.storage.finalPosition else {
        preconditionFailure("Tried to go back from the start index in \(String(reflecting: self))!")
      }
      return Index(position: finalPosition)
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain3Collection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension Chain3Collection : RandomAccessCollection
  where
  A:RandomAccessCollection,
  B:RandomAccessCollection,
  C:RandomAccessCollection {
  
}

