//
//  Collection+IndexEnumeration.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Collection - Index Enumeration - Implicit
// -------------------------------------------------------------------------- //

public extension Collection where Iterator == IndexingIterator<Self> {

  /// We define this convenience method on collections for which it's a reasonable
  /// inference that iterating-by-index is the right approach.
  ///
  /// For all other cases, one of the explicit methods must be chosen. If that
  /// proves too painful, though, I can always just make this convenience method
  /// available a bit more broadly.
  ///
  @inlinable
  func enumeratingIndices() -> IndexEnumerationByIndexCollection<Self> {
    return self.enumeratingIndicesByIndex()
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Collection - Index Enumeration - Explicit
// -------------------------------------------------------------------------- //

public extension Collection {
  
  /// Provides `(index, element)` pairs, and explicitly chooses to step through index-by-index.
  @inlinable
  func enumeratingIndicesByIndex() -> IndexEnumerationByIndexCollection<Self> {
    return IndexEnumerationByIndexCollection<Self>(source: self)
  }
  
  /// Provides `(index, element)` pairs, and explicitly chooses to step through via the collection's iterator.
  @inlinable
  func enumeratingIndicesByIterator() -> IndexEnumerationByIteratorCollection<Self> {
    return IndexEnumerationByIteratorCollection<Self>(source: self)
  }
  

}

