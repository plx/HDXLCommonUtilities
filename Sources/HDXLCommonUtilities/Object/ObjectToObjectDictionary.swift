//
//  ObjectToObjectDictionary.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionary - Definition
// -------------------------------------------------------------------------- //

/// Wrapper for an "object-to-object dictionary", wherein object identity is object equality.
///
/// Implemented as a wrapper around a `[ObjectWrapper<Key>:ObjectWrapper<Value>]`,
/// with the wrapper transparently wrapping/unwrapping the `Key`s and `Value`s.
@frozen
public struct ObjectToObjectDictionary<Key:AnyObject,Value:AnyObject> {
  
  @usableFromInline
  internal typealias StorageKey = ObjectWrapper<Key>

  @usableFromInline
  internal typealias StorageValue = ObjectWrapper<Value>
  
  @usableFromInline
  internal typealias Storage = [StorageKey:StorageValue]
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionary - Equatable
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionary : Equatable {
  
  @inlinable
  public static func ==(
    lhs: ObjectToObjectDictionary<Key,Value>,
    rhs: ObjectToObjectDictionary<Key,Value>) -> Bool {
    return lhs.storage == rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionary - Hashable
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionary : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionary - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionary : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "ObjectToObjectDictionary: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionary - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionary : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ObjectToObjectDictionary<\(String(reflecting: Key.self)),\(String(reflecting: Value.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionary - CustomReflectable
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionary : CustomReflectable {
  
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
// MARK: ObjectToObjectDictionary - Codable
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionary : Codable where Key:Codable, Value:Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionary - Dictionary Emulation
// -------------------------------------------------------------------------- //

public extension ObjectToObjectDictionary {
  
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
            (keyObject: Key, valueObject: Value) -> (ObjectWrapper<Key>, ObjectWrapper<Value>)
            in
            return (
              ObjectWrapper<Key>(wrappedObject: keyObject),
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
            (keyObject: Key, valueObject: Value) -> (ObjectWrapper<Key>, ObjectWrapper<Value>)
            in
            return (
              ObjectWrapper<Key>(wrappedObject: keyObject),
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
      return self.storage[ObjectWrapper<Key>(wrappedObject: key)]?.wrappedObject
    }
    set {
      self.storage[ObjectWrapper<Key>(wrappedObject: key)] = ObjectWrapper<Value>(wrappedObject: newValue)
    }
  }
  
  @inlinable
  subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value {
    get {
      return self.storage[
        ObjectWrapper<Key>(wrappedObject: key),
        default: ObjectWrapper<Value>(wrappedObject: defaultValue())
      ].wrappedObject
    }
    set {
      self.storage[
        ObjectWrapper<Key>(wrappedObject: key),
        default: ObjectWrapper<Value>(wrappedObject: defaultValue())
      ] = ObjectWrapper<Value>(wrappedObject: newValue)
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
      result.key.wrappedObject,
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
        result.key.wrappedObject,
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
      forKey: ObjectWrapper<Key>(wrappedObject: key)
    )?.wrappedObject
  }
  
  @inlinable
  mutating func merge(
    _ other: ObjectToObjectDictionary<Key,Value>,
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
          (key: Key, value: Value) -> (ObjectWrapper<Key>,ObjectWrapper<Value>)
          in
          return (
            ObjectWrapper<Key>(wrappedObject: key),
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
    _ other: ObjectToObjectDictionary<Key,Value>,
    uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> ObjectToObjectDictionary<Key,Value> {
    return try ObjectToObjectDictionary<Key,Value>(
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
    uniquingKeysWith combine: (Value, Value) throws -> Value) rethrows -> ObjectToObjectDictionary<Key,Value>
    where S : Sequence, S.Element == (Key, Value) {
      return try ObjectToObjectDictionary<Key,Value>(
        storage: self.storage.merging(
          other.directlyMappedOnDemand() {
            (key: Key, value: Value) -> (ObjectWrapper<Key>,ObjectWrapper<Value>)
            in
            return (
              ObjectWrapper<Key>(wrappedObject: key),
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
    _ isIncluded: (Key, Value) throws -> Bool) rethrows -> ObjectToObjectDictionary<Key,Value> {
    return try ObjectToObjectDictionary<Key,Value>(
      storage: self.storage.filter() {
        (keyWrapper: ObjectWrapper<Key>, valueWrapper: ObjectWrapper<Value>) -> Bool
        in
        return try isIncluded(
          keyWrapper.wrappedObject,
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
      result.key.wrappedObject,
      result.value.wrappedObject
    )
  }
  
  @discardableResult
  mutating func removeValue(forKey key: Key) -> Value? {
    return self.storage.removeValue(
      forKey: ObjectWrapper<Key>(
        wrappedObject: key
      )
    )?.wrappedObject
  }

  
  
  @inlinable
  mutating func removeAll(keepingCapacity: Bool = false) {
    self.storage.removeAll(
      keepingCapacity: keepingCapacity
    )
  }

  typealias Keys = ObjectToObjectDictionaryKeys<Key,Value>
  typealias Values = ObjectToObjectDictionaryValues<Key,Value>
  
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
// MARK: ObjectToObjectDictionary - Collection
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionary : Collection {
  
  public typealias Index = ObjectToObjectDictionaryIndex<Key,Value>
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
// MARK: ObjectToObjectDictionary - ExpressibleByDictionaryLiteral
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionary : ExpressibleByDictionaryLiteral {
  
  public typealias DictionaryLiteralElement = (Key,Value)
  
  @inlinable
  public init(dictionaryLiteral elements: DictionaryLiteralElement...) {
    self.init(
      storage: Storage(
        uniqueKeysWithValues: elements.directlyMappedOnDemand() {
          (key: Key, value: Value) -> (ObjectWrapper<Key>, ObjectWrapper<Value>)
          in
          return (
            ObjectWrapper<Key>(wrappedObject: key),
            ObjectWrapper<Value>(wrappedObject: value)
          )
        }
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionaryIndex - Definition
// -------------------------------------------------------------------------- //

@frozen
public struct ObjectToObjectDictionaryIndex<Key:AnyObject,Value:AnyObject> {
  
  @usableFromInline
  internal typealias Storage = ObjectToObjectDictionary<Key,Value>.Storage.Index
  
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
// MARK: ObjectToObjectDictionaryIndex - Equatable
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionaryIndex : Equatable {
  
  @inlinable
  public static func ==(
    lhs: ObjectToObjectDictionaryIndex<Key,Value>,
    rhs: ObjectToObjectDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage == rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionaryIndex - Comparable
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionaryIndex : Comparable {
  
  @inlinable
  public static func <(
    lhs: ObjectToObjectDictionaryIndex<Key,Value>,
    rhs: ObjectToObjectDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage < rhs.storage
  }

  @inlinable
  public static func >(
    lhs: ObjectToObjectDictionaryIndex<Key,Value>,
    rhs: ObjectToObjectDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage > rhs.storage
  }
  
  @inlinable
  public static func <=(
    lhs: ObjectToObjectDictionaryIndex<Key,Value>,
    rhs: ObjectToObjectDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage <= rhs.storage
  }

  @inlinable
  public static func >=(
    lhs: ObjectToObjectDictionaryIndex<Key,Value>,
    rhs: ObjectToObjectDictionaryIndex<Key,Value>) -> Bool {
    return lhs.storage >= rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionaryIndex - Hashable
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionaryIndex : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionaryIndex - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionaryIndex : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "ObjectToObjectDictionaryIndex: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionaryIndex - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionaryIndex : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ObjectToObjectDictionaryIndex<\(String(reflecting: Key.self)),\(String(reflecting: Value.self))>(storage: \(String(describing: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionaryKeys - Definition
// -------------------------------------------------------------------------- //

/// *Immutable* view into the *keys* of an `ObjectToObjectDictionary`.
@frozen
public struct ObjectToObjectDictionaryKeys<Key:AnyObject,Value:AnyObject> {
  
  @usableFromInline
  internal typealias Storage = ObjectToObjectDictionary<Key,Value>.Storage.Keys
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionaryKeys - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionaryKeys : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "ObjectToObjectDictionaryKeys: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionaryKeys - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionaryKeys : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ObjectToObjectDictionaryKeys<\(String(reflecting: Key.self)),\(String(reflecting: Value.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionaryKeys - Collection
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionaryKeys : Collection {
  
  public typealias Index = ObjectToObjectDictionaryIndex<Key,Value>
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
// MARK: ObjectToObjectDictionaryValues - Definition
// -------------------------------------------------------------------------- //

/// *Mutable* view into the *values* of an `ObjectToObjectDictionary`.
@frozen
public struct ObjectToObjectDictionaryValues<Key:AnyObject,Value:AnyObject> {
  
  @usableFromInline
  internal typealias Storage = ObjectToObjectDictionary<Key,Value>.Storage.Values
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionaryValues - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionaryValues : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "ObjectToObjectDictionaryValues: \(String(describing: self.storage))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionaryValues - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionaryValues : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "ObjectToObjectDictionaryValues<\(String(reflecting: Key.self)),\(String(reflecting: Value.self))>(storage: \(String(reflecting: self.storage)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ObjectToObjectDictionaryValues - MutableCollection
// -------------------------------------------------------------------------- //

extension ObjectToObjectDictionaryValues : MutableCollection {
  
  public typealias Index = ObjectToObjectDictionaryIndex<Key,Value>
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
