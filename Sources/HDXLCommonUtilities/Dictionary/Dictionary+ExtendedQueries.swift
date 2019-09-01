//
//  Dictionary+ExtendedQueries.swift
//  

import Foundation

public extension Dictionary {
  
  /// Like `first(where:)` but returns only the `Key`.
  @inlinable
  func firstKeyForEntrySatisfying(_ predicate: (Key,Value) throws -> Bool) rethrows -> Key? {
    return try self.first(
      where: predicate
    )?.key
  }

  /// Like `first(where:)` but (a) returns only the `Key` and (b) returns the key for the first `false`.
  @inlinable
  func firstKeyForEntryFailing(_ predicate: (Key,Value) throws -> Bool) rethrows -> Key? {
    return try self.first() {
      (key, value) -> Bool
      in
      try !predicate(key, value)
    }?.key
  }

  /// Like `first(where:)` but (a) returns only the `Key` and (b) only examines the keys.
  @inlinable
  func firstKeySatisfying(_ predicate: (Key) throws -> Bool) rethrows -> Key? {
    return try self.keys.first(where: predicate)
  }

  /// Like `first(where:)` but (a) returns only the `Key`, (b) only examines the keys, and (c) returns the key for the first `false`.
  @inlinable
  func firstKeyFailing(_ predicate: (Key) throws -> Bool) rethrows -> Key? {
    return try self.keys.first() {
      (key: Key) -> Bool
      in
      return try !predicate(key)
    }
  }

  /// Like `first(where:)` but (a) returns only the `Key` and (b) only examines the values.
  @inlinable
  func firstKeyForValueSatisfying(_ predicate: (Value) throws -> Bool) rethrows -> Key? {
    return try self.first() {
      (_, value) -> Bool
      in
      try predicate(value)
    }?.key
  }
  
  /// Like `first(where:)` but (a) returns only the `Key`, (b) only examines the values, and (c) returns the key for the first `false`.
  @inlinable
  func firstKeyForValueFailing(_ predicate: (Value) throws -> Bool) rethrows -> Key? {
    return try self.first() {
      (_, value) -> Bool
      in
      try !predicate(value)
    }?.key
  }

}
