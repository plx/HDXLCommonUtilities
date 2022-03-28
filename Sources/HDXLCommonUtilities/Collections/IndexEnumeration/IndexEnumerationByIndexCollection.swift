//
//  IndexEnumerationByIndexCollection.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIndexCollection - Definition
// -------------------------------------------------------------------------- //

/// Implementation of a collection that yields `(index,element)` pairs from an
/// underlying source collection. Use with discretion, as this functionality is
/// both (a) *extremely* convenient in some cases and also (b) *usually* an anti-pattern.
///
/// This performs iteration by advancing the index and subscripting the source
/// collection to get the element (e.g. using the system-library's default iterator).
/// This is the right choice for *most* collections.
///
/// - seealso: `IndexEnumerationByIteratorCollection`
///
@frozen
public struct IndexEnumerationByIndexCollection<Source:Collection> {
  
  @usableFromInline
  internal let source: Source
  
  @inlinable
  internal init(source: Source) {
    self.source = source
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIndexCollection - Equatable
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIndexCollection : Equatable where Source : Equatable {
  
  @inlinable
  public static func ==(
    lhs: IndexEnumerationByIndexCollection<Source>,
    rhs: IndexEnumerationByIndexCollection<Source>) -> Bool {
    return lhs.source == rhs.source
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIndexCollection - Comparable
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIndexCollection : Comparable where Source : Comparable {
  
  @inlinable
  public static func <(
    lhs: IndexEnumerationByIndexCollection<Source>,
    rhs: IndexEnumerationByIndexCollection<Source>) -> Bool {
    return lhs.source < rhs.source
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIndexCollection - Hashable
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIndexCollection : Hashable where Source : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.source.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIndexCollection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIndexCollection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "index-enumeration of \(String(describing: self.source))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIndexCollection - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIndexCollection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "IndexEnumerationByIndexCollection<\(String(reflecting: Source.self))>(source: \(String(reflecting: self.source)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIndexCollection - Codable
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIndexCollection : Codable where Source : Codable {
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexEnumerationByIndexCollection - Collection
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIndexCollection : Collection  {
  
  public typealias Index = Source.Index
  public typealias Indices = Source.Indices
  public typealias SubSequence = IndexEnumerationByIndexCollection<Source.SubSequence>
  public typealias Element = (Source.Index, Source.Element)
  
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
    get {
      return SubSequence(source: self.source[indexRange])
    }
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
// MARK: IndexEnumerationByIndexCollection - BidirectionalCollection
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIndexCollection : BidirectionalCollection where Source : BidirectionalCollection {
  
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
// MARK: IndexEnumerationByIndexCollection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension IndexEnumerationByIndexCollection : RandomAccessCollection where Source:RandomAccessCollection {
  
}

