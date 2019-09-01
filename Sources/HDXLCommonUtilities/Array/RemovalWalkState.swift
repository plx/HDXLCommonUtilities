//
//  RemovalWalkState.swift
//

import Foundation

@usableFromInline
internal enum RemovalWalkState {
  
  case initial
  case withinRangeNeedingRemoval(Int,Int)
  /// In a range that will *not* be removed; `Int` value is "final"
  case withinRangeNeedingPreservation
  case finished
  
  @inlinable
  var isFinished: Bool {
    get {
      switch self {
      case .initial:
        return false
      case .withinRangeNeedingPreservation:
        return false
      case .withinRangeNeedingRemoval(_, _):
        return false
      case .finished:
        return true
      }
    }
  }
  
  @inlinable
  mutating func finish() -> ClosedRange<Int>? {
    switch self {
    case .initial:
      self = .finished
      return nil
    case .withinRangeNeedingRemoval(let lowerBound, let upperBound):
      self = .finished
      return lowerBound...upperBound
    case .withinRangeNeedingPreservation:
      self = .finished
      return nil
    case .finished:
      fatalError("Tried to finish an already-finished `RemovalWalkState`!")
    }
  }
  
  @inlinable
  mutating func update(
    visitedIndex: Int,
    needsRemoval: Bool) -> ClosedRange<Int>? {
    switch (self, needsRemoval) {
    case (.initial, true):
      self = .withinRangeNeedingRemoval(visitedIndex, visitedIndex)
      return nil
    case (.initial, false):
      self = .withinRangeNeedingPreservation
      return nil
    case (.withinRangeNeedingRemoval(let lowerBound, let upperBound), true):
      assert(visitedIndex <= lowerBound)
      self = .withinRangeNeedingRemoval(visitedIndex, upperBound)
      return nil
    case (.withinRangeNeedingRemoval(let lowerBound, let upperBound), false):
      assert(visitedIndex <= lowerBound)
      self = .withinRangeNeedingPreservation
      return lowerBound...upperBound
    case (.withinRangeNeedingPreservation, true):
      self = .withinRangeNeedingRemoval(visitedIndex, visitedIndex)
      return nil
    case (.withinRangeNeedingPreservation, false):
      self = .withinRangeNeedingPreservation
      return nil
    case (.finished, _):
      fatalError("Tried to update a finished `RemovalWalkState`!")
    }
  }
  
}

