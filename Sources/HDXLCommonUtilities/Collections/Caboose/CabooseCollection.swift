//
//  CabooseCollection.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: CabooseCollection - Definition
// -------------------------------------------------------------------------- //

/// A `CabooseCollection` presents a view of an underlying `Source` collection
/// with a single additional element appended (the so-called "caboose"). This is
/// *essentially* a dedicated, special-purpose replacement for something like
/// `Chain2Collection<Source,CollectionOfOne<Source.Element>>` for the rather
/// common scenario of only needing to tack on a single additional element.
///
/// This is, in part, intended to be a *non-allocating* type; contrast with the
/// `Chain` family, which is always allocating due to the need to cache certain
/// potentially-expensive properties derived from its constituent collections.
public struct CabooseCollection<Source:Collection> {
  
  @usableFromInline
  internal let source: Source
  
  @usableFromInline
  internal let caboose: Element
  
  @inlinable
  internal init(source: Source, caboose: Element) {
    self.source = source
    self.caboose = caboose
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollection - Validatable
// -------------------------------------------------------------------------- //

extension CabooseCollection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.source),
        isValidOrIndifferent(self.caboose) else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollection - Equatable
// -------------------------------------------------------------------------- //

extension CabooseCollection : Equatable where Source:Equatable, Source.Element:Equatable {
  
  @inlinable
  public static func ==(
    lhs: CabooseCollection<Source>,
    rhs: CabooseCollection<Source>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.source == rhs.source,
      lhs.caboose == rhs.caboose else {
        return false
    }
    return true
  }

  @inlinable
  public static func !=(
    lhs: CabooseCollection<Source>,
    rhs: CabooseCollection<Source>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.source == rhs.source,
      lhs.caboose == rhs.caboose else {
        return true
    }
    return false
  }

}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollection - Hashable
// -------------------------------------------------------------------------- //

extension CabooseCollection : Hashable where Source:Hashable, Source.Element:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.source.hash(into: &hasher)
    self.caboose.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension CabooseCollection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "\(String(describing: self.source)) w/caboose \(String(describing: self.caboose))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollection - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension CabooseCollection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "CabooseCollection<\(String(reflecting: Source.self))>(source: \(String(reflecting: self.source)), caboose: \(String(reflecting: self.caboose)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollection - Codable
// -------------------------------------------------------------------------- //

extension CabooseCollection : Codable where Source:Codable, Source.Element:Codable {
  
  // synthesized ok
  
}


// -------------------------------------------------------------------------- //
// MARK: CabooseCollection - Collection
// -------------------------------------------------------------------------- //

extension CabooseCollection : Collection {
  
  public typealias Element = Source.Element
  public typealias Index = CabooseCollectionIndex<Source.Index>
  //public typealias Indices = CabooseCollection<Source.Indices>
  
  @inlinable
  public var isEmpty: Bool {
    get {
      return false
    }
  }
  
  @inlinable
  public var count: Int {
    get {
      return self.source.count + 1
    }
  }
  
  @inlinable
  public var startIndex: Index {
    get {
      guard let firstSourceIndex = self.source.firstSubscriptableIndex else {
        return Index.cabooseIndex
      }
      return Index(
        index: firstSourceIndex
      )
    }
  }
  
  @inlinable
  public var endIndex: Index {
    get {
      return Index.endIndex
    }
  }
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      switch index.storage {
      case .primary(let sourceIndex):
        return self.source[sourceIndex]
      case .caboose:
        return self.caboose
      case .end:
        preconditionFailure("Attempted to subscript the `.endIndex` on \(String(reflecting: self))!")
      }
    }
  }
  
  @inlinable
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(start.isValid)
    pedantic_assert(end.isValid)
    pedantic_assert(self.couldHaveCreated(index: start))
    pedantic_assert(self.couldHaveCreated(index: end))
    // /////////////////////////////////////////////////////////////////////////
    switch (start.storage, end.storage) {
    case (.primary(let startSourceIndex), .primary(let endSourceIndex)):
      return self.source.distance(
        from: startSourceIndex,
        to: endSourceIndex
      )
    case (.primary(let startSourceIndex), .caboose):
      return self.source.distanceToEnd(
        from: startSourceIndex
      )
    case (.primary(let startSourceIndex), .end):
      return 1 + self.source.distanceToEnd(
        from: startSourceIndex
      )
    case (.caboose, .primary(let endSourceIndex)):
      return self.source.distanceFromEnd(
        to: endSourceIndex
      )
    case (.caboose, .caboose):
      return 0
    case (.caboose, .end):
      return 1
    case (.end, .primary(let endSourceIndex)):
      return (-1) + self.source.distanceFromEnd(
        to: endSourceIndex
      )
    case (.end, .caboose):
      return -1
    case (.end, .end):
      return 0
    }
  }
  
  @inlinable
  public func index(after index: Index) -> Index {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(index.isValid)
    pedantic_assert(self.couldHaveCreated(index: index))
    // /////////////////////////////////////////////////////////////////////////
    switch index.storage {
    case .primary(let sourceIndex):
      guard let nextSourceIndex = self.source.subscriptableIndex(after: sourceIndex) else {
        return Index.cabooseIndex
      }
      return Index(
        index: nextSourceIndex
      )
    case .caboose:
      return Index.endIndex
    case .end:
      preconditionFailure("Attempted to advance the `.endIndex` on \(String(reflecting: self))!")
    }
  }
  
  @inlinable
  public func index(
    _ index: Index,
    offsetBy distance: Int) -> Index {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(index.isValid)
    pedantic_assert(self.couldHaveCreated(index: index))
    // /////////////////////////////////////////////////////////////////////////
    guard distance != 0 else {
      return index
    }
    switch index.storage {
    case .primary(let sourceIndex):
      if distance > 0 {
        let distanceToEnd = self.source.distanceToEnd(from: sourceIndex)
        if distance < distanceToEnd {
          return Index(
            index: self.source.index(
              sourceIndex,
              offsetBy: distance
            )
          )
        } else if distance == distanceToEnd {
          return Index.cabooseIndex
        } else if distance == distanceToEnd + 1 {
          return Index.endIndex
        } else {
          preconditionFailure("Overshot `.endIndex` in `index(\(String(reflecting: index)), offsetBy: \(distance))` called-on \(String(reflecting: self))!")
        }
      } else {
        // /////////////////////////////////////////////////////////////////////
        pedantic_assert(distance < 0)
        // /////////////////////////////////////////////////////////////////////
        return Index(
          index: self.source.index(
            sourceIndex,
            offsetBy: distance
          )
        )
      }
    case .caboose:
      if distance == 1 {
        return Index.endIndex
      } else {
        // /////////////////////////////////////////////////////////////////////
        pedantic_assert(distance < 0)
        // /////////////////////////////////////////////////////////////////////
        // the below works b/c from the perspective of the `source` collection,
        // our `caboose` sits in the same spot that the end index would sit.
        return Index(
          index: self.source.index(
            offsetFromEndBy: distance
          )
        )
      }
    case .end:
      precondition(distance < 0)
      if distance == -1 {
        return Index.cabooseIndex
      } else {
        // note the `1` is to account for moving to the caboose, and it's +1
        // b/c `distance` is negative, here.
        //
        // As above, this works b/c from `source`'s perspective, our `caboose`
        // is located where `source.endIndex` would be.
        return Index(
          index: self.source.index(
            offsetFromEndBy: (1 + distance)
          )
        )
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollection - BidirectionalCollection
// -------------------------------------------------------------------------- //

extension CabooseCollection : BidirectionalCollection where Source:BidirectionalCollection {
  
  @inlinable
  public func index(before index: Index) -> Index {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(index.isValid)
    pedantic_assert(self.couldHaveCreated(index: index))
    // /////////////////////////////////////////////////////////////////////////
    switch index.storage {
    case .primary(let sourceIndex):
      precondition(sourceIndex >= self.source.startIndex)
      return Index(
        index: self.source.index(
          before: sourceIndex
        )
      )
    case .caboose:
      guard let finalSourceIndex = self.source.finalSubscriptableIndex else {
        preconditionFailure("Attempted to go back from `startIndex` on \(String(reflecting: self))!")
      }
      return Index(
        index: finalSourceIndex
      )
    case .end:
      return Index.cabooseIndex
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension CabooseCollection : RandomAccessCollection where Source:RandomAccessCollection {
  
  // nothing to do!
  
}

// -------------------------------------------------------------------------- //
// MARK: CabooseCollection - Collection Support
// -------------------------------------------------------------------------- //

internal extension CabooseCollection {
  
  @inlinable
  func couldHaveCreated(index: Index) -> Bool {
    switch index.storage {
    case .primary(let sourceIndex):
      guard
        self.source.startIndex <= sourceIndex,
        sourceIndex <= self.source.endIndex else {
          return false
      }
      return true
    case .caboose:
      return true
    case .end:
      return true
    }
  }
  
}
