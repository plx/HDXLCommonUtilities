//
//  COWFixedOptional4Collection.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional4Collection - Definition
// ------------------------------------------------------------------------ //

public struct COWFixedOptional4Collection<Element> {
  
  @usableFromInline
  internal typealias Storage = COWFixedOptional4CollectionStorage<Element>
  
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
    _ c: Element?,
    _ d: Element?) {
    self.init(
      storage: Storage(
        a,
        b,
        c,
        d
      )
    )
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional4Collection - Property Exposure
// ------------------------------------------------------------------------ //

public extension COWFixedOptional4Collection {
  
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
  
  @inlinable
  var d: Element? {
    get {
      return self.storage.d
    }
    set {
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.d = newValue
      } else {
        self.storage = self.storage.with(
          d: newValue
        )
      }
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional4Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension COWFixedOptional4Collection {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWFixedOptional4Collection"
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
        String(reflecting: self.c),
        String(reflecting: self.d)
        ].joined(separator: ", ")
      
    }
  }
  
  @inlinable
  var parameterDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))",
        "c: \(String(reflecting: self.c))",
        "d: \(String(reflecting: self.d))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional4Collection - Equatable
// ------------------------------------------------------------------------ //

extension COWFixedOptional4Collection : Equatable where Element:Equatable {
  
  @inlinable
  public static func ==(
    lhs: COWFixedOptional4Collection<Element>,
    rhs: COWFixedOptional4Collection<Element>) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: COWFixedOptional4Collection<Element>,
    rhs: COWFixedOptional4Collection<Element>) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional4Collection - Hashable
// ------------------------------------------------------------------------ //

extension COWFixedOptional4Collection : Hashable where Element:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional4Collection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional4Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional4CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional4Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional4Collection - Codable
// ------------------------------------------------------------------------ //

extension COWFixedOptional4Collection : Codable where Element:Codable {
  
  // synthesized ok
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional4Collection - RandomAccessCollection
// ------------------------------------------------------------------------ //

extension COWFixedOptional4Collection : RandomAccessCollection {
  
  public typealias Index = FixedOptional4CollectionIndex
  
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
    _ i: inout FixedOptional4CollectionIndex,
    offsetBy distance: Int,
    limitedBy limit: FixedOptional4CollectionIndex) -> Bool {
    return self.storage.formIndex(
      &i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
}


// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional4CollectionStorage - Definition
// ------------------------------------------------------------------------ //

@usableFromInline
internal final class COWFixedOptional4CollectionStorage<Element> {
  
  @usableFromInline
  internal typealias Storage = InlineFixedOptional4Collection<Element>
  
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
    _ c: Element?,
    _ d: Element?) {
    self.init(
      storage: Storage(
        a,
        b,
        c,
        d
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
// MARK: COWFixedOptional4CollectionStorage - Reflection Support
// ------------------------------------------------------------------------ //

internal extension COWFixedOptional4CollectionStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWFixedOptional4CollectionStorage"
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
        String(reflecting: self.c),
        String(reflecting: self.d)
        ].joined(separator: ", ")
      
    }
  }
  
  @inlinable
  var parameterDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))",
        "c: \(String(reflecting: self.c))",
        "d: \(String(reflecting: self.d))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional4Collection - Property Exposure
// -------------------------------------------------------------------------- //

internal extension COWFixedOptional4CollectionStorage {
  
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
  
  @inlinable
  var d: Element? {
    get {
      return self.storage.d
    }
    set {
      self.storage.d = newValue
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional4CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension COWFixedOptional4CollectionStorage {
  
  @inlinable
  func with(a: Element?) -> COWFixedOptional4CollectionStorage<Element> {
    return COWFixedOptional4CollectionStorage(
      a,
      b,
      c,
      d
    )
  }
  
  @inlinable
  func with(b: Element?) -> COWFixedOptional4CollectionStorage<Element> {
    return COWFixedOptional4CollectionStorage(
      a,
      b,
      c,
      d
    )
  }
  
  @inlinable
  func with(c: Element?) -> COWFixedOptional4CollectionStorage<Element> {
    return COWFixedOptional4CollectionStorage(
      a,
      b,
      c,
      d
    )
  }
  
  @inlinable
  func with(d: Element?) -> COWFixedOptional4CollectionStorage<Element> {
    return COWFixedOptional4CollectionStorage(
      a,
      b,
      c,
      d
    )
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional4CollectionStorage - Equatable
// -------------------------------------------------------------------------- //

extension COWFixedOptional4CollectionStorage : Equatable where Element:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: COWFixedOptional4CollectionStorage<Element>,
    rhs: COWFixedOptional4CollectionStorage<Element>) -> Bool {
    return lhs === rhs || lhs.storage == rhs.storage
  }
  
  @inlinable
  internal static func !=(
    lhs: COWFixedOptional4CollectionStorage<Element>,
    rhs: COWFixedOptional4CollectionStorage<Element>) -> Bool {
    return lhs !== rhs && lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional4CollectionStorage - Hashable
// -------------------------------------------------------------------------- //

extension COWFixedOptional4CollectionStorage : Hashable where Element:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional4CollectionStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional4CollectionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional4CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional4CollectionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional4CollectionStorage - Codable
// -------------------------------------------------------------------------- //

extension COWFixedOptional4CollectionStorage : Codable where Element:Codable {
  
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
// MARK: COWFixedOptional4CollectionStorage - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension COWFixedOptional4CollectionStorage : RandomAccessCollection {
  
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
    _ i: inout FixedOptional4CollectionIndex,
    offsetBy distance: Int,
    limitedBy limit: FixedOptional4CollectionIndex) -> Bool {
    return self.storage.formIndex(
      &i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
}

