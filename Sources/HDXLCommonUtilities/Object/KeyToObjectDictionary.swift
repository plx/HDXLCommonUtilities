//
//  KeyToObjectDictionary.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionary - Definition
// -------------------------------------------------------------------------- //

/// Wrapper for an "key-to-object dictionary", wherein object identity is object equality.
///
/// Implemented as a wrapper around a `[Key:ObjectWrapper<Value>]`, but with the
/// wrapper transparently wrapping/unwrapping the `Value`s.
@frozen
public struct KeyToObjectDictionary<Key:Hashable,Value:AnyObject> {
  
  @usableFromInline
  internal typealias StorageValue = ObjectWrapper<Value>
  
  @usableFromInline
  internal typealias Storage = [Key:StorageValue]
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionary - Equatable
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionary : Equatable {
  
  @inlinable
  public static func ==(
    lhs: KeyToObjectDictionary<Key,Value>,
    rhs: KeyToObjectDictionary<Key,Value>) -> Bool {
    return lhs.storage == rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionary - Hashable
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionary : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionary - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionary : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "KeyToObjectDictionary: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionary - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionary : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "KeyToObjectDictionary<\(String(reflecting: Key.self)),\(String(reflecting: Value.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionary - CustomReflectable
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionary : CustomReflectable {
  
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
// MARK: KeyToObjectDictionary - Codable
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionary : Codable where Key:Codable, Value:Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionary - Dictionary Emulation
// -------------------------------------------------------------------------- //

public extension KeyToObjectDictionary {
  
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
            (key: Key, valueObject: Value) -> (Key, ObjectWrapper<Value>)
            in
            return (
              key,
              ObjectWrapper<Value>(wrappedObject: valueObject)
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
            (key: Key, valueObject: Value) -> (Key, ObjectWrapper<Value>)
            in
            return (
              key,
              ObjectWrapper<Value>(wrappedObject: valueObject)
            )
          },
          uniquingKeysWith: {
            (lWrapper: ObjectWrapper<Value>, rWrapper: ObjectWrapper<Value>) -> ObjectWrapper<Value>
            in
            return ObjectWrapper<Value>(
              wrappedObject: try combine(
                lWrapper.wrappedObject,
                rWrapper.wrappedObject
              )
            )
          }
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
      return self.storage[key]?.wrappedObject
    }
    set {
      self.storage[key] = ObjectWrapper<Value>(wrappedObject: newValue)
    }
  }
  
  @inlinable
  subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value {
    get {
      return self.storage[
        key,
        default: ObjectWrapper<Value>(wrappedObject: defaultValue())
      ].wrappedObject
    }
    set {
      self.storage[
        key,
        default: ObjectWrapper<Value>(wrappedObject: defaultValue())
      ] = ObjectWrapper<Value>(wrappedObject: newValue)
    }
  }
  
  @inlinable
  func index(forKey key: Key) -> Index? {
    return Index(
      storage: self.storage.index(
        forKey: key
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
        result.key,
        result.value.wrappedObject
      )
    }
  }
  
  @inlinable
  func randomElement() -> (key: Key, value: Value)? {
    guard let result = self.storage.randomElement() else {
      return nil
    }
    return (
      result.key,
      result.value.wrappedObject
    )
  }

  @inlinable
  func randomElement<T>(using generator: inout T) -> (key: Key, value: Value)?
    where T:RandomNumberGenerator {
      guard let result = self.storage.randomElement(using: &generator) else {
        return nil
      }
      return (
        result.key,
        result.value.wrappedObject
      )
  }
  
  @inlinable
  @discardableResult
  mutating func updateValue(
    _ value: Value,
    forKey key: Key) -> Value? {
    return self.storage.updateValue(
      ObjectWrapper<Value>(wrappedObject: value),
      forKey: key
    )?.wrappedObject
  }
  
  @inlinable
  mutating func merge(
    _ other: KeyToObjectDictionary<Key,Value>,
    uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows {
    try self.storage.merge(
      other.storage,
      uniquingKeysWith: {
        (lWrapper: ObjectWrapper<Value>, rWrapper: ObjectWrapper<Value>) -> ObjectWrapper<Value>
        in
        return ObjectWrapper<Value>(
          wrappedObject: try combine(
            lWrapper.wrappedObject,
            rWrapper.wrappedObject
          )
        )
      }
    )
  }
  
  @inlinable
  mutating func merge<S>(
    _ other: S,
    uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows
    where S : Sequence, S.Element == (Key, Value) {
      try self.storage.merge(
        other.directlyMappedOnDemand() {
          (key: Key, value: Value) -> (Key,ObjectWrapper<Value>)
          in
          return (
            key,
            ObjectWrapper<Value>(wrappedObject: value)
          )
        },
        uniquingKeysWith: {
          (lWrapper: ObjectWrapper<Value>, rWrapper: ObjectWrapper<Value>) -> ObjectWrapper<Value>
          in
          return ObjectWrapper<Value>(
            wrappedObject: try combine(
              lWrapper.wrappedObject,
              rWrapper.wrappedObject
            )
          )
        }
      )
  }
  
  @inlinable
  func merging(
    _ other: KeyToObjectDictionary<Key,Value>,
    uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> KeyToObjectDictionary<Key,Value> {
    return try KeyToObjectDictionary<Key,Value>(
      storage: self.storage.merging(
        other.storage,
        uniquingKeysWith: {
          (lWrapper: ObjectWrapper<Value>, rWrapper: ObjectWrapper<Value>) -> ObjectWrapper<Value>
          in
          return ObjectWrapper<Value>(
            wrappedObject: try combine(
              lWrapper.wrappedObject,
              rWrapper.wrappedObject
            )
          )
        }
      )
    )
  }
  
  @inlinable
  func merging<S>(
    _ other: S,
    uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> KeyToObjectDictionary<Key,Value>
    where S : Sequence, S.Element == (Key, Value) {
      return try KeyToObjectDictionary<Key,Value>(
        storage: self.storage.merging(
          other.directlyMappedOnDemand() {
            (key: Key, value: Value) -> (Key,ObjectWrapper<Value>)
            in
            return (
              key,
              ObjectWrapper<Value>(wrappedObject: value)
            )
          },
          uniquingKeysWith: {
            (lWrapper: ObjectWrapper<Value>, rWrapper: ObjectWrapper<Value>) -> ObjectWrapper<Value>
            in
            return ObjectWrapper<Value>(
              wrappedObject: try combine(
                lWrapper.wrappedObject,
                rWrapper.wrappedObject
              )
            )
          }
        )
      )
  }

  @inlinable
  mutating func reserveCapacity(_ minimumCapacity: Int) {
    self.storage.reserveCapacity(minimumCapacity)
  }

  @inlinable
  func filter(
    _ isIncluded: (Key, Value) throws -> Bool) rethrows -> KeyToObjectDictionary<Key,Value> {
    return try KeyToObjectDictionary<Key,Value>(
      storage: self.storage.filter() {
        (key: Key, valueWrapper: ObjectWrapper<Value>) -> Bool
        in
        return try isIncluded(
          key,
          valueWrapper.wrappedObject
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
      result.key,
      result.value.wrappedObject
    )
  }
  
  @discardableResult
  mutating func removeValue(forKey key: Key) -> Value? {
    return self.storage.removeValue(
      forKey: key
    )?.wrappedObject
  }

  
  
  @inlinable
  mutating func removeAll(keepingCapacity: Bool = false) {
    self.storage.removeAll(
      keepingCapacity: keepingCapacity
    )
  }

  typealias Keys = KeyToObjectDictionaryKeys<Key,Value>
  typealias Values = KeyToObjectDictionaryValues<Key,Value>
  
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
// MARK: KeyToObjectDictionary - Collection
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionary : Collection {
  
  public typealias Index = KeyToObjectDictionaryIndex<Key,Value>
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
        result.key,
        result.value.wrappedObject
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
// MARK: KeyToObjectDictionary - ExpressibleByDictionaryLiteral
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionary : ExpressibleByDictionaryLiteral {
  
  public typealias DictionaryLiteralElement = (Key,Value)
  
  @inlinable
  public init(dictionaryLiteral elements: DictionaryLiteralElement...) {
    self.init(
      storage: Storage(
        uniqueKeysWithValues: elements.directlyMappedOnDemand() {
          (key: Key, value: Value) -> (Key, ObjectWrapper<Value>)
          in
          return (
            key,
            ObjectWrapper<Value>(wrappedObject: value)
          )
        }
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionaryIndex - Definition
// -------------------------------------------------------------------------- //

@frozen
public struct KeyToObjectDictionaryIndex<Key:Hashable,Value:AnyObject> {
  
  @usableFromInline
  internal typealias Storage = KeyToObjectDictionary<Key,Value>.Storage.Index
  
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
// MARK: KeyToObjectDictionaryIndex - Equatable
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionaryIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: KeyToObjectDictionaryIndex<Key,Value>,
    rhs: KeyToObjectDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage == rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionaryIndex - Comparable
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionaryIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: KeyToObjectDictionaryIndex<Key,Value>,
    rhs: KeyToObjectDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage < rhs.storage
  }

  @inlinable
  public static func >(
    lhs: KeyToObjectDictionaryIndex<Key,Value>,
    rhs: KeyToObjectDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: KeyToObjectDictionaryIndex<Key,Value>,
    rhs: KeyToObjectDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: KeyToObjectDictionaryIndex<Key,Value>,
    rhs: KeyToObjectDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionaryIndex - Hashable
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionaryIndex : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionaryIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionaryIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "KeyToObjectDictionaryIndex: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionaryIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionaryIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "KeyToObjectDictionaryIndex<\(String(reflecting: Key.self)),\(String(reflecting: Value.self))>(storage: \(String(describing: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionaryKeys - Definition
// -------------------------------------------------------------------------- //

/// *Immutable* view into the *keys* of an `KeyToObjectDictionary`.
@frozen
public struct KeyToObjectDictionaryKeys<Key:Hashable,Value:AnyObject> {
  
  @usableFromInline
  internal typealias Storage = KeyToObjectDictionary<Key,Value>.Storage.Keys
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionaryKeys - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionaryKeys : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "KeyToObjectDictionaryKeys: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionaryKeys - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionaryKeys : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "KeyToObjectDictionaryKeys<\(String(reflecting: Key.self)),\(String(reflecting: Value.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionaryKeys - Collection
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionaryKeys : Collection {
  
  public typealias Index = KeyToObjectDictionaryIndex<Key,Value>
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
      return self.storage[index.storage]
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
// MARK: KeyToObjectDictionaryValues - Definition
// -------------------------------------------------------------------------- //

/// *Mutable* view into the *values* of an `KeyToObjectDictionary`.
@frozen
public struct KeyToObjectDictionaryValues<Key:Hashable,Value:AnyObject> {
  
  @usableFromInline
  internal typealias Storage = KeyToObjectDictionary<Key,Value>.Storage.Values
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionaryValues - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionaryValues : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "KeyToObjectDictionaryValues: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionaryValues - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionaryValues : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "KeyToObjectDictionaryValues<\(String(reflecting: Key.self)),\(String(reflecting: Value.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: KeyToObjectDictionaryValues - MutableCollection
// -------------------------------------------------------------------------- //

extension KeyToObjectDictionaryValues : MutableCollection {
  
  public typealias Index = KeyToObjectDictionaryIndex<Key,Value>
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
      return self.storage[index.storage].wrappedObject
    }
    set {
      self.storage[index.storage] = ObjectWrapper<Element>(
        wrappedObject: newValue
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
