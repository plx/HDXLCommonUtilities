//
//  OnDemandDirectMap.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Sequence - OnDemandDirectMap
// -------------------------------------------------------------------------- //

public extension Sequence {
  
  /// A collection with the elements of `self` as-mapped by `mapping`.
  ///
  /// - parameter mapping: The mapping to apply to get this "mapped view" of `self`.
  ///
  /// - precondition: `mapping` must be pure, in the sense that same input == same input. Should probably also be efficient (b/c we don't cache the mapping results).
  ///
  @inlinable
  func directlyMappedOnDemand<T>(using mapping: @escaping (Element) -> T) -> OnDemandDirectMap<Self,T> {
    return OnDemandDirectMap<Self,T>(
      base: self,
      mapping: mapping
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: OnDemandDirectMap - Definition
// -------------------------------------------------------------------------- //

/// This is a "mapped container" in the sense that the elements are the results of applying`mapping` to each
/// element in `base`. It differs from the built-in `lazy.map()`, etc., in that that AIUI has to allocate storage
/// so it can cache the mapped values...it's trying to maintain consistency upon (re-)iteration, (re-)access, and
/// so on and so forth.
///
/// This just applies the map and *trusts* that you've supplied a `mapping` that's (a) efficient (b/c it'll get
/// evaluated over-and-over, at least potentially) and (b) "pure" (in the sense that same input == same output).
///
/// If you don't, well, it's on you, and you already have `lazy.map()` so why not just use that instead?
public struct OnDemandDirectMap<Base:Sequence,Element> {
  
  @usableFromInline
  internal let base: Base
  
  @usableFromInline
  internal let mapping: (Base.Element) -> Element
  
  @inlinable
  internal init(base: Base, mapping: @escaping (Base.Element) -> Element) {
    self.base = base
    self.mapping = mapping
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: OnDemandDirectMap - Sequence
// -------------------------------------------------------------------------- //

extension OnDemandDirectMap : Sequence {
  
  public typealias Iterator = OnDemandDirectMapIterator<Base,Element>
  
  @inlinable
  public var underestimatedCount: Int {
    get {
      return self.base.underestimatedCount
    }
  }
  
  @inlinable
  public func makeIterator() -> Iterator {
    return Iterator(source: self)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: OnDemandDirectMapIterator - Definition
// -------------------------------------------------------------------------- //

public struct OnDemandDirectMapIterator<Base:Sequence,Element> : IteratorProtocol {
  
  @usableFromInline
  internal typealias Source = OnDemandDirectMap<Base,Element>
  
  @usableFromInline
  internal typealias BaseIterator = Base.Iterator
  
  @usableFromInline
  var baseIterator: BaseIterator
  
  @usableFromInline
  let mapping: (BaseIterator.Element) -> Element
  
  @inlinable
  internal init(source: Source) {
    self.baseIterator = source.base.makeIterator()
    self.mapping = source.mapping
  }
  
  @inlinable
  public mutating func next() -> Element? {
    guard let nextBaseElement = self.baseIterator.next() else {
      return nil
    }
    return self.mapping(nextBaseElement)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: OnDemandDirectMap - Collection
// -------------------------------------------------------------------------- //

extension OnDemandDirectMap : Collection where Base:Collection {
  
  public typealias Index = Base.Index
  public typealias Indices = Base.Indices
  public typealias SubSequence = OnDemandDirectMap<Base.SubSequence,Element>

  @inlinable
  public var isEmpty: Bool {
    get {
      return self.base.isEmpty
    }
  }
  
  @inlinable
  public var count: Int {
    get {
      return self.base.count
    }
  }
  
  @inlinable
  public var startIndex: Index {
    get {
      return self.base.startIndex
    }
  }

  @inlinable
  public var endIndex: Base.Index {
    get {
      return self.base.endIndex
    }
  }
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      return self.mapping(self.base[index])
    }
  }
  
  @inlinable
  public subscript<R>(r: R) -> SubSequence
    where R : RangeExpression, Index == R.Bound {
    return SubSequence(
      base: self.base[r],
      mapping: self.mapping
    )
  }
  
  @inlinable
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    return self.base.distance(
      from: start,
      to: end
    )
  }
  
  @inlinable
  public var indices: Indices {
    get {
      return self.base.indices
    }
  }
  
  @inlinable
  public func index(after i: Index) -> Index {
    return self.base.index(
      after: i
    )
  }
  
  @inlinable
  public func formIndex(after i: inout Index) {
    self.base.formIndex(after: &i)
  }

  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int) -> Index {
    return self.base.index(
      i,
      offsetBy: distance
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Base.Index,
    offsetBy distance: Int) {
    self.base.formIndex(
      &i,
      offsetBy: distance
    )
  }

  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Index? {
    return self.base.index(
      i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Bool {
    return self.base.formIndex(
      &i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: OnDemandDirectMap - BidirectionalCollection
// -------------------------------------------------------------------------- //

extension OnDemandDirectMap : BidirectionalCollection where Base:BidirectionalCollection {
  
  @inlinable
  public func index(before i: Index) -> Index {
    return self.base.index(before: i)
  }
  
  @inlinable
  public func formIndex(before i: inout Index) {
    self.base.formIndex(before: &i)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: OnDemandDirectMap - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension OnDemandDirectMap : RandomAccessCollection where Base:RandomAccessCollection {
  
}
