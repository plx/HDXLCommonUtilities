//
//  GenericCollectionStorage.swift
//

import Foundation

@usableFromInline
@propertyWrapper
internal struct GenericCollectionStorage<C:Collection> {
  
  @usableFromInline
  mutating func resetCaches() {
    self._count = nil
    self._firstSubscriptableIndex = nil
    self._finalSubscriptableIndex = nil
  }
  
  @usableFromInline
  mutating func fullyPopulateCaches() {
    let _ = self.count
    let _ = self.firstSubscriptableIndex
    let _ = self.finalSubscriptableIndex
  }
  
  @usableFromInline
  var hasFullyPopulatedCaches: Bool {
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
  var wrappedValue: C {
    didSet {
    }
  }
  
  @usableFromInline
  init(initialValue: C) {
    self.wrappedValue = initialValue
  }
  
  @usableFromInline
  var _count: Int? = nil
  
  @usableFromInline
  var count: Int {
    mutating get {
      return self._count.obtainAssuredValue(
        fallingBackUpon: self.wrappedValue.count
      )
    }
  }
  
  @usableFromInline
  var _firstSubscriptableIndex: C.Index?? = nil
  
  @usableFromInline
  var firstSubscriptableIndex: C.Index? {
    mutating get {
      return self._firstSubscriptableIndex.obtainAssuredValue(
        fallingBackUpon: self.wrappedValue.firstSubscriptableIndex
      )
    }
  }
  
  @usableFromInline
  var _finalSubscriptableIndex: C.Index?? = nil
  
  @usableFromInline
  var finalSubscriptableIndex: C.Index? {
    mutating get {
      return self._finalSubscriptableIndex.obtainAssuredValue(
        fallingBackUpon: self.wrappedValue.finalSubscriptableIndex
      )
    }
  }
  
  @usableFromInline
  var subscriptableIndexRange: ClosedRange<C.Index>? {
    mutating get {
      guard
        let first = self.firstSubscriptableIndex,
        let final = self.finalSubscriptableIndex else {
          return nil
      }
      return first...final
    }
  }
  
  @usableFromInline
  mutating func subscriptableIndex(after index: C.Index) -> C.Index? {
    guard
      !self.wrappedValue.isEmpty,
      let finalSubscriptableIndex = self.finalSubscriptableIndex,
      index < finalSubscriptableIndex else {
        return nil
    }
    return self.wrappedValue.index(after: index)
  }
  
  @usableFromInline
  mutating func nextSubscriptableIndex(
    after index: C.Index,
    updating context: inout ProductIndexAdvancementContext) -> C.Index {
    assert(!self.wrappedValue.isEmpty)
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
  
  @usableFromInline
  mutating func subscriptableIndex(
    _ index: C.Index,
    offsetBy distance: Int) -> C.Index? {
    guard !self.wrappedValue.isEmpty else {
      return nil
    }
    if distance == 0 {
      return index
    } else if distance > 0, let finalSubscriptableIndex = self.finalSubscriptableIndex {
      let destination = self.wrappedValue.index(
        index,
        offsetBy: distance
      )
      guard destination <= finalSubscriptableIndex else {
        return nil
      }
      return destination
    } else if distance < 0, let firstSubscriptableIndex = self.firstSubscriptableIndex {
      let destination = self.wrappedValue.index(
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
  
  @usableFromInline
  mutating func subscriptableIndex(before index: C.Index) -> C.Index? {
    guard
      !self.wrappedValue.isEmpty,
      let firstSubscriptableIndex = self.firstSubscriptableIndex,
      firstSubscriptableIndex < index  else {
        return nil
    }
    return self.wrappedValue.index(before: index)
  }
  
  @usableFromInline
  mutating func previousSubscriptableIndex(
    before index: C.Index,
    updating context: inout ProductIndexRetreatContext) -> C.Index {
    assert(!self.wrappedValue.isEmpty)
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
  
  @usableFromInline
  internal func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(self.wrappedValue)
  }
  
  @usableFromInline
  internal init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    self.init(
      initialValue: try container.decode(C.self)
    )
  }
  
}

