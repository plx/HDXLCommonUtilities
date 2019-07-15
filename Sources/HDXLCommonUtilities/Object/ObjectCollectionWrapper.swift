//
//  ObjectCollectionWrapper.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - Definition
// -------------------------------------------------------------------------- //

/// General-purpose collection-transformer that presents a "collection of `ObjectWrapper<Element>`"
/// as-if it were a collection of `Element`; it includes conditional conformances for various more-specialized
/// collections (e.g. `BidirectionalCollection`, `MutableCollection`, `SetAlgebra`) and
/// will grow over time to include more-efficient overrides for other methods on an as-needed basis.
///
/// When possible it's *probably* preferable to use `ObjectSet` instead (it has a slightly richer API and is
/// likely to be slightly-more-efficient on a few things). Note, further, that you currently *must* use the various
/// `ObjectDictionary` types when you want dictionary semantics, b/c at present it's the missing piece:
///
/// - `Set` and `SetAlgebra` exist
/// - `Array` and `RangeReplaceableCollection` exist
/// - `Dictionary` exists, but `AssociativeCollection` (etc.) *does not exist*
///
/// ...and so on and so forth. The reason this type *really* exists is thus to avoid a combinatorial explosion
/// of all possible concrete combinations of "object collections", but it's still better to use the more-concrete types
/// whenever you possibly can.
public struct ObjectCollectionWrapper<Element,WrappedCollection>
  where
  Element:AnyObject,
  WrappedCollection:Collection,
  WrappedCollection.Element == ObjectWrapper<Element> {
  
  @usableFromInline
  internal typealias WrappedElement = WrappedCollection.Element

  public var wrappedCollection: WrappedCollection
  
  @inlinable
  public init(wrappedCollection: WrappedCollection) {
    self.wrappedCollection = wrappedCollection
  }

  @inlinable
  public init?(wrappedCollection: WrappedCollection?) {
    guard let concreteWrappedCollection = wrappedCollection else {
      return nil
    }
    self.init(
      wrappedCollection: concreteWrappedCollection
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - Support
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapper {
  
  @usableFromInline
  internal func wrappedElements<S>(from elements: S) -> OnDemandDirectMap<S,WrappedElement>
    where S:Sequence, S.Element == Element {
    return elements.directlyMappedOnDemand() {
      return WrappedElement(wrappedObject: $0)
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - Equatable
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapper : Equatable where WrappedCollection:Equatable {
  
  @inlinable
  public static func ==(
    lhs: ObjectCollectionWrapper<Element,WrappedCollection>,
    rhs: ObjectCollectionWrapper<Element,WrappedCollection>) -> Bool {
    return lhs.wrappedCollection == rhs.wrappedCollection
  }

  @inlinable
  public static func !=(
    lhs: ObjectCollectionWrapper<Element,WrappedCollection>,
    rhs: ObjectCollectionWrapper<Element,WrappedCollection>) -> Bool {
    return lhs.wrappedCollection != rhs.wrappedCollection
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - Hashable
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapper : Hashable where WrappedCollection:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.wrappedCollection.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapper : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "ObjectCollectionWrapper: \(String(describing: self.wrappedCollection))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapper : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ObjectCollectionWrapper<\(String(reflecting: Element.self)), \(String(reflecting: WrappedCollection.self))>(wrappedCollection: \(String(reflecting: self.wrappedCollection)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - Codable
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapper : Codable where WrappedCollection:Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - Collection
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapper : Collection {
  
  public typealias Index = ObjectCollectionWrapperIndex<Element,WrappedCollection>
  
  @inlinable
  public var isEmpty: Bool {
    get {
      return self.wrappedCollection.isEmpty
    }
  }
  
  @inlinable
  public var count: Int {
    get {
      return self.wrappedCollection.count
    }
  }
  
  @inlinable
  public var startIndex: Index {
    get {
      return Index(storage: self.wrappedCollection.startIndex)
    }
  }
  
  @inlinable
  public var endIndex: Index {
    get {
      return Index(storage: self.wrappedCollection.endIndex)
    }
  }
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      return self.wrappedCollection[index.storage].wrappedObject
    }
  }
  
  @inlinable
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    return self.wrappedCollection.distance(
      from: start.storage,
      to: end.storage
    )
  }
  
  @inlinable
  public func index(after index: Index) -> Index {
    return Index(
      storage: self.wrappedCollection.index(
        after: index.storage
      )
    )
  }
  
  @inlinable
  public func formIndex(after i: inout Index) {
    self.wrappedCollection.formIndex(after: &i.storage)
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int) -> Index {
    return Index(
      storage: self.wrappedCollection.index(
        i.storage,
        offsetBy: distance
      )
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Index,
    offsetBy distance: Int) {
    self.wrappedCollection.formIndex(
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
      storage: self.wrappedCollection.index(
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
    return self.wrappedCollection.formIndex(
      &i.storage,
      offsetBy: distance,
      limitedBy: limit.storage
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - MutableCollection
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapper : MutableCollection where WrappedCollection:MutableCollection {
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      return self.wrappedCollection[index.storage].wrappedObject
    }
    set {
      self.wrappedCollection[index.storage] = WrappedElement(
        wrappedObject: newValue
      )
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - BidirectionalCollection
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapper : BidirectionalCollection where WrappedCollection:BidirectionalCollection {
  
  @inlinable
  public func index(before index: Index) -> Index {
    return Index(
      storage: self.wrappedCollection.index(
        before: index.storage
      )
    )
  }
  
  @inlinable
  public func formIndex(before index: inout Index) {
    self.wrappedCollection.formIndex(
      before: &index.storage
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapper : RandomAccessCollection where WrappedCollection:RandomAccessCollection {
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - RangeReplaceableCollection
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapper : RangeReplaceableCollection where WrappedCollection:RangeReplaceableCollection {
  
  @inlinable
  public init() {
    self.init(
      wrappedCollection: WrappedCollection()
    )
  }

  @inlinable
  public mutating func replaceSubrange<C>(
    _ subrange: Range<Index>,
    with newElements: C) where C : Collection, Element == C.Element {
    self.wrappedCollection.replaceSubrange(
      (subrange.lowerBound.storage ..< subrange.upperBound.storage),
      with: self.wrappedElements(from: newElements)
    )
  }

  @inlinable
  public mutating func reserveCapacity(_ n: Int) {
    self.wrappedCollection.reserveCapacity(n)
  }
  
  @inlinable
  public init(
    repeating repeatedValue: Element,
    count: Int) {
    self.init(
      wrappedCollection: WrappedCollection(
        repeating: WrappedElement(
          wrappedObject: repeatedValue
        ),
        count: count
      )
    )
  }

  @inlinable
  public init<S>(_ elements: S)
    where S:Sequence, Element == S.Element {
    self.init(
      wrappedCollection: WrappedCollection(
        elements.directlyMappedOnDemand() {
          return WrappedElement(
            wrappedObject: $0
          )
        }
      )
    )
  }

  @inlinable
  public mutating func append(_ newElement: Element) {
    self.wrappedCollection.append(
      WrappedElement(
        wrappedObject: newElement
      )
    )
  }

  @inlinable
  public mutating func append<S>(contentsOf newElements: S)
    where S:Sequence, Element == S.Element {
    self.wrappedCollection.append(
      contentsOf: self.wrappedElements(
        from: newElements
      )
    )
  }

  @inlinable
  public mutating func insert(
    _ newElement: Element,
    at i: Index) {
    self.wrappedCollection.insert(
      WrappedElement(
        wrappedObject: newElement
      ),
      at: i.storage
    )
  }

  @inlinable
  public mutating func insert<S>(
    contentsOf newElements: S,
    at i: Self.Index)
    where S:Collection, Element == S.Element {
      self.wrappedCollection.append(
        contentsOf: self.wrappedElements(
          from: newElements
        )
      )
  }
  

  @inlinable
  @discardableResult
  public mutating func remove(at i: Index) -> Element {
    return self.wrappedCollection.remove(
      at: i.storage
    ).wrappedObject
  }

  @inlinable
  public mutating func removeSubrange(_ bounds: Range<Index>) {
    self.wrappedCollection.removeSubrange(
      (bounds.lowerBound.storage ..< bounds.upperBound.storage)
    )
  }

  @inlinable
  @discardableResult
  public mutating func removeFirst() -> Self.Element {
    return self.wrappedCollection.removeFirst().wrappedObject
  }

  @inlinable
  public mutating func removeFirst(_ k: Int) {
    self.wrappedCollection.removeFirst(k)
  }
  

  @inlinable
  public mutating func removeAll(keepingCapacity keepCapacity: Bool = false) {
    self.wrappedCollection.removeAll(keepingCapacity: keepCapacity)
  }

  @inlinable
  public mutating func removeAll(where shouldBeRemoved: (Self.Element) throws -> Bool) rethrows {
    try self.wrappedCollection.removeAll(
      where: {
        (wrappedElement: WrappedElement) -> Bool
        in
        return try shouldBeRemoved(
          wrappedElement.wrappedObject
        )
      }
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - SetAlgebra
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapper : ExpressibleByArrayLiteral, SetAlgebra where WrappedCollection:SetAlgebra {

  // ------------------------------------------------------------------------ //
  // MARK: ExpressibleByArrayLiteral
  // ------------------------------------------------------------------------ //

  public typealias ArrayLiteralElement = Element
  
  @inlinable
  public init(arrayLiteral elements: ArrayLiteralElement...) {
    self.init(
      wrappedCollection: WrappedCollection(
        elements.directlyMappedOnDemand() {
          return WrappedElement(
            wrappedObject: $0
          )
        }
      )
    )
  }

  // ------------------------------------------------------------------------ //
  // MARK: Initialization
  // ------------------------------------------------------------------------ //
  
  @inlinable
  public init() {
    self.init(
      wrappedCollection: WrappedCollection()
    )
  }
  
  @inlinable
  public init<S:Sequence>(_ elements: S) where S.Element == Element {
    self.init(
      wrappedCollection: WrappedCollection(
        elements.directlyMappedOnDemand() {
          return WrappedElement(
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
    return self.wrappedCollection.contains(
      WrappedElement(wrappedObject: element)
    )
  }
  
  @inlinable
  @discardableResult
  public mutating func insert(_ element: Element) -> (inserted: Bool, memberAfterInsert: Element) {
    let result = self.wrappedCollection.insert(
      WrappedElement(
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
    self.wrappedCollection.update(
      with: WrappedElement(
        wrappedObject: newMember
      )
      )?.wrappedObject
  }
  
  @inlinable
  @discardableResult
  public mutating func remove(_ member: Element) -> Element? {
    return self.wrappedCollection.remove(
      WrappedElement(
        wrappedObject: member
      )
      )?.wrappedObject
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Union
  // ------------------------------------------------------------------------ //
  
  @inlinable
  public func union(_ other: ObjectCollectionWrapper<Element,WrappedCollection>) -> ObjectCollectionWrapper<Element,WrappedCollection> {
    return ObjectCollectionWrapper<Element,WrappedCollection>(
      wrappedCollection: self.wrappedCollection.union(other.wrappedCollection)
    )
  }
  
  @inlinable
  public mutating func formUnion(_ other: ObjectCollectionWrapper<Element,WrappedCollection>) {
    self.wrappedCollection.formUnion(other.wrappedCollection)
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Intersection
  // ------------------------------------------------------------------------ //
  
  @inlinable
  public func intersection(_ other: ObjectCollectionWrapper<Element,WrappedCollection>) -> ObjectCollectionWrapper<Element,WrappedCollection> {
    return ObjectCollectionWrapper<Element,WrappedCollection>(
      wrappedCollection: self.wrappedCollection.intersection(other.wrappedCollection)
    )
  }
  
  @inlinable
  public mutating func formIntersection(_ other: ObjectCollectionWrapper<Element,WrappedCollection>) {
    self.wrappedCollection.formIntersection(other.wrappedCollection)
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Symmetric Difference
  // ------------------------------------------------------------------------ //
  
  @inlinable
  public func symmetricDifference(_ other: ObjectCollectionWrapper<Element,WrappedCollection>) -> ObjectCollectionWrapper<Element,WrappedCollection> {
    return ObjectCollectionWrapper<Element,WrappedCollection>(
      wrappedCollection: self.wrappedCollection.symmetricDifference(other.wrappedCollection)
    )
  }
  
  @inlinable
  public mutating func formSymmetricDifference(_ other: ObjectCollectionWrapper<Element,WrappedCollection>) {
    self.wrappedCollection.formSymmetricDifference(other.wrappedCollection)
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Subtraction
  // ------------------------------------------------------------------------ //
  
  @inlinable
  public func subtracting(_ other: ObjectCollectionWrapper<Element,WrappedCollection>) -> ObjectCollectionWrapper<Element,WrappedCollection> {
    return ObjectCollectionWrapper<Element,WrappedCollection>(
      wrappedCollection: self.wrappedCollection.subtracting(other.wrappedCollection)
    )
  }
  
  @inlinable
  public mutating func subtract(_ other: ObjectCollectionWrapper<Element,WrappedCollection>) {
    self.wrappedCollection.subtract(other.wrappedCollection)
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Set Relationships
  // ------------------------------------------------------------------------ //
  
  @inlinable
  public func isDisjoint(with other: ObjectCollectionWrapper<Element,WrappedCollection>) -> Bool {
    return self.wrappedCollection.isDisjoint(with: other.wrappedCollection)
  }
  
  @inlinable
  public func isSubset(of other: ObjectCollectionWrapper<Element,WrappedCollection>) -> Bool {
    return self.wrappedCollection.isSubset(of: other.wrappedCollection)
  }
  
  @inlinable
  public func isSuperset(of other: ObjectCollectionWrapper<Element,WrappedCollection>) -> Bool {
    return self.wrappedCollection.isSuperset(of: other.wrappedCollection)
  }
  
  @inlinable
  public func isStrictSubset(of other: ObjectCollectionWrapper<Element,WrappedCollection>) -> Bool {
    return self.wrappedCollection.isStrictSubset(of: other.wrappedCollection)
  }
  
  @inlinable
  public func isStrictSuperset(of other: ObjectCollectionWrapper<Element,WrappedCollection>) -> Bool {
    return self.wrappedCollection.isStrictSuperset(of: other.wrappedCollection)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapper - RangeReplaceableCollection & SetAlgebra
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapper where WrappedCollection:RangeReplaceableCollection, WrappedCollection:SetAlgebra {
  
  @inlinable
  public init() {
    self.init(
      wrappedCollection: WrappedCollection()
    )
  }
  
}


// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapperIndex - Definition
// -------------------------------------------------------------------------- //

public struct ObjectCollectionWrapperIndex<Element,WrappedCollection>
  where
  Element:AnyObject,
  WrappedCollection:Collection,
  WrappedCollection.Element == ObjectWrapper<Element> {
  
  @usableFromInline
  internal typealias Storage = WrappedCollection.Index
  
  @usableFromInline
  internal var storage: Storage
  
  @usableFromInline
  internal init(storage: Storage) {
    self.storage = storage
  }

  @usableFromInline
  internal init?(storage: Storage?) {
    guard let concreteStorage = storage else {
      return nil
    }
    self.init(storage: concreteStorage)
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapperIndex - Equatable
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapperIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: ObjectCollectionWrapperIndex<Element,WrappedCollection>,
    rhs: ObjectCollectionWrapperIndex<Element,WrappedCollection>) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: ObjectCollectionWrapperIndex<Element,WrappedCollection>,
    rhs: ObjectCollectionWrapperIndex<Element,WrappedCollection>) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapperIndex - Comparable
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapperIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: ObjectCollectionWrapperIndex<Element,WrappedCollection>,
    rhs: ObjectCollectionWrapperIndex<Element,WrappedCollection>) -> Bool {
    return lhs.storage < rhs.storage
  }
  
  @inlinable
  public static func >(
    lhs: ObjectCollectionWrapperIndex<Element,WrappedCollection>,
    rhs: ObjectCollectionWrapperIndex<Element,WrappedCollection>) -> Bool {
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: ObjectCollectionWrapperIndex<Element,WrappedCollection>,
    rhs: ObjectCollectionWrapperIndex<Element,WrappedCollection>) -> Bool {
    return lhs.storage <= rhs.storage
  }
  
  @inlinable
  public static func >=(
    lhs: ObjectCollectionWrapperIndex<Element,WrappedCollection>,
    rhs: ObjectCollectionWrapperIndex<Element,WrappedCollection>) -> Bool {
    return lhs.storage <= rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapperIndex - Hashable
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapperIndex : Hashable where WrappedCollection.Index:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapperIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapperIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "ObjectCollectionWrapperIndex: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectCollectionWrapperIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectCollectionWrapperIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ObjectCollectionWrapperIndex<\(String(reflecting: Element.self)), \(String(reflecting: WrappedCollection.self))>(storage: \(String(describing: self.storage)))"
    }
  }
  
}

