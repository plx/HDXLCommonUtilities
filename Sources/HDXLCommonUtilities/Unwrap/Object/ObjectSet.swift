//
//  ObjectSet.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ObjectSet - Definition
// -------------------------------------------------------------------------- //

/// Wrapper for a "set of objects", wherein object identity is object equality.
///
/// Implemented as a wrapper around a `Set<ObjectWrapper<Element>>`, with the wrapper
/// transparently wrapping/unwrapping the `Element`.
public struct ObjectSet<Element:AnyObject> {

  @usableFromInline
  internal typealias StorageElement = ObjectWrapper<Element>

  @usableFromInline
  internal typealias Storage = Set<StorageElement>
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  init(storage: Storage) {
    self.storage = storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectSet - Equatable
// -------------------------------------------------------------------------- //

extension ObjectSet : Equatable {
  
  @inlinable
  public static func ==(
    lhs: ObjectSet<Element>,
    rhs: ObjectSet<Element>) -> Bool {
    return lhs.storage == rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectSet - Hashable
// -------------------------------------------------------------------------- //

extension ObjectSet : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectSet - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectSet : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "ObjectSet: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectSet - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectSet : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ObjectSet<\(String(reflecting: Element.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectSet - CustomReflectable
// -------------------------------------------------------------------------- //

extension ObjectSet : CustomReflectable {
  
  @inlinable
  public var customMirror: Mirror {
    get {
      return Mirror(
        self,
        children: ["storage": self.storage],
        displayStyle: .set
      )
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectSet - Codable
// -------------------------------------------------------------------------- //

extension ObjectSet : Codable where Element:Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectSet - Collection
// -------------------------------------------------------------------------- //

extension ObjectSet : Collection {
  
  public typealias Index = ObjectSetIndex<Element>
  
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
      return Index(storage: self.storage.startIndex)
    }
  }

  @inlinable
  public var endIndex: Index {
    get {
      return Index(storage: self.storage.endIndex)
    }
  }
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      return self.storage[index.storage].wrappedObject
    }
  }
  
  @inlinable
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    return self.storage.distance(
      from: start.storage,
      to: end.storage
    )
  }
  
  @inlinable
  public func index(after index: Index) -> Index {
    return Index(
      storage: self.storage.index(
        after: index.storage
      )
    )
  }

  @inlinable
  public func formIndex(after i: inout Index) {
    self.storage.formIndex(after: &i.storage)
  }

  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int) -> Index {
    return Index(
      storage: self.storage.index(
        i.storage,
        offsetBy: distance
      )
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Index,
    offsetBy distance: Int) {
    self.storage.formIndex(
      &i.storage,
      offsetBy: distance
    )
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Index? {
    return Index(
      storage: self.storage.index(
        i.storage,
        offsetBy: distance,
        limitedBy: limit.storage
      )
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Bool {
    return self.storage.formIndex(
      &i.storage,
      offsetBy: distance,
      limitedBy: limit.storage
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectSet - ExpressibleByArrayLiteral
// -------------------------------------------------------------------------- //

extension ObjectSet : ExpressibleByArrayLiteral {
  
  public typealias ArrayLiteralElement = Element
  
  @inlinable
  public init(arrayLiteral elements: ArrayLiteralElement...) {
    self.init(
      storage: Storage(
        elements.directlyMappedOnDemand() {
          StorageElement(
            wrappedObject: $0
          )
        }
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectSet - SetAlgebra
// -------------------------------------------------------------------------- //

extension ObjectSet : SetAlgebra {

  // ------------------------------------------------------------------------ //
  // MARK: Initialization
  // ------------------------------------------------------------------------ //

  @inlinable
  public init() {
    self.init(
      storage: Storage()
    )
  }
  
  @inlinable
  public init<S:Sequence>(_ elements: S) where S.Element == Element {
    self.init(
      storage: Storage(
        elements.directlyMappedOnDemand() {
          return StorageElement(
            wrappedObject: $0
          )
        }
      )
    )
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Elements
  // ------------------------------------------------------------------------ //

  @inlinable
  public func contains(_ element: Element) -> Bool {
    return self.storage.contains(
      StorageElement(wrappedObject: element)
    )
  }
  
  @inlinable
  @discardableResult
  public mutating func insert(_ element: Element) -> (inserted: Bool, memberAfterInsert: Element) {
    let result = self.storage.insert(
      StorageElement(
        wrappedObject: element
      )
    )
    return (
      inserted: result.inserted,
      memberAfterInsert: result.memberAfterInsert.wrappedObject
    )
  }
  
  @inlinable
  @discardableResult
  public mutating func update(with newMember: Element) -> Element? {
    self.storage.update(
      with: StorageElement(
        wrappedObject: newMember
      )
    )?.wrappedObject
  }
  
  @inlinable
  @discardableResult
  public mutating func remove(_ member: Element) -> Element? {
    return self.storage.remove(
      StorageElement(
        wrappedObject: member
      )
    )?.wrappedObject
  }

  // ------------------------------------------------------------------------ //
  // MARK: Union
  // ------------------------------------------------------------------------ //
  
  @inlinable
  public func union(_ other: ObjectSet<Element>) -> ObjectSet<Element> {
    return ObjectSet<Element>(
      storage: self.storage.union(other.storage)
    )
  }
  
  @inlinable
  public mutating func formUnion(_ other: ObjectSet<Element>) {
    self.storage.formUnion(other.storage)
  }

  // ------------------------------------------------------------------------ //
  // MARK: Intersection
  // ------------------------------------------------------------------------ //
  
  @inlinable
  public func intersection(_ other: ObjectSet<Element>) -> ObjectSet<Element> {
    return ObjectSet<Element>(
      storage: self.storage.intersection(other.storage)
    )
  }
  
  @inlinable
  public mutating func formIntersection(_ other: ObjectSet<Element>) {
    self.storage.formIntersection(other.storage)
  }

  // ------------------------------------------------------------------------ //
  // MARK: Symmetric Difference
  // ------------------------------------------------------------------------ //
  
  @inlinable
  public func symmetricDifference(_ other: ObjectSet<Element>) -> ObjectSet<Element> {
    return ObjectSet<Element>(
      storage: self.storage.symmetricDifference(other.storage)
    )
  }
  
  @inlinable
  public mutating func formSymmetricDifference(_ other: ObjectSet<Element>) {
    self.storage.formSymmetricDifference(other.storage)
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Subtraction
  // ------------------------------------------------------------------------ //

  @inlinable
  public func subtracting(_ other: ObjectSet<Element>) -> ObjectSet<Element> {
    return ObjectSet<Element>(
      storage: self.storage.subtracting(other.storage)
    )
  }
  
  @inlinable
  public mutating func subtract(_ other: ObjectSet<Element>) {
    self.storage.subtract(other.storage)
  }

  // ------------------------------------------------------------------------ //
  // MARK: Set Relationships
  // ------------------------------------------------------------------------ //
  
  @inlinable
  public func isDisjoint(with other: ObjectSet<Element>) -> Bool {
    return self.storage.isDisjoint(with: other.storage)
  }
  
  @inlinable
  public func isSubset(of other: ObjectSet<Element>) -> Bool {
    return self.storage.isSubset(of: other.storage)
  }

  @inlinable
  public func isSuperset(of other: ObjectSet<Element>) -> Bool {
    return self.storage.isSuperset(of: other.storage)
  }

  @inlinable
  public func isStrictSubset(of other: ObjectSet<Element>) -> Bool {
    return self.storage.isStrictSubset(of: other.storage)
  }

  @inlinable
  public func isStrictSuperset(of other: ObjectSet<Element>) -> Bool {
    return self.storage.isStrictSuperset(of: other.storage)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectSet - Set Emulation
// -------------------------------------------------------------------------- //

public extension ObjectSet {
  
  @inlinable
  init(minimumCapacity: Int) {
    self.init(
      storage: Storage(
        minimumCapacity: minimumCapacity
      )
    )
  }
  
  @inlinable
  var capacity: Int {
    get {
      return self.storage.capacity
    }
  }
  
  @inlinable
  mutating func reserveCapacity(_ capacity: Int) {
    self.storage.reserveCapacity(capacity)
  }
  
  @inlinable
  func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> ObjectSet<Element> {
    return ObjectSet<Element>(
      storage: try self.storage.filter() {
        return try isIncluded($0.wrappedObject)
      }
    )
  }
  
  @inlinable
  mutating func removeFirst() -> Element {
    return self.storage.removeFirst().wrappedObject
  }
  
  @inlinable
  mutating func popFirst() -> Element? {
    return self.storage.popFirst()?.wrappedObject
  }
  
  @inlinable
  mutating func remove(at index: Index) -> Element {
    return self.storage.remove(
      at: index.storage
    ).wrappedObject
  }
  
  @inlinable
  mutating func removeAll(keepingCapacity: Bool = false) {
    self.storage.removeAll(
      keepingCapacity: keepingCapacity
    )
  }
  
  @inlinable
  func union<S:Sequence>(_ elements: S) -> ObjectSet<Element>
    where S.Element == Element {
      return ObjectSet<Element>(
        storage: self.storage.union(
          elements.directlyMappedOnDemand() {
            return StorageElement(wrappedObject: $0)
          }
        )
      )
  }

  @inlinable
  mutating func formUnion<S:Sequence>(_ elements: S)
    where S.Element == Element {
      self.storage.formUnion(
        elements.directlyMappedOnDemand() {
          return StorageElement(wrappedObject: $0)
        }
      )
  }

  @inlinable
  func intersection<S:Sequence>(_ elements: S) -> ObjectSet<Element>
    where S.Element == Element {
      return ObjectSet<Element>(
        storage: self.storage.intersection(
          elements.directlyMappedOnDemand() {
            return StorageElement(wrappedObject: $0)
          }
        )
      )
  }

  @inlinable
  mutating func formIntersection<S:Sequence>(_ elements: S)
    where S.Element == Element {
      self.storage.formIntersection(
        elements.directlyMappedOnDemand() {
          return StorageElement(wrappedObject: $0)
        }
      )
  }

  @inlinable
  func symmetricDifference<S:Sequence>(_ elements: S) -> ObjectSet<Element>
    where S.Element == Element {
      return ObjectSet<Element>(
        storage: self.storage.symmetricDifference(
          elements.directlyMappedOnDemand() {
            return StorageElement(wrappedObject: $0)
          }
        )
      )
  }

  @inlinable
  mutating func formSymmetricDifference<S:Sequence>(_ elements: S)
    where S.Element == Element {
      self.storage.formSymmetricDifference(
        elements.directlyMappedOnDemand() {
          return StorageElement(wrappedObject: $0)
        }
      )
  }

  @inlinable
  func subtracting<S:Sequence>(_ elements: S) -> ObjectSet<Element>
    where S.Element == Element {
      return ObjectSet<Element>(
        storage: self.storage.subtracting(
          elements.directlyMappedOnDemand() {
            return StorageElement(wrappedObject: $0)
          }
        )
      )
  }

  @inlinable
  mutating func subtract<S:Sequence>(_ elements: S)
    where S.Element == Element {
    self.storage.subtract(
        elements.directlyMappedOnDemand() {
          return StorageElement(wrappedObject: $0)
        }
      )
  }
  
  @inlinable
  func isDisjoint<S:Sequence>(with other: S) -> Bool
    where S.Element == Element {
      return self.storage.isDisjoint(
        with: other.directlyMappedOnDemand() {
          return StorageElement(wrappedObject: $0)
        }
      )
  }

  @inlinable
  func isSubset<S:Sequence>(of other: S) -> Bool
    where S.Element == Element {
      return self.storage.isSubset(
        of: other.directlyMappedOnDemand() {
          return StorageElement(wrappedObject: $0)
        }
      )
  }

  @inlinable
  func isStrictSubset<S:Sequence>(of other: S) -> Bool
    where S.Element == Element {
      return self.storage.isStrictSubset(
        of: other.directlyMappedOnDemand() {
          return StorageElement(wrappedObject: $0)
        }
      )
  }

  @inlinable
  func isSuperset<S:Sequence>(of other: S) -> Bool
    where S.Element == Element {
      return self.storage.isSuperset(
        of: other.directlyMappedOnDemand() {
          return StorageElement(wrappedObject: $0)
        }
      )
  }
  
  @inlinable
  func isStrictSuperset<S:Sequence>(of other: S) -> Bool
    where S.Element == Element {
      return self.storage.isStrictSuperset(
        of: other.directlyMappedOnDemand() {
          return StorageElement(wrappedObject: $0)
        }
      )
  }
  
  @inlinable
  var first: Element? {
    get {
      return self.storage.first?.wrappedObject
    }
  }
  
  @inlinable
  func randomElement() -> Element? {
    return self.storage.randomElement()?.wrappedObject
  }

  @inlinable
  func randomElement<T>(using generator: inout T) -> Element?
    where T:RandomNumberGenerator {
      return self.storage.randomElement(
        using: &generator
      )?.wrappedObject
  }

  @inlinable
  func contains(where predicate: (Element) throws -> Bool) rethrows -> Bool {
    return try self.storage.contains(
      where: {
        return try predicate(
          $0.wrappedObject
        )
      }
    )
  }
  
  @inlinable
  func allSatisfy(_ predicate: (Element) throws -> Bool) rethrows -> Bool {
    return try self.storage.allSatisfy() {
      return try predicate(
        $0.wrappedObject
      )
    }
  }
  
  @inlinable
  func first(where predicate: (Element) throws -> Bool) rethrows -> Element? {
    return try self.storage.first(
      where: {
        return try predicate(
          $0.wrappedObject
        )
      }
    )?.wrappedObject
  }
  
  @inlinable
  func firstIndex(of element: Element) -> Index? {
    return Index(
      storage: self.storage.firstIndex(
        of: StorageElement(
          wrappedObject: element
        )
      )
    )
  }

  @inlinable
  func firstIndex(where predicate: (Element) throws -> Bool) rethrows -> Index? {
    return Index(
      storage: try self.storage.firstIndex(
        where: {
          return try predicate(
            $0.wrappedObject
          )
        }
      )
    )
  }
  
  @inlinable
  @warn_unqualified_access
  func min(
    by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> Element? {
    return try self.storage.min(
      by: {
        (lhs: StorageElement, rhs: StorageElement) -> Bool
        in
        return try areInIncreasingOrder(
          lhs.wrappedObject,
          rhs.wrappedObject
        )
      }
    )?.wrappedObject
  }

  @inlinable
  @warn_unqualified_access
  func max(
    by areInDescendingOrder: (Element, Element) throws -> Bool) rethrows -> Element? {
    return try self.storage.max(
      by: {
        (lhs: StorageElement, rhs: StorageElement) -> Bool
        in
        return try areInDescendingOrder(
          lhs.wrappedObject,
          rhs.wrappedObject
        )
      }
    )?.wrappedObject
  }
  
  @inlinable
  func map<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
    return try self.storage.map() {
      return try transform($0.wrappedObject)
    }
  }
  
  @inlinable
  func forEach(_ body: (Element) throws -> Void) rethrows {
    try self.storage.forEach() {
      try body($0.wrappedObject)
    }
  }
  
  /// - todo: Verify this is safe (lol)
  @inlinable
  func withContiguousStorageIfAvailable<R>(
    _ body: (UnsafeBufferPointer<Element>) throws -> R) rethrows -> R? {
    return try self.storage.withContiguousStorageIfAvailable() {
      (storagePointer: UnsafeBufferPointer<StorageElement>) -> R
      in
      return try storagePointer.withMemoryRebound(to: Element.self) {
        (elementPointer: UnsafeBufferPointer<Element>) -> R
        in
        return try body(elementPointer)
      }
    }
  }

}


// -------------------------------------------------------------------------- //
// MARK: ObjectSetIndex - Definition
// -------------------------------------------------------------------------- //

public struct ObjectSetIndex<Element:AnyObject> {
  
  @usableFromInline
  internal typealias Storage = ObjectSet<Element>.Storage.Index
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }

  @inlinable
  internal init?(storage: Storage?) {
    guard let concreteStorage = storage else {
      return nil
    }
    self.init(
      storage: concreteStorage
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectSetIndex - Equatable
// -------------------------------------------------------------------------- //

extension ObjectSetIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: ObjectSetIndex<Element>,
    rhs: ObjectSetIndex<Element>) -> Bool {
    return lhs.storage == rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectSetIndex - Comparable
// -------------------------------------------------------------------------- //

extension ObjectSetIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: ObjectSetIndex<Element>,
    rhs: ObjectSetIndex<Element>) -> Bool {
    return lhs.storage < rhs.storage
  }

  @inlinable
  public static func >(
    lhs: ObjectSetIndex<Element>,
    rhs: ObjectSetIndex<Element>) -> Bool {
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: ObjectSetIndex<Element>,
    rhs: ObjectSetIndex<Element>) -> Bool {
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: ObjectSetIndex<Element>,
    rhs: ObjectSetIndex<Element>) -> Bool {
    return lhs.storage <= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectSetIndex - Hashable
// -------------------------------------------------------------------------- //

extension ObjectSetIndex : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectSetIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectSetIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "ObjectSetIndex: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectSetIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectSetIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ObjectSetIndex<\(String(reflecting: Element.self))>(storage: \(String(describing: self.storage)))"
    }
  }
  
}
