//
//  GenericCollectionStorage.swift
//

import Foundation

@usableFromInline
@propertyWrapper
internal struct GenericCollectionStorage<C:Collection> {
  
  @inlinable
  internal var projectedValue: GenericCollectionStorage<C> {
    get {
      return self
    }
    set {
      self = newValue
    }
  }
  
  @inlinable
  internal mutating func resetCaches() {
    self._count = nil
    self._firstSubscriptableIndex = nil
    self._finalSubscriptableIndex = nil
  }
  
  @inlinable
  internal mutating func fullyPopulateCaches() {
    let _ = self.count
    let _ = self.firstSubscriptableIndex
    let _ = self.finalSubscriptableIndex
  }
  
  @inlinable
  internal var hasFullyPopulatedCaches: Bool {
    get {
      guard
        nil != self._count,
        nil != self._firstSubscriptableIndex,
        nil != self._finalSubscriptableIndex else {
          return false
      }
      return true
    }
  }
  
  @usableFromInline
  internal var _wrappedValue: C
  
  @inlinable
  internal var wrappedValue: C {
    get {
      return self._wrappedValue
    }
    set {
      self._wrappedValue = newValue
      self.resetCaches()
    }
  }
  
  @inlinable
  internal init(wrappedValue: C) {
    self._wrappedValue = wrappedValue
  }
  
  @usableFromInline
  internal var _count: Int? = nil
  
  @inlinable
  internal var count: Int {
    mutating get {
      return self._count.obtainAssuredValue(
        fallingBackUpon: self._wrappedValue.count
      )
    }
  }
  
  @usableFromInline
  internal var _firstSubscriptableIndex: C.Index?? = nil
  
  @inlinable
  internal var firstSubscriptableIndex: C.Index? {
    mutating get {
      return self._firstSubscriptableIndex.obtainAssuredValue(
        fallingBackUpon: self._wrappedValue.firstSubscriptableIndex
      )
    }
  }
  
  @usableFromInline
  internal var _finalSubscriptableIndex: C.Index?? = nil
  
  @inlinable
  internal var finalSubscriptableIndex: C.Index? {
    mutating get {
      return self._finalSubscriptableIndex.obtainAssuredValue(
        fallingBackUpon: self._wrappedValue.finalSubscriptableIndex
      )
    }
  }
  
  @usableFromInline
  internal var subscriptableIndexRange: ClosedRange<C.Index>? {
    mutating get {
      guard
        let first = self.firstSubscriptableIndex,
        let final = self.finalSubscriptableIndex else {
          return nil
      }
      return first...final
    }
  }
  
  @inlinable
  internal mutating func subscriptableIndex(after index: C.Index) -> C.Index? {
    guard
      !self._wrappedValue.isEmpty,
      let finalSubscriptableIndex = self.finalSubscriptableIndex,
      index < finalSubscriptableIndex else {
        return nil
    }
    return self._wrappedValue.index(after: index)
  }
  
  @inlinable
  internal mutating func nextSubscriptableIndex(
    after index: C.Index,
    updating context: inout ProductIndexAdvancementContext) -> C.Index {
    assert(!self._wrappedValue.isEmpty)
    switch context {
    case .shouldHoldPosition:
      return index
    case .shouldAttemptAdvancement:
      if let next = self.subscriptableIndex(after: index) {
        context = .shouldHoldPosition
        return next
      } else {
        context = .shouldAttemptAdvancement
        guard let next = self.firstSubscriptableIndex else {
          preconditionFailure("Shouldn't use `nextSubscriptableIndex(after:updating:)` on collections w/`nil` for `firstSubscriptableIndex`")
        }
        return next
      }
    }
  }
  
  @inlinable
  internal mutating func subscriptableIndex(
    _ index: C.Index,
    offsetBy distance: Int) -> C.Index? {
    guard !self._wrappedValue.isEmpty else {
      return nil
    }
    if distance == 0 {
      return index
    } else if distance > 0, let finalSubscriptableIndex = self.finalSubscriptableIndex {
      let destination = self._wrappedValue.index(
        index,
        offsetBy: distance
      )
      guard destination <= finalSubscriptableIndex else {
        return nil
      }
      return destination
    } else if distance < 0, let firstSubscriptableIndex = self.firstSubscriptableIndex {
      let destination = self._wrappedValue.index(
        index,
        offsetBy: distance
      )
      guard destination >= firstSubscriptableIndex else {
        return nil
      }
      return destination
    } else {
      return nil
    }
  }
  
}

extension GenericCollectionStorage where C:BidirectionalCollection {
  
  @inlinable
  internal mutating func subscriptableIndex(before index: C.Index) -> C.Index? {
    guard
      !self._wrappedValue.isEmpty,
      let firstSubscriptableIndex = self.firstSubscriptableIndex,
      firstSubscriptableIndex < index  else {
        return nil
    }
    return self._wrappedValue.index(before: index)
  }
  
  @inlinable
  internal mutating func previousSubscriptableIndex(
    before index: C.Index,
    updating context: inout ProductIndexRetreatContext) -> C.Index {
    assert(!self._wrappedValue.isEmpty)
    switch context {
    case .shouldHoldPosition:
      return index
    case .shouldAttemptRetreat:
      if let previous = self.subscriptableIndex(before: index) {
        context = .shouldHoldPosition
        return previous
      } else {
        context = .shouldAttemptRetreat
        guard let finalSubscriptableIndex = self.finalSubscriptableIndex else {
          preconditionFailure("Shouldn't use `previousSubscriptableIndex(before:updating:)` for empty collections!")
        }
        return finalSubscriptableIndex
      }
    }
  }
  
}

extension GenericCollectionStorage : Codable where C:Codable {
  
  @inlinable
  internal func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(self._wrappedValue)
  }
  
  @inlinable
  internal init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    self.init(
      wrappedValue: try container.decode(C.self)
    )
  }
  
}

