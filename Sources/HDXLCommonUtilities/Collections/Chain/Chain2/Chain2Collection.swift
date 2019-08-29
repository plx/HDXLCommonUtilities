//
//  Chain2Collection.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Chain2Collection - Definition
// -------------------------------------------------------------------------- //

/// A collection providing the contents of its constituent collections, one after the other.
public struct Chain2Collection<
  A:Collection,
  B:Collection>
  where
  A.Element == B.Element {
  
  @usableFromInline
  internal typealias Storage = Chain2CollectionStorage<A,B>
  
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
    _ b: B) {
    self.init(
      storage: Storage(
        a,
        b
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain2Collection - Property Exposure
// -------------------------------------------------------------------------- //

public extension Chain2Collection {
  
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
    
}

// -------------------------------------------------------------------------- //
// MARK: Chain2Collection - Reflection Support
// -------------------------------------------------------------------------- //

internal extension Chain2Collection {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Chain2Collection"
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

// -------------------------------------------------------------------------- //
// MARK: Chain2Collection - Validatable
// -------------------------------------------------------------------------- //

extension Chain2Collection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain2Collection - Equatable
// -------------------------------------------------------------------------- //

extension Chain2Collection : Equatable
  where
  A:Equatable,
  B:Equatable {
  
  @inlinable
  public static func ==(
    lhs: Chain2Collection<A,B>,
    rhs: Chain2Collection<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: Chain2Collection<A,B>,
    rhs: Chain2Collection<A,B>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain2Collection - Hashable
// -------------------------------------------------------------------------- //

extension Chain2Collection : Hashable
  where
  A:Hashable,
  B:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
}

// -------------------------------------------------------------------------- //
// MARK: Chain2Collection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Chain2Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "( \(self.parameterDescriptions) )"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain2Collection - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Chain2Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain2Collection - Codable
// -------------------------------------------------------------------------- //

extension Chain2Collection : Codable
  where
  A:Codable,
  B:Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain2Collection - Collection
// -------------------------------------------------------------------------- //

extension Chain2Collection : Collection {
  
  public typealias Element = A.Element
  public typealias Index = Chain2CollectionIndex<A,B>
  
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
// MARK: Chain2Collection - BidirectionalCollection
// -------------------------------------------------------------------------- //

extension Chain2Collection : BidirectionalCollection
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection {
  
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
// MARK: Chain2Collection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension Chain2Collection : RandomAccessCollection
  where
  A:RandomAccessCollection,
  B:RandomAccessCollection {
  
}

