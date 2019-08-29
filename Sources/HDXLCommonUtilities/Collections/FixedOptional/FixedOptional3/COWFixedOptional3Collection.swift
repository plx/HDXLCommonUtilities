//
//  COWFixedOptional3Collection.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional3Collection - Definition
// ------------------------------------------------------------------------ //

public struct COWFixedOptional3Collection<Element> {
  
  @usableFromInline
  internal typealias Storage = COWFixedOptional3CollectionStorage<Element>
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  public init(
    _ a: Element?,
    _ b: Element?,
    _ c: Element?) {
    self.init(
      storage: Storage(
        a,
        b,
        c
      )
    )
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional3Collection - Property Exposure
// ------------------------------------------------------------------------ //

public extension COWFixedOptional3Collection {
  
  @inlinable
  var a: Element? {
    get {
      return self.storage.a
    }
    set {
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.a = newValue
      } else {
        self.storage = self.storage.with(
          a: newValue
        )
      }
    }
  }
  
  @inlinable
  var b: Element? {
    get {
      return self.storage.b
    }
    set {
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.b = newValue
      } else {
        self.storage = self.storage.with(
          b: newValue
        )
      }
    }
  }
  
  @inlinable
  var c: Element? {
    get {
      return self.storage.c
    }
    set {
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.c = newValue
      } else {
        self.storage = self.storage.with(
          c: newValue
        )
      }
    }
  }
    
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional3Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension COWFixedOptional3Collection {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWFixedOptional3Collection"
    }
  }
  
  @inlinable
  static var completeTypeName: String {
    get {
      return "\(self.shortTypeName)<\(self.typeParameterNames)>"
    }
  }
  
  @inlinable
  static var typeParameterNames: String {
    get {
      return String(reflecting: Element.self)
    }
  }
  
  @inlinable
  var parameterDescriptions: String {
    get {
      return [
        String(reflecting: self.a),
        String(reflecting: self.b),
        String(reflecting: self.c)
        ].joined(separator: ", ")
      
    }
  }
  
  @inlinable
  var parameterDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))",
        "c: \(String(reflecting: self.c))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional3Collection - Equatable
// ------------------------------------------------------------------------ //

extension COWFixedOptional3Collection : Equatable where Element:Equatable {
  
  @inlinable
  public static func ==(
    lhs: COWFixedOptional3Collection<Element>,
    rhs: COWFixedOptional3Collection<Element>) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: COWFixedOptional3Collection<Element>,
    rhs: COWFixedOptional3Collection<Element>) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional3Collection - Hashable
// ------------------------------------------------------------------------ //

extension COWFixedOptional3Collection : Hashable where Element:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional3Collection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional3Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional3CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional3Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional3Collection - Codable
// ------------------------------------------------------------------------ //

extension COWFixedOptional3Collection : Codable where Element:Codable {
  
  // synthesized ok
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional3Collection - RandomAccessCollection
// ------------------------------------------------------------------------ //

extension COWFixedOptional3Collection : RandomAccessCollection {
  
  public typealias Index = FixedOptional3CollectionIndex
  
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
      return self.storage.startIndex
    }
  }
  
  @inlinable
  public var endIndex: Index {
    get {
      return self.storage.endIndex
    }
  }
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      return self.storage[index]
    }
  }
  
  @inlinable
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    return self.storage.distance(
      from: start,
      to: end
    )
  }
  
  @inlinable
  public func index(after index: Index) -> Index {
    return self.storage.index(
      after: index
    )
  }
  
  @inlinable
  public func index(before index: Index) -> Index {
    return self.storage.index(
      before: index
    )
  }
  
  @inlinable
  public func index(
    _ index: Index,
    offsetBy distance: Int) -> Index {
    return self.storage.index(
      index,
      offsetBy: distance
    )
  }
  
  @inlinable
  public func index(
    _ i: Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Index? {
    return self.storage.index(
      i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
  @inlinable
  public func formIndex(after i: inout Index) {
    self.storage.formIndex(after: &i)
  }
  
  @inlinable
  public func formIndex(before i: inout Index) {
    self.storage.formIndex(before: &i)
  }
  
  @inlinable
  public func formIndex(
    _ i: inout Index,
    offsetBy distance: Int) {
    self.storage.formIndex(
      &i,
      offsetBy: distance
    )
  }
  
  @inlinable
  public func formIndex(
    _ i: inout FixedOptional3CollectionIndex,
    offsetBy distance: Int,
    limitedBy limit: FixedOptional3CollectionIndex) -> Bool {
    return self.storage.formIndex(
      &i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
}


// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional3CollectionStorage - Definition
// ------------------------------------------------------------------------ //

@usableFromInline
internal final class COWFixedOptional3CollectionStorage<Element> {
  
  @usableFromInline
  internal typealias Storage = InlineFixedOptional3Collection<Element>
  
  @usableFromInline
  internal typealias Index = Storage.Index
  
  @usableFromInline
  internal var storage: Storage {
    didSet {
      self.resetCaches()
    }
  }
  
  @inlinable
  internal required init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  internal convenience init(
    _ a: Element?,
    _ b: Element?,
    _ c: Element?) {
    self.init(
      storage: Storage(
        a,
        b,
        c
      )
    )
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Cache Property Management
  // ------------------------------------------------------------------------ //
  
  @inlinable
  internal func resetCaches() {
    self._isEmpty = nil
    self._count = nil
    self._startIndex = nil
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Cache Property Storage
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  internal var _isEmpty: Bool? = nil
  
  @usableFromInline
  internal var _count: Int? = nil
  
  @usableFromInline
  internal var _startIndex: Index? = nil
  
  // ------------------------------------------------------------------------ //
  // MARK: Cache Property Access
  // ------------------------------------------------------------------------ //
  
  @inlinable
  internal var isEmpty: Bool {
    get {
      return self._isEmpty.obtainAssuredValue(
        fallingBackUpon: self.storage.isEmpty
      )
    }
  }
  
  @inlinable
  internal var count: Int {
    get {
      return self._count.obtainAssuredValue(
        fallingBackUpon: self.storage.count
      )
    }
  }
  
  @inlinable
  internal var startIndex: Index {
    get {
      return self._startIndex.obtainAssuredValue(
        fallingBackUpon: self.storage.startIndex
      )
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional3CollectionStorage - Reflection Support
// ------------------------------------------------------------------------ //

internal extension COWFixedOptional3CollectionStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWFixedOptional3CollectionStorage"
    }
  }
  
  @inlinable
  static var completeTypeName: String {
    get {
      return "\(self.shortTypeName)<\(self.typeParameterNames)>"
    }
  }
  
  @inlinable
  static var typeParameterNames: String {
    get {
      return String(reflecting: Element.self)
    }
  }
  
  @inlinable
  var parameterDescriptions: String {
    get {
      return [
        String(reflecting: self.a),
        String(reflecting: self.b),
        String(reflecting: self.c)
        ].joined(separator: ", ")
      
    }
  }
  
  @inlinable
  var parameterDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))",
        "c: \(String(reflecting: self.c))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional3Collection - Property Exposure
// -------------------------------------------------------------------------- //

internal extension COWFixedOptional3CollectionStorage {
  
  @inlinable
  var a: Element? {
    get {
      return self.storage.a
    }
    set {
      self.storage.a = newValue
    }
  }
  
  @inlinable
  var b: Element? {
    get {
      return self.storage.b
    }
    set {
      self.storage.b = newValue
    }
  }
  
  @inlinable
  var c: Element? {
    get {
      return self.storage.c
    }
    set {
      self.storage.c = newValue
    }
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional3CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension COWFixedOptional3CollectionStorage {
  
  @inlinable
  func with(a: Element?) -> COWFixedOptional3CollectionStorage<Element> {
    return COWFixedOptional3CollectionStorage(
      a,
      b,
      c
    )
  }
  
  @inlinable
  func with(b: Element?) -> COWFixedOptional3CollectionStorage<Element> {
    return COWFixedOptional3CollectionStorage(
      a,
      b,
      c
    )
  }
  
  @inlinable
  func with(c: Element?) -> COWFixedOptional3CollectionStorage<Element> {
    return COWFixedOptional3CollectionStorage(
      a,
      b,
      c
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional3CollectionStorage - Equatable
// -------------------------------------------------------------------------- //

extension COWFixedOptional3CollectionStorage : Equatable where Element:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: COWFixedOptional3CollectionStorage<Element>,
    rhs: COWFixedOptional3CollectionStorage<Element>) -> Bool {
    return lhs === rhs || lhs.storage == rhs.storage
  }
  
  @inlinable
  internal static func !=(
    lhs: COWFixedOptional3CollectionStorage<Element>,
    rhs: COWFixedOptional3CollectionStorage<Element>) -> Bool {
    return lhs !== rhs && lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional3CollectionStorage - Hashable
// -------------------------------------------------------------------------- //

extension COWFixedOptional3CollectionStorage : Hashable where Element:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional3CollectionStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional3CollectionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional3CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional3CollectionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional3CollectionStorage - Codable
// -------------------------------------------------------------------------- //

extension COWFixedOptional3CollectionStorage : Codable where Element:Codable {
  
  @inlinable
  internal func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(self.storage)
  }
  
  @inlinable
  internal convenience init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    self.init(
      storage: try container.decode(
        Storage.self
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional3CollectionStorage - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension COWFixedOptional3CollectionStorage : RandomAccessCollection {
  
  @inlinable
  internal var endIndex: Index {
    get {
      return self.storage.endIndex
    }
  }
  
  @inlinable
  internal subscript(index: Index) -> Element {
    get {
      return self.storage[index]
    }
  }
  
  @inlinable
  internal func distance(
    from start: Index,
    to end: Index) -> Int {
    return self.storage.distance(
      from: start,
      to: end
    )
  }
  
  @inlinable
  internal func index(after index: Index) -> Index {
    return self.storage.index(
      after: index
    )
  }
  
  @inlinable
  internal func index(before index: Index) -> Index {
    return self.storage.index(
      before: index
    )
  }
  
  @inlinable
  internal func index(
    _ index: Index,
    offsetBy distance: Int) -> Index {
    return self.storage.index(
      index,
      offsetBy: distance
    )
  }
  
  @inlinable
  internal func index(
    _ i: Index,
    offsetBy distance: Int,
    limitedBy limit: Index) -> Index? {
    return self.storage.index(
      i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
  @inlinable
  internal func formIndex(after i: inout Index) {
    self.storage.formIndex(after: &i)
  }
  
  @inlinable
  internal func formIndex(before i: inout Index) {
    self.storage.formIndex(before: &i)
  }
  
  @inlinable
  internal func formIndex(
    _ i: inout Index,
    offsetBy distance: Int) {
    self.storage.formIndex(
      &i,
      offsetBy: distance
    )
  }
  
  @inlinable
  internal func formIndex(
    _ i: inout FixedOptional3CollectionIndex,
    offsetBy distance: Int,
    limitedBy limit: FixedOptional3CollectionIndex) -> Bool {
    return self.storage.formIndex(
      &i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
}

