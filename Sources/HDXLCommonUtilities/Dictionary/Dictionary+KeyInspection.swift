//
//  Dictionary+KeyInspection.swift
//

import Foundation

public extension Dictionary {
  
  // ------------------------------------------------------------------------ //
  // MARK: KeySet - By Entry-Predicate
  // ------------------------------------------------------------------------ //

  /// The keys in `self` as a `Set<Key>`.
  @inlinable
  var keySet: Set<Key> {
    get {
      return Set<Key>(self.keys)
    }
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Keys - By Entry-Predicate
  // ------------------------------------------------------------------------ //

  /// Get an *array* of the *keys* for which `predicate(key,value)` evaluates-to `true`.
  @inlinable
  func keysForEntriesSatisfying(predicate: (Key,Value) -> Bool) -> [Key] {
    var result: [Key] = []
    for (key,value) in self where predicate(key,value) {
      result.append(key)
    }
    return result
  }

  /// Get an *array* of the *keys* for which `predicate(key,value)` evaluates-to `false`.
  @inlinable
  func keysForEntriesFailing(predicate: (Key,Value) -> Bool) -> [Key] {
    var result: [Key] = []
    for (key,value) in self where !predicate(key,value) {
      result.append(key)
    }
    return result
  }

  /// Get a *set* of the *keys* for which `predicate(key,value)` evaluates-to `true`.
  @inlinable
  func keySetForEntriesSatisfying(predicate: (Key,Value) -> Bool) -> Set<Key> {
    var result: Set<Key> = []
    for (key,value) in self where predicate(key,value) {
      result.insert(key)
    }
    return result
  }

  /// Get a *set* of the *keys* for which `predicate(key,value)` evaluates-to `false`.
  @inlinable
  func keySetForEntriesFailing(predicate: (Key,Value) -> Bool) -> Set<Key> {
    var result: Set<Key> = []
    for (key,value) in self where !predicate(key,value) {
      result.insert(key)
    }
    return result
  }

  // ------------------------------------------------------------------------ //
  // MARK: Keys - By Value-Predicate
  // ------------------------------------------------------------------------ //

  /// Get an *array* of the *keys* for which `predicate(value)` evaluates-to `true`.
  @inlinable
  func keysForValuesSatisfying(predicate: (Value) -> Bool) -> [Key] {
    var result: [Key] = []
    for (key,value) in self where predicate(value) {
      result.append(key)
    }
    return result
  }
  
  /// Get an *array* of the *keys* for which `predicate(value)` evaluates-to `false`.
  @inlinable
  func keysForValuesFailing(predicate: (Value) -> Bool) -> [Key] {
    var result: [Key] = []
    for (key,value) in self where !predicate(value) {
      result.append(key)
    }
    return result
  }

  /// Get a *set* of the *keys* for which `predicate(value)` evaluates-to `true`.
  @inlinable
  func keySetForValuesSatisfying(predicate: (Value) -> Bool) -> Set<Key> {
    var result: Set<Key> = []
    for (key,value) in self where predicate(value) {
      result.insert(key)
    }
    return result
  }
  
  /// Get a *set* of the *keys* for which `predicate(value)` evaluates-to `false`.
  @inlinable
  func keySetForValuesFailing(predicate: (Value) -> Bool) -> Set<Key> {
    var result: Set<Key> = []
    for (key,value) in self where !predicate(value) {
      result.insert(key)
    }
    return result
  }

  // ------------------------------------------------------------------------ //
  // MARK: Keys - By Key-Predicate
  // ------------------------------------------------------------------------ //
  
  /// Get an *array* of the *keys* for which `predicate(key)` evaluates-to `true`.
  @inlinable
  func keysSatisfying(predicate: (Key) -> Bool) -> [Key] {
    return self.keys.filter({ predicate($0) })
  }

  /// Get an *array* of the *keys* for which `predicate(key)` evaluates-to `false`.
  @inlinable
  func keysFailing(predicate: (Key) -> Bool) -> [Key] {
    return self.keys.filter({ !predicate($0) })
  }
  
  /// Get a *set* of the *keys* for which `predicate(key)` evaluates-to `true`.
  @inlinable
  func keySetForKeysSatisfying(predicate: (Key) -> Bool) -> Set<Key> {
    var result: Set<Key> = []
    for key in self.keys where predicate(key) {
      result.insert(key)
    }
    return result
  }

  /// Get a *set* of the *keys* for which `predicate(key)` evaluates-to `false`.
  @inlinable
  func keySetForKeysFailing(predicate: (Key) -> Bool) -> Set<Key> {
    var result: Set<Key> = []
    for key in self.keys where !predicate(key) {
      result.insert(key)
    }
    return result
  }

  
}
