//
//  Product8Collection.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Product8Collection - Definition
// -------------------------------------------------------------------------- //

/// Collection offering the 9-way cartesian product of its constituent collections.
///
/// Iteration *will* visit every member of that cartesian product, but consider the specific iteration order
/// very much a private implementation detail (and thus potentially subject to change).
public struct Product8Collection<A,B,C,D,E,F,G,H,Position,Element>
where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection,
  Position:AlgebraicProduct8,
  Position.A == A.Index,
  Position.B == B.Index,
  Position.C == C.Index,
  Position.D == D.Index,
  Position.E == E.Index,
  Position.F == F.Index,
  Position.G == G.Index,
  Position.H == H.Index,
  Element:AlgebraicProduct8,
  Element.A == A.Element,
  Element.B == B.Element,
  Element.C == C.Element,
  Element.D == D.Element,
  Element.E == E.Element,
  Element.F == F.Element,
  Element.G == G.Element,
  Element.H == H.Element {
  
  @usableFromInline
  internal typealias Storage = Product8CollectionStorage<A,B,C,D,E,F,G,H,Position,Element>
  
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
    _ d: D,
    _ e: E,
    _ f: F,
    _ g: G,
    _ h: H) {
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

// -------------------------------------------------------------------------- //
// MARK: Product8Collection - Cache Support
// -------------------------------------------------------------------------- //

internal extension Product8Collection {
  
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
// MARK: Product8Collection - Conveniences
// -------------------------------------------------------------------------- //

public extension Product8Collection {

  /// Retrieves the component-wise counts.
  @inlinable
  var constituentCounts: UniformInlineProduct8<Int> {
    get {
      return self.storage.constituentCounts
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product8Collection - With Derivation
// -------------------------------------------------------------------------- //

public extension Product8Collection {
  
  @inlinable
  func with(a: A) -> Product8Collection<A,B,C,D,E,F,G,H,Position,Element> {
    return Product8Collection<A,B,C,D,E,F,G,H,Position,Element>(
      storage: self.storage.with(
        a: a
      )
    )
  }
  
  @inlinable
  func with(b: B) -> Product8Collection<A,B,C,D,E,F,G,H,Position,Element> {
    return Product8Collection<A,B,C,D,E,F,G,H,Position,Element>(
      storage: self.storage.with(
        b: b
      )
    )
  }
  
  @inlinable
  func with(c: C) -> Product8Collection<A,B,C,D,E,F,G,H,Position,Element> {
    return Product8Collection<A,B,C,D,E,F,G,H,Position,Element>(
      storage: self.storage.with(
        c: c
      )
    )
  }
  
  @inlinable
  func with(d: D) -> Product8Collection<A,B,C,D,E,F,G,H,Position,Element> {
    return Product8Collection<A,B,C,D,E,F,G,H,Position,Element>(
      storage: self.storage.with(
        d: d
      )
    )
  }
  
  @inlinable
  func with(e: E) -> Product8Collection<A,B,C,D,E,F,G,H,Position,Element> {
    return Product8Collection<A,B,C,D,E,F,G,H,Position,Element>(
      storage: self.storage.with(
        e: e
      )
    )
  }
  
  @inlinable
  func with(f: F) -> Product8Collection<A,B,C,D,E,F,G,H,Position,Element> {
    return Product8Collection<A,B,C,D,E,F,G,H,Position,Element>(
      storage: self.storage.with(
        f: f
      )
    )
  }
  
  @inlinable
  func with(g: G) -> Product8Collection<A,B,C,D,E,F,G,H,Position,Element> {
    return Product8Collection<A,B,C,D,E,F,G,H,Position,Element>(
      storage: self.storage.with(
        g: g
      )
    )
  }
  
  @inlinable
  func with(h: H) -> Product8Collection<A,B,C,D,E,F,G,H,Position,Element> {
    return Product8Collection<A,B,C,D,E,F,G,H,Position,Element>(
      storage: self.storage.with(
        h: h
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product8Collection - Property Exposure
// -------------------------------------------------------------------------- //

public extension Product8Collection {
  
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

  @inlinable
  var h: H {
    get {
      return self.storage.h
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(newValue))
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      // ///////////////////////////////////////////////////////////////////////
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.h = newValue
      } else {
        self.storage = self.storage.with(
          h: newValue
        )
      }
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Product8Collection - Validatable
// -------------------------------------------------------------------------- //

extension Product8Collection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product8Collection - Equatable
// -------------------------------------------------------------------------- //

extension Product8Collection : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable,
  F:Equatable,
  G:Equatable,
  H:Equatable {
  
  @inlinable
  public static func ==(
    lhs: Product8Collection<A,B,C,D,E,F,G,H,Position,Element>,
    rhs: Product8Collection<A,B,C,D,E,F,G,H,Position,Element>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: Product8Collection<A,B,C,D,E,F,G,H,Position,Element>,
    rhs: Product8Collection<A,B,C,D,E,F,G,H,Position,Element>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: Product8Collection - Hashable
// -------------------------------------------------------------------------- //

extension Product8Collection : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable,
  F:Hashable,
  G:Hashable,
  H:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: Product8Collection - Codable
// -------------------------------------------------------------------------- //

extension Product8Collection : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable,
  F:Codable,
  G:Codable,
  H:Codable {
  
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
// MARK: Product8Collection - Collection
// -------------------------------------------------------------------------- //

extension Product8Collection : Collection {

  public typealias Index = Product8CollectionIndex<Position>
  
//  public typealias Indices = Product8CollectionIndices<
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
  
//  public typealias SubSequence = Product8Collection<
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
// MARK: Product8Collection - BidirectionalCollection
// -------------------------------------------------------------------------- //

extension Product8Collection : BidirectionalCollection
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection,
  C:BidirectionalCollection,
  D:BidirectionalCollection,
  E:BidirectionalCollection,
  F:BidirectionalCollection,
  G:BidirectionalCollection,
  H:BidirectionalCollection {
  
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
// MARK: Product8Collection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension Product8Collection : RandomAccessCollection
  where
  A:RandomAccessCollection,
  B:RandomAccessCollection,
  C:RandomAccessCollection,
  D:RandomAccessCollection,
  E:RandomAccessCollection,
  F:RandomAccessCollection,
  G:RandomAccessCollection,
  H:RandomAccessCollection {
  
}

