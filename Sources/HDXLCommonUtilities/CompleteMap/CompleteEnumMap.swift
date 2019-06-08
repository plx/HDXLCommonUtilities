//
//  CompleteEnumMap.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: CompleteEnumMap - Definition
// -------------------------------------------------------------------------- //

/// Special-purpose `CompleteMap` implementation for use with functions defined against `CaseIterable ` enums.
///
/// - note: For enums with very large cases you may prefer `CompleteLazyEnumMap`.
/// - warning: Validation logic *requires* `Key`'s `allCases` to have a *stable* iteration order.
public struct CompleteEnumMap<Key,Value>
  where
  Key: Equatable & CaseIterable {
  
  @usableFromInline
  internal typealias Entry = Pair<Key,Value>
  
  @usableFromInline
  internal typealias Storage = [Entry]
  
  @usableFromInline
  internal var storage: Storage
  
  @usableFromInline
  internal init(storage: Storage) {
    defer { assert(self.isValid) }
    self.storage = storage
  }
  
  @inlinable
  public init(mapping: (Key) -> Value) {
    self.init(
      storage: Key.allCases.map() {
        (key: Key) -> Entry
        in
        Entry(
          key: key,
          value: mapping(key)
        )
      }
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteEnumMap - Equatable
// -------------------------------------------------------------------------- //

extension CompleteEnumMap : Validatable {

  @inlinable
  public var isValid: Bool {
    get {
      let keyCases = Key.allCases
      guard
        keyCases.count == self.storage.count,
        zip(keyCases,self.storage).allSatisfy({
          (key: Key, entry: Entry) -> Bool
          in
          key == entry.key
        }) else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteEnumMap - Equatable
// -------------------------------------------------------------------------- //

extension CompleteEnumMap : Equatable where Value: Equatable {
  
  @inlinable
  public static func ==(
    lhs: CompleteEnumMap<Key,Value>,
    rhs: CompleteEnumMap<Key,Value>) -> Bool {
    return lhs.storage == rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteEnumMap - Hashable
// -------------------------------------------------------------------------- //

extension CompleteEnumMap : Hashable where Key:Hashable, Value: Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteEnumMap - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension CompleteEnumMap : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      let entryDescriptions = self.storage
        .lazy
        .map({
          (entry) -> String
          in
          "(\(String(describing: entry.key)), \(String(describing: entry.value)))"
        })
        .joined(separator: ", ")
      return "[ \(entryDescriptions) ]"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteEnumMap - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension CompleteEnumMap : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      let entryDescriptions = self.storage
        .lazy
        .map({
          (entry) -> String
          in
          "(\(String(reflecting: entry.key)), \(String(reflecting: entry.value)))"
        })
        .joined(separator: ", ")
      return "CompleteEnumMap<\(String(reflecting: Key.self)), \(String(reflecting: Value.self))>(storage: [ \(entryDescriptions) ])"
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: CompleteEnumMap - Codable
// -------------------------------------------------------------------------- //

extension CompleteEnumMap : Codable where Key:Codable, Value:Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: CompleteEnumMap - CompleteMap
// -------------------------------------------------------------------------- //

extension CompleteEnumMap : CompleteMap {
  
  @inlinable
  public subscript(key: Key) -> Value {
    get {
      for entry in self.storage where key == entry.key {
        return entry.value
      }
      preconditionFailure(
        """
        Couldn't find value for \(String(reflecting: key)) in supposedly-complete enum map \(String(reflecting: self))!
        """
      )
    }
  }
  
}
