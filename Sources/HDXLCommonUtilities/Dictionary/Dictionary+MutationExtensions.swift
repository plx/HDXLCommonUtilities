//
//  Dictionary+MutationExtensions.swift
//

import Foundation

public extension Dictionary {
  
  /// Like a dictionary-flavored `compactMap()`: creates a dictionary derived
  /// from `self` by mapping values to new values, quietly discarding anything
  /// mapped to `nil`.
  @inlinable
  func conditionallyMapValues<R>(_ mapping: (Value) throws -> R?) rethrows -> [Key:R] {
    // TODO: consider a defaulted parameter to influence how much capacity to reserve
    // e.g. "expectedDiscardCount = 0" or similar
    guard !self.isEmpty else {
      return [:]
    }
    var result: [Key:R] = [Key:R](minimumCapacity: self.count)
    for (key,value) in self {
      if let mappedValue = try mapping(value) {
        result[key] = mappedValue
      }
    }
    return result
  }
    
  /// In-place updates `self` so that each `value` is, itself, in-place mutated
  /// by `mutation` (without looking @ the associated key). Note that this is "doubly in-place",
  /// because (a) `self`, itself, is modified in-place and (b) each `value` is, itself,
  /// updated in-place ("in its own place", if you want to get cute).
  @inlinable
  mutating func inPlaceMutateBareValues(_ mutation: (inout Value) throws -> Void) rethrows {
    guard !self.isEmpty else {
      return
    }
    for index in self.indices {
      try mutation(&self.values[index])
    }
  }

  /// In-place updates `self` so that each `value` is, itself, in-place mutated
  /// by `mutation` (without looking @ the associated key). Note that this is "doubly in-place",
  /// because (a) `self`, itself, is modified in-place and (b) each `value` is, itself,
  /// updated in-place ("in its own place", if you want to get cute).
  ///
  /// - parameter mutation: Evaluated to (a) update each value and (b) decide to keep (`true`) or toss (`false`) the entry
  ///
  /// - returns: The number of removed entries
  ///
  /// - todo: As with `Array` variant, adopt a special-purpose `(.discard|.keep)` enumeration instead of a `Bool`.
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceConditionallyMutateBareValues(_ mutation: (inout Value) throws -> Bool) rethrows -> Int {
    guard !self.isEmpty else {
      return 0
    }
    var keysToRemove: [Key] = []
    for index in self.indices {
      let shouldPreserveEntry = try mutation(&self.values[index])
      if !shouldPreserveEntry {
        keysToRemove.append(self.keys[index])
      }
    }
    guard !keysToRemove.isEmpty else {
      return 0
    }
    return self.removeValues(
      forKeys: keysToRemove
    )
  }

  /// In-place updates `self` so that each `value` is *replaced* by `mapping(value)`.
  /// In other words, each value is replaced (in-situ) with a *new* value, and that
  /// new value is constructed with a view of the key.
  @inlinable
  mutating func inPlaceMutateValues(_ mutation: (Key, inout Value) throws -> Void) rethrows {
    guard !self.isEmpty else {
      return
    }
    for index in self.indices {
      // double-lookup is unfortunate, but hard to see how we get to `inout Value`
      // w/out winding up here:
      try mutation(self.keys[index], &self.values[index])
    }
  }

  /// In-place updates `self` so that each `value` is *updated* in-situ (as an
  /// inout parameter) via `mutation(key, &value)`, but possibly-also has its entry removed
  /// (requested by returning `false` from `mapping(value)`).
  ///
  /// Note that `mutation` must return `true` for entries to keep and `false` for
  /// entries to reject.
  ///
  /// - parameter mutation: Evaluated to (a) update each value and (b) decide to keep (`true`) or toss (`false`) the entry
  ///
  /// - returns: The number of removed entries
  ///
  @inlinable
  @discardableResult
  internal mutating func inPlaceConditionallyMutateValues(_ mutation: (Key, inout Value) throws -> Bool) rethrows -> Int {
    guard !self.isEmpty else {
      return 0
    }
    var keysToRemove: [Key] = []
    for index in self.indices {
      let key = self.keys[index]
      let shouldPreserveEntry = try mutation(key, &self.values[index])
      if !shouldPreserveEntry {
        keysToRemove.append(key)
      }
    }
    guard !keysToRemove.isEmpty else {
      return 0
    }
    return self.removeValues(
      forKeys: keysToRemove
    )
  }

  /// In-place updates `self` so that each `value` is *updated* in-situ (as an
  /// inout parameter) via `mapping(value)`, but possibly-also has its entry removed
  /// iff `mapping(value)` returns `false`.
  ///
  /// Note that `mutation` must return `true` for entries to keep and `false` for
  /// entries to reject.
  ///
  /// - parameter keys: Sequence of keys to examine
  /// - parameter mutation: Evaluated to (a) update each value and (b) decide to keep (`true`) or toss (`false`) the entry
  ///
  /// - returns: The number of removed entries
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceConditionallyMutateValuesWithKeyExtraction<S:Sequence>(
    forKeys keys: S,
    _ mutation: (Key, inout Value) throws -> Bool) rethrows -> Set<Key>
    where
    S.Element == Key {
      guard !self.isEmpty else {
        return []
      }
      var keysWeveSeen: Set<Key> = Set<Key>(minimumCapacity: keys.underestimatedCount)
      var keysToRemove: Set<Key> = []
      for key in keys where !keysWeveSeen.contains(key) {
        keysWeveSeen.insert(key)
        if let keyIndex = self.index(forKey: key) {
          let shouldPreserveEntry = try mutation(key, &self.values[keyIndex])
          if !shouldPreserveEntry {
            keysToRemove.insert(key)
          }
        }
      }
      if !keysToRemove.isEmpty {
        self.removeValues(
          forKeys: keysToRemove
        )
      }
      return keysToRemove
  }
  
  /// In-place updates `self` so that each `value` is *updated* in-situ (as an
  /// inout parameter) via `mapping(value)`, but possibly-also has its entry removed
  /// iff `mapping(value)` returns `false`.
  ///
  /// Note that `mutation` must return `true` for entries to keep and `false` for
  /// entries to reject.
  ///
  /// - parameter keys: Sequence of keys to examine
  /// - parameter mutation: Evaluated to (a) update each value and (b) decide to keep (`true`) or toss (`false`) the entry
  ///
  /// - returns: The number of removed entries
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceConditionallyMutateValuesWithKeyExtraction<C:Collection & SetAlgebra>(
    forKeys keys: C,
    _ mutation: (Key, inout Value) throws -> Bool) rethrows -> Set<Key>
    where C.Element == Key {
      guard !self.isEmpty else {
        return []
      }
      // can directly built the returned set b/c by assumption we only ever
      // see each `key` exactly once:
      var keysToRemove: Set<Key> = []
      for key in keys {
        if let keyIndex = self.index(forKey: key) {
          let shouldPreserveEntry = try mutation(key, &self.values[keyIndex])
          if !shouldPreserveEntry {
            keysToRemove.insert(key)
          }
        }
      }
      if !keysToRemove.isEmpty {
        self.removeValues(
          forKeys: keysToRemove
        )
      }
      return keysToRemove
  }

  /// In-place updates `self` so that each `value` is *updated* in-situ (as an
  /// inout parameter) via `mapping(value)`, but possibly-also has its entry removed
  /// iff `mapping(value)` returns `false`.
  ///
  /// Note that `mutation` must return `true` for entries to keep and `false` for
  /// entries to reject.
  ///
  /// - parameter keys: Sequence of keys to examine
  /// - parameter mutation: Evaluated to (a) update each value and (b) decide to keep (`true`) or toss (`false`) the entry
  ///
  /// - returns: The number of removed entries
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceConditionallyMutateBareValuesWithKeyExtraction<S:Sequence>(
    forKeys keys: S,
    _ mutation: (inout Value) throws -> Bool) rethrows -> Set<Key>
    where S.Element == Key {
      guard !self.isEmpty else {
        return []
      }
      var keysWeveSeen: Set<Key> = Set<Key>(minimumCapacity: keys.underestimatedCount)
      var keysToRemove: Set<Key> = []
      for key in keys where !keysWeveSeen.contains(key) {
        keysWeveSeen.insert(key)
        if let keyIndex = self.index(forKey: key) {
          let shouldPreserveEntry = try mutation(&self.values[keyIndex])
          if !shouldPreserveEntry {
            keysToRemove.insert(key)
          }
        }
      }
      if !keysToRemove.isEmpty {
        self.removeValues(
          forKeys: keysToRemove
        )
      }
      return keysToRemove
  }
  
  /// In-place updates `self` so that each `value` is *updated* in-situ (as an
  /// inout parameter) via `mapping(value)`, but possibly-also has its entry removed
  /// iff `mapping(value)` returns `false`.
  ///
  /// Note that `mutation` must return `true` for entries to keep and `false` for
  /// entries to reject.
  ///
  /// - parameter keys: Sequence of keys to examine
  /// - parameter mutation: Evaluated to (a) update each value and (b) decide to keep (`true`) or toss (`false`) the entry
  ///
  /// - returns: The number of removed entries
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceConditionallyMutateBareValuesWithKeyExtraction<C:Collection & SetAlgebra>(
    forKeys keys: C,
    _ mutation: (inout Value) throws -> Bool) rethrows -> Set<Key>
    where C.Element == Key {
      guard !self.isEmpty else {
        return []
      }
      // can directly built the returned set b/c by assumption we only ever
      // see each `key` exactly once:
      var keysToRemove: Set<Key> = []
      for key in keys {
        if let keyIndex = self.index(forKey: key) {
          let shouldPreserveEntry = try mutation(&self.values[keyIndex])
          if !shouldPreserveEntry {
            keysToRemove.insert(key)
          }
        }
      }
      if !keysToRemove.isEmpty {
        self.removeValues(
          forKeys: keysToRemove
        )
      }
      return keysToRemove
  }

  /// In-place updates `self` so that each `value` is *updated* in-situ (as an
  /// inout parameter) via `mapping(value)`, but possibly-also has its entry removed
  /// iff `mapping(value)` returns `false`.
  ///
  /// Note that `mutation` must return `true` for entries to keep and `false` for
  /// entries to reject.
  ///
  /// - parameter keys: Sequence of keys to examine
  /// - parameter mutation: Evaluated to (a) update each value and (b) decide to keep (`true`) or toss (`false`) the entry
  ///
  /// - returns: The number of removed entries
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceConditionallyMutateBareValues<S:Sequence>(
    forKeys keys: S,
    _ mutation: (inout Value) throws -> Bool) rethrows -> Int
    where S.Element == Key {
      guard !self.isEmpty else {
        return 0
      }
      var keysWeveSeen: Set<Key> = []
      var keysToRemove: Set<Key> = []
      for key in keys where !keysWeveSeen.contains(key) {
        keysWeveSeen.insert(key)
        if let keyIndex = self.index(forKey: key) {
          let shouldPreserveEntry = try mutation(&self.values[keyIndex])
          if !shouldPreserveEntry {
            keysToRemove.insert(key)
          }
        }
      }
      guard !keysToRemove.isEmpty else {
        return 0
      }
      return self.removeValues(
        forKeys: keysToRemove
      )
  }
  
  /// In-place updates `self` so that each `value` is *updated* in-situ (as an
  /// inout parameter) via `mapping(value)`, but possibly-also has its entry removed
  /// iff `mapping(value)` returns `false`.
  ///
  /// Note that `mutation` must return `true` for entries to keep and `false` for
  /// entries to reject.
  ///
  /// - parameter keys: Sequence of keys to examine
  /// - parameter mutation: Evaluated to (a) update each value and (b) decide to keep (`true`) or toss (`false`) the entry
  ///
  /// - returns: The number of removed entries
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceConditionallyMutateBareValues<C:Collection & SetAlgebra>(
    forKeys keys: C,
    _ mutation: (inout Value) throws -> Bool) rethrows -> Int
    where C.Element == Key {
      guard !self.isEmpty else {
        return 0
      }
      // can use an array b/c `C:SetAlgebra` implies we *should* see each key only once
      var keysToRemove: [Key] = []
      // don't need to check for already-seen keys b/c
      for key in keys {
        if let keyIndex = self.index(forKey: key) {
          let shouldPreserveEntry = try mutation(&self.values[keyIndex])
          if !shouldPreserveEntry {
            keysToRemove.append(key)
          }
        }
      }
      guard !keysToRemove.isEmpty else {
        return 0
      }
      return self.removeValues(
        forKeys: keysToRemove
      )
  }

  /// In-place updates `self` so that each `value` is *updated* in-situ (as an
  /// inout parameter) via `mapping(value)`, but possibly-also has its entry removed
  /// iff `mapping(value)` returns `false`.
  ///
  /// Note that `mutation` must return `true` for entries to keep and `false` for
  /// entries to reject.
  ///
  /// - parameter keys: Sequence of keys to examine
  /// - parameter mutation: Evaluated to (a) update each value and (b) decide to keep (`true`) or toss (`false`) the entry
  ///
  /// - returns: The number of removed entries
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceConditionallyMutateValues<S:Sequence>(
    forKeys keys: S,
    _ mutation: (Key, inout Value) throws -> Bool) rethrows -> Int
    where S.Element == Key {
    guard !self.isEmpty else {
      return 0
    }
    var keysWeveSeen: Set<Key> = Set<Key>(minimumCapacity: keys.underestimatedCount)
    var keysToRemove: Set<Key> = []
    for key in keys where !keysWeveSeen.contains(key) {
      keysWeveSeen.insert(key)
      if let keyIndex = self.index(forKey: key) {
        let shouldPreserveEntry = try mutation(key, &self.values[keyIndex])
        if !shouldPreserveEntry {
          keysToRemove.insert(key)
        }
      }
    }
    guard !keysToRemove.isEmpty else {
      return 0
    }
    return self.removeValues(
      forKeys: keysToRemove
    )
  }

  /// In-place updates `self` so that each `value` is *updated* in-situ (as an
  /// inout parameter) via `mapping(value)`, but possibly-also has its entry removed
  /// iff `mapping(value)` returns `false`.
  ///
  /// Note that `mutation` must return `true` for entries to keep and `false` for
  /// entries to reject.
  ///
  /// - parameter keys: Sequence of keys to examine
  /// - parameter mutation: Evaluated to (a) update each value and (b) decide to keep (`true`) or toss (`false`) the entry
  ///
  /// - returns: The number of removed entries
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceConditionallyMutateValues<C:Collection & SetAlgebra>(
    forKeys keys: C,
    _ mutation: (Key, inout Value) throws -> Bool) rethrows -> Int
    where C.Element == Key {
      guard !self.isEmpty else {
        return 0
      }
      // can use an array b/c `C:SetAlgebra` implies we *should* see each key only once
      var keysToRemove: [Key] = []
      // don't need to track already-seen keys, either:
      for key in keys {
        if let keyIndex = self.index(forKey: key) {
          let shouldPreserveEntry = try mutation(key, &self.values[keyIndex])
          if !shouldPreserveEntry {
            keysToRemove.append(key)
          }
        }
      }
      guard !keysToRemove.isEmpty else {
        return 0
      }
      return self.removeValues(
        forKeys: keysToRemove
      )
  }

  /// In-place updates `self` so that each `value` is, itself, in-place replaced
  /// by `mapping` (without looking @ the associated key). This is in-place b/c
  /// it replaces the contents of `self.values` but is "out of place" for the
  /// individual value updates.
  ///
  @inlinable
  mutating func inPlaceMapBareValues(_ mapping: (Value) throws -> Value) rethrows {
    guard !self.isEmpty else {
      return
    }
    for index in self.indices {
      self.values[index] = try mapping(self.values[index])
    }
  }

  /// In-place updates `self` so that each `value` is, itself, in-place either
  /// (a) replaced by the result of `mapping(value)` (which does not examine the
  /// removed key) or (b) has its entry removed whenever `mapping(value) == nil`.
  ///
  /// - parameter mapping: The mapping to apply returning mapped values (or `nil` for entries to discard).
  ///
  /// - returns: The number of removed entries, if any.
  ///
  /// - note: The removal-count isn't consist with `removeValue(forKey:)`, but is potentially more useful for my purposes.
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceConditionallyMapBareValues(_ mapping: (Value) throws -> Value?) rethrows -> Int {
    guard !self.isEmpty else {
      return 0
    }
    var keysToRemove: [Key] = []
    for index in self.indices {
      switch try mapping(self.values[index]) {
      case .none:
        keysToRemove.append(self.keys[index])
      case .some(let mappedValue):
        self.values[index] = mappedValue
      }
    }
    guard !keysToRemove.isEmpty else {
      return 0
    }
    return self.removeValues(
      forKeys: keysToRemove
    )
  }

  /// In-place updates `self` so that each `value` is *replaced* by `mapping(value)`.
  /// In other words, each value is replaced (in-situ) with a *new* value, and that
  /// new value is constructed with a view of the key.
  ///
  @inlinable
  mutating func inPlaceMapValues(_ mapping: (Key, Value) throws -> Value) rethrows {
    guard !self.isEmpty else {
      return
    }
    for index in self.indices {
      self.values[index] = try mapping(self.keys[index], self.values[index])
    }
  }
  
  /// In-place updates `self` so that each `value` is *replaced* by `mapping(value)`,
  /// or has the corresponding entry removed if `mapping(value)` evaluates to `nil`.
  ///
  /// - parameter mapping: The mapping to apply returning mapped values (or `nil` for entries to discard).
  ///
  /// - returns: The number of removed entries, if any.
  ///
  /// - note: The removal-count isn't consist with `removeValue(forKey:)`, but is potentially more useful for my purposes.
  ///
  @inlinable
  @discardableResult
  mutating func inPlaceConditionallyMapValues(_ mapping: (Key, Value) throws -> Value?) rethrows -> Int {
    guard !self.isEmpty else {
      return 0
    }
    var keysToRemove: [Key] = []
    for index in self.indices {
      let key = self.keys[index]
      switch try mapping(key, self.values[index]) {
      case .none:
        keysToRemove.append(key)
      case .some(let mappedValue):
        self.values[index] = mappedValue
      }
    }
    guard !keysToRemove.isEmpty else {
      return 0
    }
    return self.removeValues(
      forKeys: keysToRemove
    )
  }

}
