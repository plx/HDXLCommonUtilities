//
//  Dictionary+Extraction.swift
//

import Foundation

public extension Dictionary {
  
  // ------------------------------------------------------------------------ //
  // MARK: Extraction - By Entry Predicate
  // ------------------------------------------------------------------------ //
  
  /// Removes-and-returns a subdictionary with the entries s.t. `predicate(key,value) == true`.
  @inlinable
  mutating func extractEntriesSatisfying(predicate: (Key,Value) throws -> Bool) rethrows -> [Key:Value] {
    guard !self.isEmpty else {
      return [:]
    }
    var extracted: [Key:Value] = [Key:Value]()
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.keySet.isDisjoint(with: extracted.keySet)) }
    // /////////////////////////////////////////////////////////////////////////
    for (key,value) in self {
      if try predicate(key,value) {
        extracted[key] = value
      }
    }
    guard !extracted.isEmpty else {
      return extracted
    }
    self.removeValues(
      forKeys: extracted.keys
    )
    return extracted
  }
    
  /// Removes-and-returns a subdictionary with the entries s.t. `predicate(key,value) == false`.
  @inlinable
  mutating func extractEntriesFailing(predicate: (Key,Value) throws -> Bool) rethrows -> [Key:Value] {
    guard !self.isEmpty else {
      return [:]
    }
    var extracted: [Key:Value] = [Key:Value]()
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.keySet.isDisjoint(with: extracted.keySet)) }
    // /////////////////////////////////////////////////////////////////////////
    for (key,value) in self {
      if try !predicate(key,value) {
        extracted[key] = value
      }
    }
    guard !extracted.isEmpty else {
      return extracted
    }
    self.removeValues(
      forKeys: extracted.keys
    )
    return extracted
  }

  // ------------------------------------------------------------------------ //
  // MARK: Extraction - By Value Predicate
  // ------------------------------------------------------------------------ //

  /// Removes-and-returns a subdictionary with the entries s.t. `predicate(value) == true`.
  @inlinable
  mutating func extractEntriesWithValuesSatisfying(predicate: (Value) throws -> Bool) rethrows -> [Key:Value] {
    guard !self.isEmpty else {
      return [:]
    }
    var extracted: [Key:Value] = [Key:Value]()
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.keySet.isDisjoint(with: extracted.keySet)) }
    // /////////////////////////////////////////////////////////////////////////
    for (key,value) in self {
      if try predicate(value) {
        extracted[key] = value
      }
    }
    guard !extracted.isEmpty else {
      return extracted
    }
    self.removeValues(
      forKeys: extracted.keys
    )
    return extracted
  }
  
  /// Removes-and-returns a subdictionary with the entries s.t. `predicate(value) == value`.
  @inlinable
  mutating func extractEntriesWithValuesFailing(predicate: (Value) throws -> Bool) rethrows -> [Key:Value] {
    guard !self.isEmpty else {
      return [:]
    }
    var extracted: [Key:Value] = [Key:Value]()
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.keySet.isDisjoint(with: extracted.keySet)) }
    // /////////////////////////////////////////////////////////////////////////
    for (key,value) in self {
      if try !predicate(value) {
        extracted[key] = value
      }
    }
    guard !extracted.isEmpty else {
      return extracted
    }
    self.removeValues(
      forKeys: extracted.keys
    )
    return extracted
  }

  // ------------------------------------------------------------------------ //
  // MARK: Extraction - By Key Predicate
  // ------------------------------------------------------------------------ //

  /// Removes-and-returns a subdictionary with the entries s.t. `predicate(key) == true`.
  @inlinable
  mutating func extractEntriesWithKeysSatisfying(predicate: (Key) throws -> Bool) rethrows -> [Key:Value] {
    guard !self.isEmpty else {
      return [:]
    }
    var extracted: [Key:Value] = [Key:Value]()
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.keySet.isDisjoint(with: extracted.keySet)) }
    // /////////////////////////////////////////////////////////////////////////
    for (key,value) in self {
      if try predicate(key) {
        extracted[key] = value
      }
    }
    guard !extracted.isEmpty else {
      return extracted
    }
    self.removeValues(
      forKeys: extracted.keys
    )
    return extracted
  }
  
  /// Removes-and-returns a subdictionary with the entries s.t. `predicate(key) == false`.
  @inlinable
  mutating func extractEntriesWithKeysFailing(predicate: (Key) throws -> Bool) rethrows -> [Key:Value] {
    guard !self.isEmpty else {
      return [:]
    }
    var extracted: [Key:Value] = [Key:Value]()
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.keySet.isDisjoint(with: extracted.keySet)) }
    // /////////////////////////////////////////////////////////////////////////
    for (key,value) in self {
      if try !predicate(key) {
        extracted[key] = value
      }
    }
    guard !extracted.isEmpty else {
      return extracted
    }
    self.removeValues(
      forKeys: extracted.keys
    )
    return extracted
  }

  // ------------------------------------------------------------------------ //
  // MARK: Key-Set Extraction - By Entry Predicate
  // ------------------------------------------------------------------------ //

  /// Removes-and-returns a dictionary with the entries s.t. `predicate(key,value) == true`.
  @inlinable
  mutating func extractKeySetWhileRemovingEntriesSatisfying(predicate: (Key, Value) throws -> Bool) rethrows -> Set<Key> {
    guard !self.isEmpty else {
      return []
    }
    var extractedKeys: Set<Key> = []
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.keySet.isDisjoint(with: extractedKeys)) }
    // /////////////////////////////////////////////////////////////////////////
    for (key,value) in self {
      if try predicate(key,value) {
        extractedKeys.insert(key)
      }
    }
    guard !extractedKeys.isEmpty else {
      return extractedKeys
    }
    self.removeValues(
      forKeys: extractedKeys
    )
    return extractedKeys
  }

  /// Removes-and-returns a dictionary with the entries s.t. `predicate(key,value) == false`.
  @inlinable
  mutating func extractKeySetWhileRemovingEntriesFailing(predicate: (Key, Value) throws -> Bool) rethrows -> Set<Key> {
    guard !self.isEmpty else {
      return []
    }
    var extractedKeys: Set<Key> = []
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.keySet.isDisjoint(with: extractedKeys)) }
    // /////////////////////////////////////////////////////////////////////////
    for (key,value) in self {
      if try !predicate(key,value) {
        extractedKeys.insert(key)
      }
    }
    guard !extractedKeys.isEmpty else {
      return extractedKeys
    }
    self.removeValues(
      forKeys: extractedKeys
    )
    return extractedKeys
  }

  // ------------------------------------------------------------------------ //
  // MARK: Key-Set Extraction - By Value Predicate
  // ------------------------------------------------------------------------ //

  /// Removes-and-returns a dictionary with the entries s.t. `predicate(value) == true`.
  @inlinable
  mutating func extractKeySetWhileRemovingEntriesWithValuesSatisfying(predicate: (Value) throws -> Bool) rethrows -> Set<Key> {
    guard !self.isEmpty else {
      return []
    }
    var extractedKeys: Set<Key> = []
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.keySet.isDisjoint(with: extractedKeys)) }
    // /////////////////////////////////////////////////////////////////////////
    for (key,value) in self {
      if try predicate(value) {
        extractedKeys.insert(key)
      }
    }
    guard !extractedKeys.isEmpty else {
      return extractedKeys
    }
    self.removeValues(
      forKeys: extractedKeys
    )
    return extractedKeys
  }

  /// Removes-and-returns a dictionary with the entries s.t. `predicate(value) == false`.
  @inlinable
  mutating func extractKeySetWhileRemovingEntriesWithValuesFailing(predicate: (Value) throws -> Bool) rethrows -> Set<Key> {
    guard !self.isEmpty else {
      return []
    }
    var extractedKeys: Set<Key> = []
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.keySet.isDisjoint(with: extractedKeys)) }
    // /////////////////////////////////////////////////////////////////////////
    for (key,value) in self {
      if try !predicate(value) {
        extractedKeys.insert(key)
      }
    }
    guard !extractedKeys.isEmpty else {
      return extractedKeys
    }
    self.removeValues(
      forKeys: extractedKeys
    )
    return extractedKeys
  }

  // ------------------------------------------------------------------------ //
  // MARK: Key-Set Extraction - By Key Predicate
  // ------------------------------------------------------------------------ //

  /// Removes-and-returns a dictionary with the entries s.t. `predicate(key) == true`.
  @inlinable
  mutating func extractKeySetWhileRemovingEntriesWithKeysSatisfying(predicate: (Key) throws -> Bool) rethrows -> Set<Key> {
    guard !self.isEmpty else {
      return []
    }
    var extractedKeys: Set<Key> = []
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.keySet.isDisjoint(with: extractedKeys)) }
    // /////////////////////////////////////////////////////////////////////////
    for key in self.keys {
      if try predicate(key) {
        extractedKeys.insert(key)
      }
    }
    guard !extractedKeys.isEmpty else {
      return extractedKeys
    }
    self.removeValues(
      forKeys: extractedKeys
    )
    return extractedKeys
  }

  /// Removes-and-returns a dictionary with the entries s.t. `predicate(key) == false`.
  @inlinable
  mutating func extractKeySetWhileRemovingEntriesWithValuesFailing(predicate: (Key) throws -> Bool) rethrows -> Set<Key> {
    guard !self.isEmpty else {
      return []
    }
    var extractedKeys: Set<Key> = []
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.keySet.isDisjoint(with: extractedKeys)) }
    // /////////////////////////////////////////////////////////////////////////
    for key in self.keys {
      if try !predicate(key) {
        extractedKeys.insert(key)
      }
    }
    guard !extractedKeys.isEmpty else {
      return extractedKeys
    }
    self.removeValues(
      forKeys: extractedKeys
    )
    return extractedKeys
  }

}
