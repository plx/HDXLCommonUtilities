//
//  IndicesCollection.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: IndicesCollection - Definition
// -------------------------------------------------------------------------- //

/// This is a work-alike for `DefaultIndices` with one change: it calculates-and-caches the count.
/// For some reason (a) `DefaultIndices` doesn't do this and (b) `DefaultIndices` *also* doesn't
/// forward `distance(from:to:)` to the underlying collection it wraps. The consequence, here, is that
/// in many cases `DefaultIndices` will devolve to `count` and `distance(from:to:)` being
/// `O(n)` operations, which may be fine for "real-life use" but has been contributing to making my
/// exhaustive-validation tests unusably-slow.
///
/// I don't fully understand why Apple doesn't just forward the `distance(from:to:)` call. I can see *half*
/// the logic being "for cases where `Index == Int` we have fast default implementations", but that isn't
/// a full justification even at face value. If there's more supporting logic here I'm not seeing it.
///
/// In any case, I based my understanding of what `DefaultIndices` does based on the then-current
/// revision of [Indices.swift](https://github.com/apple/swift/blob/master/stdlib/public/core/Indices.swift),
/// which was current [as-of this commit](https://github.com/apple/swift/commit/e9d4687e31a3ae8e90604d3b15bf8b241479c211#diff-796e79486a95a415a6ea5eeb36dc4948).
///
public struct IndicesCollection<Elements:Collection> {
  
  @usableFromInline
  internal let _elements: Elements
  
  @usableFromInline
  internal let _startIndex: Elements.Index
  
  @usableFromInline
  internal let _endIndex: Elements.Index
  
  @usableFromInline
  internal let _count: Int
  
  @inlinable
  internal init(
    elements: Elements,
    startIndex: Elements.Index,
    endIndex: Elements.Index,
    count: Int) {
    self._elements = elements
    self._startIndex = startIndex
    self._endIndex = endIndex
    self._count = count
  }
  
  @inlinable
  public init(elements: Elements) {
    self.init(
      elements: elements,
      startIndex: elements.startIndex,
      endIndex: elements.endIndex,
      count: elements.count
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndicesCollection - Validatable
// -------------------------------------------------------------------------- //

extension IndicesCollection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        self._count >= 0,
        self._count <= self._elements.count,
        self._elements.startIndex <= self._startIndex,
        self._endIndex <= self._elements.endIndex,
        self._startIndex <= self._endIndex,
        self._count == self._elements.distance(
          from: self._startIndex,
          to: self._endIndex) else {
            return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndicesCollection - Collection
// -------------------------------------------------------------------------- //

extension IndicesCollection : Collection {
  
  public typealias Index = Elements.Index
  public typealias Element = Index
  
  public typealias Indices = IndicesCollection<Elements>
  public typealias SubSequence = IndicesCollection<Elements>

  @inlinable
  public var indices: Indices {
    get {
      return self
    }
  }
  
  @inlinable
  public var startIndex: Index {
    get {
      return self._startIndex
    }
  }

  @inlinable
  public var endIndex: Index {
    get {
      return self._endIndex
    }
  }

  @inlinable
  public var isEmpty: Bool {
    get {
      return self.startIndex == self.endIndex
    }
  }
  
  @inlinable
  public var count: Int {
    get {
      return self._count
    }
  }

  @inlinable
  public subscript(index: Index) -> Element {
    get {
      return index
    }
  }
  
  @inlinable
  public subscript(bounds: Range<Index>) -> SubSequence {
    return SubSequence(
      elements: self._elements,
      startIndex: bounds.lowerBound,
      endIndex: bounds.upperBound,
      count: self._elements.distance(
        from: bounds.lowerBound,
        to: bounds.upperBound
      )
    )
  }
  
  @inlinable
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    return self._elements.distance(
      from: start,
      to: end
    )
  }
  
  @inlinable
  public func index(after i: Index) -> Index {
    return self._elements.index(after: i)
  }

  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int) -> Index {
    return self._elements.index(
      i,
      offsetBy: distance
    )
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Index? {
    return self._elements.index(
      i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
  @inlinable
  public func formIndex(after i: inout Index) {
    self._elements.formIndex(after: &i)
  }

  @inlinable
  public func formIndex(
    _ i: inout Elements.Index,
    offsetBy distance: Int) {
    return self._elements.formIndex(
      &i,
      offsetBy: distance
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Bool {
    self._elements.formIndex(
      &i,
      offsetBy: distance,
      limitedBy: limit
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: IndicesCollection - BidirectionalCollection
// -------------------------------------------------------------------------- //

extension IndicesCollection : BidirectionalCollection where Elements:BidirectionalCollection {
  
  @inlinable
  public func index(before i: Index) -> Index {
    return self._elements.index(
      before: i
    )
  }
  
  @inlinable
  public func formIndex(before i: inout Index) {
    self._elements.formIndex(before: &i)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndicesCollection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension IndicesCollection : RandomAccessCollection where Elements:RandomAccessCollection {
  
}

