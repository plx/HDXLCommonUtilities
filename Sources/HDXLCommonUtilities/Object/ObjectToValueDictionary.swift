//
//  ObjectToValueDictionary.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionary - Definition
// -------------------------------------------------------------------------- //

/// Wrapper for an "object-to-value dictionary", wherein object identity is object equality.
///
/// Implemented as a wrapper around a `[ObjectWrapper<Key>:Value]`, but with
/// transparent wrapping/unwrapping of the `Key` (thereby hiding `ObjectWrapper` use).
@frozen
public struct ObjectToValueDictionary<Key:AnyObject,Value> {
  
  @usableFromInline
  internal typealias StorageKey = ObjectWrapper<Key>
  
  @usableFromInline
  internal typealias Storage = [StorageKey:Value]
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionary - Equatable
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionary : Equatable where Value:Equatable {
  
  @inlinable
  public static func ==(
    lhs: ObjectToValueDictionary<Key,Value>,
    rhs: ObjectToValueDictionary<Key,Value>) -> Bool {
    return lhs.storage == rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionary - Hashable
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionary : Hashable where Value:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionary - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionary : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "ObjectToValueDictionary: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionary - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionary : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ObjectToValueDictionary<\(String(reflecting: Key.self)),\(String(reflecting: Value.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionary - CustomReflectable
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionary : CustomReflectable {
  
  @inlinable
  public var customMirror: Mirror {
    get {
      return Mirror(
        self,
        children: ["storage": self.storage],
        displayStyle: .dictionary
      )
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionary - Codable
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionary : Codable where Key:Codable, Value:Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionary - Dictionary Emulation
// -------------------------------------------------------------------------- //

public extension ObjectToValueDictionary {
  
  @inlinable
  init() {
    self.init(
      storage: Storage()
    )
  }

  @inlinable
  init(minimumCapacity: Int) {
    self.init(
      storage: Storage(
        minimumCapacity: minimumCapacity
      )
    )
  }
  
  @inlinable
  init<S>(uniqueKeysWithValues: S)
    where
    S:Sequence,
    S.Element == (Key,Value) {
      self.init(
        storage: Storage(
          uniqueKeysWithValues: uniqueKeysWithValues.directlyMappedOnDemand() {
            (keyObject: Key, value: Value) -> (ObjectWrapper<Key>, Value)
            in
            return (
              ObjectWrapper<Key>(wrappedObject: keyObject),
              value
            )
          }
        )
      )
  }
  
  @inlinable
  init<S>(
    _ keysAndValues: S,
    uniquingKeysWith combine: (Value,Value) throws -> Value) rethrows
    where
    S:Sequence,
    S.Element == (Key,Value) {
      try self.init(
        storage: Storage(
          keysAndValues.directlyMappedOnDemand() {
            (keyObject: Key, value: Value) -> (ObjectWrapper<Key>, Value)
            in
            return (
              ObjectWrapper<Key>(wrappedObject: keyObject),
              value
            )
          },
          uniquingKeysWith: combine
        )
      )
  }
  
  @inlinable
  var capacity: Int {
    get {
      return self.storage.capacity
    }
  }
  
  @inlinable
  subscript(key: Key) -> Value? {
    get {
      return self.storage[ObjectWrapper<Key>(wrappedObject: key)]
    }
    set {
      self.storage[ObjectWrapper<Key>(wrappedObject: key)] = newValue
    }
  }
  
  @inlinable
  subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value {
    get {
      return self.storage[
        ObjectWrapper<Key>(wrappedObject: key),
        default: defaultValue()
      ]
    }
    set {
      self.storage[
        ObjectWrapper<Key>(wrappedObject: key),
        default: defaultValue()
      ] = newValue
    }
  }
  
  @inlinable
  func index(forKey key: Key) -> Index? {
    return Index(
      storage: self.storage.index(
        forKey: ObjectWrapper<Key>(
          wrappedObject: key
        )
      )
    )
  }
  
  @inlinable
  var first: (key: Key, value: Value)? {
    get {
      guard let result = self.storage.first else {
        return nil
      }
      return (
        result.key.wrappedObject,
        result.value
      )
    }
  }
  
  @inlinable
  func randomElement() -> (key: Key, value: Value)? {
    guard let result = self.storage.randomElement() else {
      return nil
    }
    return (
      result.key.wrappedObject,
      result.value
    )
  }

  @inlinable
  func randomElement<T>(using generator: inout T) -> (key: Key, value: Value)?
    where T:RandomNumberGenerator {
      guard let result = self.storage.randomElement(using: &generator) else {
        return nil
      }
      return (
        result.key.wrappedObject,
        result.value
      )
  }
  
  @inlinable
  @discardableResult
  mutating func updateValue(
    _ value: Value,
    forKey key: Key) -> Value? {
    return self.storage.updateValue(
      value,
      forKey: ObjectWrapper<Key>(wrappedObject: key)
    )
  }
  
  @inlinable
  mutating func merge(
    _ other: ObjectToValueDictionary<Key,Value>,
    uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows {
    try self.storage.merge(
      other.storage,
      uniquingKeysWith: combine
    )
  }
  
  @inlinable
  mutating func merge<S>(
    _ other: S,
    uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows
    where S : Sequence, S.Element == (Key, Value) {
      try self.storage.merge(
        other.directlyMappedOnDemand() {
          (key: Key, value: Value) -> (ObjectWrapper<Key>,Value)
          in
          return (
            ObjectWrapper<Key>(wrappedObject: key),
            value
          )
        },
        uniquingKeysWith: combine
      )
  }
  
  @inlinable
  func merging(
    _ other: ObjectToValueDictionary<Key,Value>,
    uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> ObjectToValueDictionary<Key,Value> {
    return try ObjectToValueDictionary<Key,Value>(
      storage: self.storage.merging(
        other.storage,
        uniquingKeysWith: combine
      )
    )
  }
  
  @inlinable
  func merging<S>(
    _ other: S,
    uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> ObjectToValueDictionary<Key,Value>
    where S : Sequence, S.Element == (Key, Value) {
      return try ObjectToValueDictionary<Key,Value>(
        storage: self.storage.merging(
          other.directlyMappedOnDemand() {
            (key: Key, value: Value) -> (ObjectWrapper<Key>,Value)
            in
            return (
              ObjectWrapper<Key>(wrappedObject: key),
              value
            )
          },
          uniquingKeysWith: combine
        )
      )
  }

  @inlinable
  mutating func reserveCapacity(_ minimumCapacity: Int) {
    self.storage.reserveCapacity(minimumCapacity)
  }

  @inlinable
  func filter(
    _ isIncluded: (Key, Value) throws -> Bool) rethrows -> ObjectToValueDictionary<Key,Value> {
    return try ObjectToValueDictionary<Key,Value>(
      storage: self.storage.filter() {
        (keyWrapper: ObjectWrapper<Key>, value: Value) -> Bool
        in
        return try isIncluded(
          keyWrapper.wrappedObject,
          value
        )
      }
    )
  }

  @inlinable
  @discardableResult
  mutating func remove(at index: Index) -> (key: Key, value: Value) {
    let result = self.storage.remove(
      at: index.storage
    )
    return (
      result.key.wrappedObject,
      result.value
    )
  }
  
  @discardableResult
  mutating func removeValue(forKey key: Key) -> Value? {
    return self.storage.removeValue(
      forKey: ObjectWrapper<Key>(
        wrappedObject: key
      )
    )
  }

  
  
  @inlinable
  mutating func removeAll(keepingCapacity: Bool = false) {
    self.storage.removeAll(
      keepingCapacity: keepingCapacity
    )
  }

  typealias Keys = ObjectToValueDictionaryKeys<Key,Value>
  typealias Values = ObjectToValueDictionaryValues<Key,Value>
  
  @inlinable
  var keys: Keys {
    get {
      return Keys(
        storage: self.storage.keys
      )
    }
  }

  @inlinable
  var values: Values {
    get {
      return Values(
        storage: self.storage.values
      )
    }
    set {
      self.storage.values = newValue.storage
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionary - Collection
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionary : Collection {
  
  public typealias Index = ObjectToValueDictionaryIndex<Key,Value>
  public typealias Element = (key: Key, value: Value)
  
  @inlinable
  public var isEmpty: Bool {
    get {
      return self.storage.isEmpty
    }
  }
  
  @inlinable
  public var count: Int {
    get {
      return self.storage.count
    }
  }
  
  @inlinable
  public var startIndex: Index {
    get {
      return Index(storage: self.storage.startIndex)
    }
  }
  
  @inlinable
  public var endIndex: Index {
    get {
      return Index(storage: self.storage.endIndex)
    }
  }
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      let result = self.storage[index.storage]
      return (
        result.key.wrappedObject,
        result.value
      )
    }
  }
  
  @inlinable
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    return self.storage.distance(
      from: start.storage,
      to: end.storage
    )
  }
  
  @inlinable
  public func index(after index: Index) -> Index {
    return Index(
      storage: self.storage.index(
        after: index.storage
      )
    )
  }
  
  @inlinable
  public func formIndex(after i: inout Index) {
    self.storage.formIndex(after: &i.storage)
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int) -> Index {
    return Index(
      storage: self.storage.index(
        i.storage,
        offsetBy: distance
      )
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Index,
    offsetBy distance: Int) {
    self.storage.formIndex(
      &i.storage,
      offsetBy: distance
    )
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Index? {
    return Index(
      storage: self.storage.index(
        i.storage,
        offsetBy: distance,
        limitedBy: limit.storage
      )
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Bool {
    return self.storage.formIndex(
      &i.storage,
      offsetBy: distance,
      limitedBy: limit.storage
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionary - ExpressibleByDictionaryLiteral
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionary : ExpressibleByDictionaryLiteral {
  
  public typealias DictionaryLiteralElement = (Key,Value)
  
  @inlinable
  public init(dictionaryLiteral elements: DictionaryLiteralElement...) {
    self.init(
      storage: Storage(
        uniqueKeysWithValues: elements.directlyMappedOnDemand() {
          (key: Key, value: Value) -> (ObjectWrapper<Key>, Value)
          in
          return (
            ObjectWrapper<Key>(wrappedObject: key),
            value
          )
        }
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryIndex - Definition
// -------------------------------------------------------------------------- //

@frozen
public struct ObjectToValueDictionaryIndex<Key:AnyObject,Value> {
  
  @usableFromInline
  internal typealias Storage = ObjectToValueDictionary<Key,Value>.Storage.Index
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  init(storage: Storage) {
    self.storage = storage
  }

  @inlinable
  init?(storage: Storage?) {
    guard let concreteStorage = storage else {
      return nil
    }
    self.init(
      storage: concreteStorage
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryIndex - Equatable
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionaryIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: ObjectToValueDictionaryIndex<Key,Value>,
    rhs: ObjectToValueDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage == rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryIndex - Comparable
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionaryIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: ObjectToValueDictionaryIndex<Key,Value>,
    rhs: ObjectToValueDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage < rhs.storage
  }

  @inlinable
  public static func >(
    lhs: ObjectToValueDictionaryIndex<Key,Value>,
    rhs: ObjectToValueDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: ObjectToValueDictionaryIndex<Key,Value>,
    rhs: ObjectToValueDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: ObjectToValueDictionaryIndex<Key,Value>,
    rhs: ObjectToValueDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryIndex - Hashable
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionaryIndex : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionaryIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "ObjectToValueDictionaryIndex: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionaryIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ObjectToValueDictionaryIndex<\(String(reflecting: Key.self)),\(String(reflecting: Value.self))>(storage: \(String(describing: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryKeys - Definition
// -------------------------------------------------------------------------- //

/// *Immutable* view into the *keys* of an `ObjectToValueDictionary`.
@frozen
public struct ObjectToValueDictionaryKeys<Key:AnyObject,Value> {
  
  @usableFromInline
  internal typealias Storage = ObjectToValueDictionary<Key,Value>.Storage.Keys
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryKeys - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionaryKeys : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "ObjectToValueDictionaryKeys: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryKeys - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionaryKeys : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ObjectToValueDictionaryKeys<\(String(reflecting: Key.self)),\(String(reflecting: Value.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryKeys - Collection
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionaryKeys : Collection {
  
  public typealias Index = ObjectToValueDictionaryIndex<Key,Value>
  public typealias Element = Key
  
  @inlinable
  public var isEmpty: Bool {
    get {
      return self.storage.isEmpty
    }
  }
  
  @inlinable
  public var count: Int {
    get {
      return self.storage.count
    }
  }
  
  @inlinable
  public var startIndex: Index {
    get {
      return Index(storage: self.storage.startIndex)
    }
  }
  
  @inlinable
  public var endIndex: Index {
    get {
      return Index(storage: self.storage.endIndex)
    }
  }
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      return self.storage[index.storage].wrappedObject
    }
  }
  
  @inlinable
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    return self.storage.distance(
      from: start.storage,
      to: end.storage
    )
  }
  
  @inlinable
  public func index(after index: Index) -> Index {
    return Index(
      storage: self.storage.index(
        after: index.storage
      )
    )
  }
  
  @inlinable
  public func formIndex(after i: inout Index) {
    self.storage.formIndex(after: &i.storage)
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int) -> Index {
    return Index(
      storage: self.storage.index(
        i.storage,
        offsetBy: distance
      )
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Index,
    offsetBy distance: Int) {
    self.storage.formIndex(
      &i.storage,
      offsetBy: distance
    )
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Index? {
    return Index(
      storage: self.storage.index(
        i.storage,
        offsetBy: distance,
        limitedBy: limit.storage
      )
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Bool {
    return self.storage.formIndex(
      &i.storage,
      offsetBy: distance,
      limitedBy: limit.storage
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryValues - Definition
// -------------------------------------------------------------------------- //

/// *Mutable* view into the *values* of an `ObjectToValueDictionary`.
@frozen
public struct ObjectToValueDictionaryValues<Key:AnyObject,Value> {
  
  @usableFromInline
  internal typealias Storage = ObjectToValueDictionary<Key,Value>.Storage.Values
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryValues - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionaryValues : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "ObjectToValueDictionaryValues: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryValues - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionaryValues : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ObjectToValueDictionaryValues<\(String(reflecting: Key.self)),\(String(reflecting: Value.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToValueDictionaryValues - MutableCollection
// -------------------------------------------------------------------------- //

extension ObjectToValueDictionaryValues : MutableCollection {
  
  public typealias Index = ObjectToValueDictionaryIndex<Key,Value>
  public typealias Element = Value
  
  @inlinable
  public var isEmpty: Bool {
    get {
      return self.storage.isEmpty
    }
  }
  
  @inlinable
  public var count: Int {
    get {
      return self.storage.count
    }
  }
  
  @inlinable
  public var startIndex: Index {
    get {
      return Index(storage: self.storage.startIndex)
    }
  }
  
  @inlinable
  public var endIndex: Index {
    get {
      return Index(storage: self.storage.endIndex)
    }
  }
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      return self.storage[index.storage]
    }
    set {
      self.storage[index.storage] = newValue
    }
  }
  
  @inlinable
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    return self.storage.distance(
      from: start.storage,
      to: end.storage
    )
  }
  
  @inlinable
  public func index(after index: Index) -> Index {
    return Index(
      storage: self.storage.index(
        after: index.storage
      )
    )
  }
  
  @inlinable
  public func formIndex(after i: inout Index) {
    self.storage.formIndex(after: &i.storage)
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int) -> Index {
    return Index(
      storage: self.storage.index(
        i.storage,
        offsetBy: distance
      )
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Index,
    offsetBy distance: Int) {
    self.storage.formIndex(
      &i.storage,
      offsetBy: distance
    )
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Index? {
    return Index(
      storage: self.storage.index(
        i.storage,
        offsetBy: distance,
        limitedBy: limit.storage
      )
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Bool {
    return self.storage.formIndex(
      &i.storage,
      offsetBy: distance,
      limitedBy: limit.storage
    )
  }
  
}
