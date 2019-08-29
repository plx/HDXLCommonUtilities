//
//  Product4Collection.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Product4Collection - Definition
// -------------------------------------------------------------------------- //

/// Collection offering the 9-way cartesian product of its constituent collections.
///
/// Iteration *will* visit every member of that cartesian product, but consider the specific iteration order
/// very much a private implementation detail (and thus potentially subject to change).
public struct Product4Collection<A,B,C,D,Position,Element>
where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  Position:AlgebraicProduct4,
  Position.A == A.Index,
  Position.B == B.Index,
  Position.C == C.Index,
  Position.D == D.Index,
  Element:AlgebraicProduct4,
  Element.A == A.Element,
  Element.B == B.Element,
  Element.C == C.Element,
  Element.D == D.Element {
  
  @usableFromInline
  internal typealias Storage = Product4CollectionStorage<A,B,C,D,Position,Element>
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  public init(
    _ a: A,
    _ b: B,
    _ c: C,
    _ d: D) {
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

// -------------------------------------------------------------------------- //
// MARK: Product4Collection - Cache Support
// -------------------------------------------------------------------------- //

internal extension Product4Collection {
  
  /// Forcibly-populates all private cached values.
  ///
  /// - note: Private utility, motivated for use with parallel iteration/visiting/etc..
  ///
  @inlinable
  func fullyPopulateCaches() {
    self.storage.fullyPopulateCaches()
  }
  
  /// `true` iff all private cached values have been populated.
  ///
  /// - note: Private utility, motivated for use with parallel iteration/visiting/etc..
  ///
  @inlinable
  var hasFullyPopulatedCaches: Bool {
    get {
      return self.storage.hasFullyPopulatedCaches
    }
  }
}

// -------------------------------------------------------------------------- //
// MARK: Product4Collection - Conveniences
// -------------------------------------------------------------------------- //

public extension Product4Collection {

  /// Retrieves the component-wise counts.
  @inlinable
  var constituentCounts: UniformInlineProduct4<Int> {
    get {
      return self.storage.constituentCounts
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product4Collection - With Derivation
// -------------------------------------------------------------------------- //

public extension Product4Collection {
  
  @inlinable
  func with(a: A) -> Product4Collection<A,B,C,D,Position,Element> {
    return Product4Collection<A,B,C,D,Position,Element>(
      storage: self.storage.with(
        a: a
      )
    )
  }
  
  @inlinable
  func with(b: B) -> Product4Collection<A,B,C,D,Position,Element> {
    return Product4Collection<A,B,C,D,Position,Element>(
      storage: self.storage.with(
        b: b
      )
    )
  }
  
  @inlinable
  func with(c: C) -> Product4Collection<A,B,C,D,Position,Element> {
    return Product4Collection<A,B,C,D,Position,Element>(
      storage: self.storage.with(
        c: c
      )
    )
  }
  
  @inlinable
  func with(d: D) -> Product4Collection<A,B,C,D,Position,Element> {
    return Product4Collection<A,B,C,D,Position,Element>(
      storage: self.storage.with(
        d: d
      )
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: Product4Collection - Property Exposure
// -------------------------------------------------------------------------- //

public extension Product4Collection {
  
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

}

// -------------------------------------------------------------------------- //
// MARK: Product4Collection - Validatable
// -------------------------------------------------------------------------- //

extension Product4Collection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product4Collection - Equatable
// -------------------------------------------------------------------------- //

extension Product4Collection : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable {
  
  @inlinable
  public static func ==(
    lhs: Product4Collection<A,B,C,D,Position,Element>,
    rhs: Product4Collection<A,B,C,D,Position,Element>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: Product4Collection<A,B,C,D,Position,Element>,
    rhs: Product4Collection<A,B,C,D,Position,Element>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: Product4Collection - Hashable
// -------------------------------------------------------------------------- //

extension Product4Collection : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: Product4Collection - Codable
// -------------------------------------------------------------------------- //

extension Product4Collection : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable {
  
  @inlinable
  public func encode(to encoder: Encoder) throws {
    var value = encoder.singleValueContainer()
    try value.encode(self.storage)
  }
  
  @inlinable
  public init(from decoder: Decoder) throws {
    let value = try decoder.singleValueContainer()
    self.init(
      storage: try value.decode(Storage.self)
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product4Collection - Collection
// -------------------------------------------------------------------------- //

extension Product4Collection : Collection {

  public typealias Index = Product4CollectionIndex<Position>
  
//  public typealias Indices = Product4CollectionIndices<
//    A,
//    B,
//    C,
//    D,
//    E,
//    F,
//    G,
//    H,
//    I
//  >
  
//  public typealias SubSequence = Product4Collection<
//    A.SubSequence,
//    B.SubSequence,
//    C.SubSequence,
//    D.SubSequence,
//    E.SubSequence,
//    F.SubSequence,
//    G.SubSequence,
//    H.SubSequence,
//    I.SubSequence
//  >
//
  
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
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    guard start != end else {
      return 0
    }
    return (
      self.linearizedIndex(forIndex: end)
      -
      self.linearizedIndex(forIndex: start)
    )
  }
  
  @inlinable
  internal func linearizedIndex(forIndex index: Index) -> Int {
    switch index.storage {
    case .position(let position):
      return self.storage.linearPosition(
        forPosition: position
      )
    case .end:
      return self.count
    }
  }
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      switch index.storage {
      case .position(let position):
        return self.storage[position]
      case .end:
        preconditionFailure("Attempted to subscript the `endIndex` on \(String(reflecting: self))!")
      }
    }
  }
  
  @inlinable
  public func index(
    after i: Index) -> Index {
    switch i.storage {
    case .position(let position):
      guard let nextPosition = self.storage.position(after: position) else {
        return self.endIndex
      }
      return Index(position: nextPosition)
    case .end:
      preconditionFailure("Attempted to advance from the `endIndex` on \(String(reflecting: self))!")
    }
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int) -> Index {
    let linearizedIndex = self.linearizedIndex(forIndex: i)
    let destination = linearizedIndex + distance
    guard (0...self.count).contains(destination) else {
      preconditionFailure("Invalid navigation to `\(destination)` (as \(linearizedIndex) offsetBy: \(distance), originally \(String(reflecting: i))!")
    }
    guard destination < self.count else {
      return self.endIndex
    }
    return Index(
      position: self.storage.position(
        forLinearPosition: destination
      )
    )
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Index? {
    let linearizedIndex = self.linearizedIndex(forIndex: i)
    let linearizedLimit = self.linearizedIndex(forIndex: limit)
    let destination = linearizedIndex + distance
    if distance > 0 && destination > linearizedLimit {
      return nil
    } else if distance < 0 && destination < linearizedLimit {
      return nil
    }
    guard (0...self.count).contains(destination) else {
      preconditionFailure("Invalid navigation to `\(destination)` (as \(linearizedIndex) offsetBy: \(distance), originally \(String(reflecting: i))!")
    }
    guard destination < self.count else {
      return self.endIndex
    }
    return Index(
      position: self.storage.position(
        forLinearPosition: destination
      )
    )

  }

}

// -------------------------------------------------------------------------- //
// MARK: Product4Collection - BidirectionalCollection
// -------------------------------------------------------------------------- //

extension Product4Collection : BidirectionalCollection
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection,
  C:BidirectionalCollection,
  D:BidirectionalCollection {
  
  @inlinable
  public func index(
    before i: Index) -> Index {
    switch i.storage {
    case .position(let position):
      guard let previousPosition = self.storage.position(before: position) else {
        preconditionFailure("Attempted to go back from the `startIndex` on \(String(reflecting: self))!")
      }
      return Index(position: previousPosition)
    case .end:
      guard let finalPosition = self.storage.finalPosition else {
        preconditionFailure("Attempted to go back from the `endIndex` in an empty \(String(reflecting: self))!")
      }
      return Index(position: finalPosition)
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Product4Collection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension Product4Collection : RandomAccessCollection
  where
  A:RandomAccessCollection,
  B:RandomAccessCollection,
  C:RandomAccessCollection,
  D:RandomAccessCollection {
  
}

