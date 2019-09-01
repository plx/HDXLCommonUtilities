//
//  Array+InPlaceOperations.swift
//

import Foundation

public extension Array {
  
  // ------------------------------------------------------------------------ //
  // MARK: In-Place Mutation
  // ------------------------------------------------------------------------ //

  /// In-place does in-place mutation of *all* elements in `self`.
  @inlinable
  mutating func inPlaceMutateElements(using mutation: (inout Element) throws -> Void) rethrows {
    try self.inPlaceMutateElements(
      at: self.indices,
      using: mutation
    )
  }

  /// In-place does in-place mutation of *all* elements in `self`.
  @inlinable
  mutating func inPlaceMutateElements<K>(
    at indices: K,
    using mutation: (inout Element) throws -> Void) rethrows
    where
    K:Collection,
    K.Element == Index {
      guard !indices.isEmpty else {
        return
      }
      try self.withUnsafeMutableBufferPointer() {
        (mutableBufferPointer: inout UnsafeMutableBufferPointer<Element>) -> Void
        in
        for index in indices {
          try mutation(&mutableBufferPointer[index])
        }
      }
  }

  /// In-place does in-place mutation of the elements at the indicated `indices`.
  @inlinable
  mutating func inPlaceMutateEnumeratedElements(
    using mutation: (Int, inout Element) throws -> Void) rethrows {
    try self.inPlaceMutateEnumeratedElements(
      at: self.indices,
      using: mutation
    )
  }

  /// In-place does in-place mutation of the elements at the indicated `indices`.
  @inlinable
  mutating func inPlaceMutateEnumeratedElements<K>(
    at indices: K,
    using mutation: (Int, inout Element) throws -> Void) rethrows
    where
    K:Collection,
    K.Element == Index {
      guard !indices.isEmpty else {
        return
      }
      try self.withUnsafeMutableBufferPointer() {
        (mutableBufferPointer: inout UnsafeMutableBufferPointer<Element>) -> Void
        in
        for index in indices {
          try mutation(
            index,
            &mutableBufferPointer[index]
          )
        }
      }
  }

  // ------------------------------------------------------------------------ //
  // MARK: In-Place Mapping
  // ------------------------------------------------------------------------ //

  /// In-place overwrites the values in `self` with new ones obtained from `mapping`.
  @inlinable
  mutating func inPlaceMapElements(using mapping: (Element) throws -> Element) rethrows {
    try self.inPlaceMapElements(
      at: self.indices,
      using: mapping
    )
  }

  /// In-place overwrites the values in `self` with new ones obtained from `mapping`.
  @inlinable
  mutating func inPlaceMapElements<K>(
    at indices: K,
    using mapping: (Element) throws -> Element) rethrows
    where
    K:Collection,
    K.Element == Index {
      guard !indices.isEmpty else {
        return
      }
      try self.withUnsafeMutableBufferPointer() {
        (mutableBufferPointer: inout UnsafeMutableBufferPointer<Element>) -> Void
        in
        for index in indices {
          mutableBufferPointer[index] = try mapping(mutableBufferPointer[index])
        }
      }
  }
  
  /// In-place overwrites the values in `self` with new ones obtained from `mapping`.
  @inlinable
  mutating func inPlaceMapEnumeratedElements(using mapping: (Int,Element) throws -> Element) rethrows {
    try self.inPlaceMapEnumeratedElements(
      at: self.indices,
      using: mapping
    )
  }

  /// In-place overwrites the values in `self` with new ones obtained from `mapping`.
  @inlinable
  mutating func inPlaceMapEnumeratedElements<K>(
    at indices: K,
    using mapping: (Int,Element) throws -> Element) rethrows
    where
    K:Collection,
    K.Element == Index {
    guard !indices.isEmpty else {
      return
    }
    try self.withUnsafeMutableBufferPointer() {
      (mutableBufferPointer: inout UnsafeMutableBufferPointer<Element>) -> Void
      in
      for index in indices {
        mutableBufferPointer[index] = try mapping(
          index,
          mutableBufferPointer[index]
        )
      }
    }
  }

  // ------------------------------------------------------------------------ //
  // MARK: In-Place Conditional Mutation
  // ------------------------------------------------------------------------ //

  /// In-place does an in-plaec mutation of all elements, with the closure able
  /// to request *removal* of an element (by returning `false`).
  ///
  /// Motivated by a "fix-or-toss" scenario. Doesn't *currently* include a narrower
  /// method looking @ only a subset of elements b/c I haven't needed it and it's
  /// not as trivial as the non-removing methods.
  ///
  /// - returns: The number of elements removed (discardable).
  ///
  /// - todo: Introduce a proper `(.remove|.keep)` enum for methods like this to use as the closure return-type.
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceConditionallyMutateElements(
    using mutation: (inout Element) throws -> Bool) rethrows -> Int {
    guard !self.isEmpty else {
      return 0
    }
    var removalCount = 0
    let initialCount = self.count
    var walkState: RemovalWalkState = .initial
    for offsetFromEnd in 1...initialCount {
      let candidateIndex = initialCount - offsetFromEnd
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(candidateIndex >= 0 && candidateIndex < self.count)
      // ///////////////////////////////////////////////////////////////////////
      let shouldRemove = try !mutation(&self[candidateIndex])
      if let indicesNeedingRemoval = walkState.update(
        visitedIndex: candidateIndex,
        needsRemoval: shouldRemove) {
        removalCount += indicesNeedingRemoval.count
        self.removeSubrange(
          indicesNeedingRemoval.lowerBound..<(1 + indicesNeedingRemoval.upperBound)
        )
      }
    }
    if let indicesNeedingRemoval = walkState.finish() {
      removalCount += indicesNeedingRemoval.count
      self.removeSubrange(
        indicesNeedingRemoval.lowerBound..<(1 + indicesNeedingRemoval.upperBound)
      )
    }
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(walkState.isFinished)
    pedantic_assert(initialCount == self.count + removalCount)
    // /////////////////////////////////////////////////////////////////////////
    return removalCount
  }
  
  /// In-place overwrites all elements, with the closure able to request removal
  /// by returning `nil` instead of a new value.
  ///
  /// Motivated by a "fix-or-toss" scenario. Doesn't *currently* include a narrower
  /// method looking @ only a subset of elements b/c I haven't needed it and it's
  /// not as trivial as the non-removing methods.
  ///
  /// - returns: The number of elements removed (discardable).
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceConditionallyMapElements(using mapping: (Element) throws -> Element?) rethrows -> Int {
    guard !self.isEmpty else {
      return 0
    }
    var removalCount = 0
    let initialCount = self.count
    var walkState: RemovalWalkState = .initial
    for offsetFromEnd in 1...initialCount {
      let candidateIndex = initialCount - offsetFromEnd
      // /////////////////////////////////////////////////////////////////////////
      pedantic_assert(candidateIndex >= 0 && candidateIndex < self.count)
      // /////////////////////////////////////////////////////////////////////////
      let shouldRemove: Bool
      if let mappedElement = try mapping(self[candidateIndex]) {
        self[candidateIndex] = mappedElement
        shouldRemove = true
      } else {
        shouldRemove = false
      }
      if let indicesNeedingRemoval = walkState.update(
        visitedIndex: candidateIndex,
        needsRemoval: shouldRemove) {
        removalCount += indicesNeedingRemoval.count
        self.removeSubrange(
          indicesNeedingRemoval.lowerBound..<(1 + indicesNeedingRemoval.upperBound)
        )
      }
    }
    if let indicesNeedingRemoval = walkState.finish() {
      removalCount += indicesNeedingRemoval.count
      self.removeSubrange(
        indicesNeedingRemoval.lowerBound..<(1 + indicesNeedingRemoval.upperBound)
      )
    }
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(walkState.isFinished)
    pedantic_assert(initialCount == self.count + removalCount)
    // /////////////////////////////////////////////////////////////////////////
    return removalCount
  }
  
  /// In-place variant of `filter`: evaluates `predicate` on each element in `self`,
  /// removing all objects *satisfying* the predicate.
  ///
  /// - returns: The number of elements removed (discardable).
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceRemoveElementsSatisfying(predicate: (Element) throws -> Bool) rethrows -> Int {
    guard !self.isEmpty else {
      return 0
    }
    var removalCount = 0
    let initialCount = self.count
    var walkState: RemovalWalkState = .initial
    for offsetFromEnd in 1...initialCount {
      let candidateIndex = initialCount - offsetFromEnd
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(candidateIndex >= 0 && candidateIndex < self.count)
      // ///////////////////////////////////////////////////////////////////////
      let shouldRemove = try predicate(self[candidateIndex])
      if let indicesNeedingRemoval = walkState.update(
        visitedIndex: candidateIndex,
        needsRemoval: shouldRemove) {
        removalCount += indicesNeedingRemoval.count
        self.removeSubrange(
          indicesNeedingRemoval.lowerBound..<(1 + indicesNeedingRemoval.upperBound)
        )
      }
    }
    if let indicesNeedingRemoval = walkState.finish() {
      removalCount += indicesNeedingRemoval.count
      self.removeSubrange(
        indicesNeedingRemoval.lowerBound..<(1 + indicesNeedingRemoval.upperBound)
      )
    }
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(walkState.isFinished)
    pedantic_assert(initialCount == self.count + removalCount)
    // /////////////////////////////////////////////////////////////////////////
    return removalCount
  }

  /// In-place variant of `filter`: evaluates `predicate` on each element in `self`,
  /// removing all objects *satisfying* the predicate.
  ///
  /// - returns: The number of elements removed (discardable).
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceRemoveElementsFailing(predicate: (Element) throws -> Bool) rethrows -> Int {
    guard !self.isEmpty else {
      return 0
    }
    var removalCount = 0
    let initialCount = self.count
    var walkState: RemovalWalkState = .initial
    for offsetFromEnd in 1...initialCount {
      let candidateIndex = initialCount - offsetFromEnd
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(candidateIndex >= 0 && candidateIndex < self.count)
      // ///////////////////////////////////////////////////////////////////////
      let shouldRemove = try !predicate(self[candidateIndex])
      if let indicesNeedingRemoval = walkState.update(
        visitedIndex: candidateIndex,
        needsRemoval: shouldRemove) {
        removalCount += indicesNeedingRemoval.count
        self.removeSubrange(
          indicesNeedingRemoval.lowerBound..<(1 + indicesNeedingRemoval.upperBound)
        )
      }
    }
    if let indicesNeedingRemoval = walkState.finish() {
      removalCount += indicesNeedingRemoval.count
      self.removeSubrange(
        indicesNeedingRemoval.lowerBound..<(1 + indicesNeedingRemoval.upperBound)
      )
    }
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(walkState.isFinished)
    pedantic_assert(initialCount == self.count + removalCount)
    // /////////////////////////////////////////////////////////////////////////
    return removalCount
  }

}

