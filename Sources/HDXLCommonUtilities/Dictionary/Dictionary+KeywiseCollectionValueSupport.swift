//
//  Dictionary+KeywiseCollectionValueSupport.swift
//

import Foundation

public extension Dictionary where Value:Collection {

  @inlinable
  mutating func inPlaceMutateWithRemovalOnEmpty(
    valueForIndex index: Index,
    using mutation: (inout Value) -> Void) {
    mutation(&self.values[index])
    if self.values[index].isEmpty {
      self.remove(at: index)
    }
  }
  
  @inlinable
  mutating func inPlaceMutateWithRemovalOnEmpty(
    valueForKey key: Key,
    fallbackValue fallback: @autoclosure () -> Value?,
    using mutation: (inout Value) -> Void) {
    if let existingIndex = self.index(forKey: key) {
      self.inPlaceMutateWithRemovalOnEmpty(
        valueForIndex: existingIndex,
        using: mutation
      )
    } else if var fallbackStartingPoint = fallback()  {
      mutation(&fallbackStartingPoint)
      if !fallbackStartingPoint.isEmpty {
        self[key] = fallbackStartingPoint
      }
    }
  }
  
  @inlinable
  var hasNoEmptyValues: Bool {
    get {
      return self.values.allSatisfy() {
        !$0.isEmpty
      }
    }
  }
  
  @inlinable
  mutating func storeOrRemove(
    possiblyEmptyValue value: Value,
    forIndex index: Index) {
    if value.isEmpty {
      self.remove(at: index)
    } else {
      self.values[index] = value
    }
  }

  @inlinable
  mutating func storeOrRemove(
    possiblyEmptyValue value: Value,
    forKey key: Key) {
    if let existingIndex = self.index(forKey: key) {
      self.storeOrRemove(
        possiblyEmptyValue: value,
        forIndex: existingIndex
      )
    } else if !value.isEmpty {
      self[key] = value
    }
  }

  
}
