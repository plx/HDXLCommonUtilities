//
//  IndexEnumerationByIterator.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIteratorCollection - Definition
// -------------------------------------------------------------------------- //

/// Implementation of a collection that yields `(index,element)` pairs from an
/// underlying source collection. Use with discretion, as this functionality is
/// both (a) *extremely* convenient in some cases and also (b) *usually* an anti-pattern.
///
/// This implementation iterates elements via the wrapped collection's `Iterator`,
/// (while independently stepping through the indices). This approach is beneficial
/// mostly in exotic scenarios, but where it's beneficial it can be very beneficial.
///
/// - seealso: `IndexEnumerationByIndexCollection`
///
@frozen
public struct IndexEnumerationByIteratorCollection<Source:Collection> {
  
  @usableFromInline
  internal let source: Source
  
  @inlinable
  internal init(source: Source) {
    self.source = source
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIteratorCollection - Equatable
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIteratorCollection : Equatable where Source : Equatable {
  
  @inlinable
  public static func ==(
    lhs: IndexEnumerationByIteratorCollection<Source>,
    rhs: IndexEnumerationByIteratorCollection<Source>) -> Bool {
    return lhs.source == rhs.source
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIteratorCollection - Comparable
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIteratorCollection : Comparable where Source : Comparable {
  
  @inlinable
  public static func <(
    lhs: IndexEnumerationByIteratorCollection<Source>,
    rhs: IndexEnumerationByIteratorCollection<Source>) -> Bool {
    return lhs.source < rhs.source
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIteratorCollection - Hashable
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIteratorCollection : Hashable where Source : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.source.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIteratorCollection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIteratorCollection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "index-enumeration-by-iterator of \(String(describing: self.source))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIteratorCollection - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIteratorCollection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "IndexEnumerationByIteratorCollection<\(String(reflecting: Source.self))>(source: \(String(reflecting: self.source)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIteratorCollection - Codable
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIteratorCollection : Codable where Source : Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIteratorCollection - Collection
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIteratorCollection : Collection  {
  
  public typealias Index = Source.Index
  public typealias Indices = Source.Indices
  public typealias Iterator = IndexEnumerationByIteratorCollectionIterator<Source>
  public typealias SubSequence = IndexEnumerationByIteratorCollection<Source.SubSequence>
  public typealias Element = (Source.Index, Source.Element)
  
  @inlinable
  public func makeIterator() -> Iterator {
    return Iterator(source: self.source)
  }
  
  @inlinable
  public var indices: Indices {
    get {
      return self.source.indices
    }
  }
  
  @inlinable
  public var isEmpty: Bool {
    get {
      return self.source.isEmpty
    }
  }
  
  @inlinable
  public var count: Int {
    return self.source.count
  }
  
  @inlinable
  public var startIndex: Index {
    get {
      return self.source.startIndex
    }
  }
  
  @inlinable
  public var endIndex: Index {
    get {
      return self.source.endIndex
    }
  }
  
  @inlinable
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    return self.source.distance(
      from: start,
      to: end
    )
  }
  
  @inlinable
  public subscript(position: Index) -> Element {
    get {
      precondition(position != self.endIndex)
      return (position,self.source[position])
    }
  }
  
  @inlinable
  public subscript(indexRange: Range<Index>) -> SubSequence {
      return SubSequence(
        source: self.source[indexRange]
      )
  }
  
  @inlinable
  public func index(after i: Index) -> Index {
    return self.source.index(after: i)
  }
  
  @inlinable
  public func formIndex(after i: inout Index) {
    self.source.formIndex(after: &i)
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int) -> Index {
    return self.source.index(
      i,
      offsetBy: distance
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Index,
    offsetBy distance: Int) {
    self.source.formIndex(
      &i,
      offsetBy: distance
    )
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Index? {
    return self.source.index(
      i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Source.Index,
    offsetBy distance: Int,
    limitedBy limit: Source.Index) -> Bool {
    return self.source.formIndex(
      &i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIteratorCollection - BidirectionalCollection
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIteratorCollection : BidirectionalCollection where Source : BidirectionalCollection {
  
  @inlinable
  public func index(before i: Index) -> Index {
    return self.source.index(before: i)
  }
  
  @inlinable
  public func formIndex(before i: inout Source.Index) {
    self.source.formIndex(before: &i)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIteratorCollection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIteratorCollection : RandomAccessCollection where Source:RandomAccessCollection {
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIteratorCollectionIterator - Iterator
// -------------------------------------------------------------------------- //

@frozen
public struct IndexEnumerationByIteratorCollectionIterator<Source:Collection> : IteratorProtocol {
  
  public typealias Element = (Source.Index, Source.Element)
  
  @usableFromInline
  internal let source: Source
  
  @usableFromInline
  internal var index: Source.Index
  
  @usableFromInline
  internal var iterator: Source.Iterator
  
  @inlinable
  internal init(source: Source) {
    self.source = source
    self.index = source.startIndex
    self.iterator = source.makeIterator()
  }
  
  @inlinable
  public mutating func next() -> (Source.Index, Source.Element)? {
    guard let thisElement = self.iterator.next() else {
      return nil
    }
    let thisIndex = self.index
    self.source.formIndex(after: &self.index)
    return (thisIndex,thisElement)
  }
  
}
