//
//  Collection+SubscriptableIndices.swift
//

import Foundation

public extension Collection {
  
  @inlinable
  var firstSubscriptableIndex: Index? {
    get {
      guard !self.isEmpty else {
        return nil
      }
      return self.startIndex
    }
  }
  
  @inlinable
  var finalSubscriptableIndex: Index? {
    get {
      guard !self.isEmpty else {
        return nil
      }
      return self.locateFinalSubscriptableIndex(
        assumingCount: self.count
      )
    }
  }
  
  @inlinable
  internal func locateFinalSubscriptableIndex(assumingCount count: Int) -> Index? {
    guard count > 0 else {
      return nil
    }
    return self.index(
      self.startIndex,
      offsetBy: count - 1
    )
  }
  
  @inlinable
  func canSubscript(index: Index) -> Bool {
    return index < self.endIndex
  }
  
  @inlinable
  func subscriptableIndex(after index: Index) -> Index? {
    precondition(self.canSubscript(index: index))
    let nextIndex = self.index(after: index)
    guard nextIndex < self.endIndex else {
      return nil
    }
    return nextIndex
  }
  
  @inlinable
  func formSubscriptableIndex(after index: inout Index) -> Bool {
    precondition(self.canSubscript(index: index))
    self.formIndex(
      after: &index
    )
    return self.canSubscript(
      index: index
    )
  }
  
  @inlinable
  internal func subscriptableIndex(
    _ index: Index,
    offsetBy distance: Int) -> IndexPositionStorageMovementAttemptDestination<Index> {
    precondition(self.canSubscript(index: index))
    let result = self.index(
      index,
      offsetBy: distance
    )
    switch result <=> self.endIndex {
    case .orderedAscending:
      guard result >= self.startIndex else {
        return .misnavigation
      }
      return .success(result)
    case .orderedSame:
      return .becameEnd
    case .orderedDescending:
      return .misnavigation
    }
  }
  
  @inlinable
  internal func formSubscriptableIndex(
    _ index: inout Index,
    offsetBy distance: Int) -> IndexPositionStorageMovementAttemptResult {
    precondition(self.canSubscript(index: index))
    guard distance != 0 else {
      return .success
    }
    self.formIndex(
      &index,
      offsetBy: distance
    )
    precondition((self.startIndex..<self.endIndex).contains(index))
    // ^ for some types we can't feel confident we won't grossly overshoot/undershoot
    switch index <=> self.endIndex {
    case .orderedAscending:
      guard index >= self.startIndex else {
        return .misnavigation
      }
      return .success
    case .orderedSame:
      return .becameEnd
    case .orderedDescending:
      return .misnavigation
    }
  }
  
}

public extension BidirectionalCollection {
  
  @inlinable
  func subscriptableIndex(before index: Index) -> Index? {
    guard index > self.startIndex else {
      return nil
    }
    return self.index(
      before: index
    )
  }
  
  @inlinable
  func formSubscriptableIndex(before index: inout Index) -> Bool {
    guard index > self.startIndex else {
      return false
    }
    self.formIndex(before: &index)
    return true
  }
  
}
