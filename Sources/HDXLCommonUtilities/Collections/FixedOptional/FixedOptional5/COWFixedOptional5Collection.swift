//
//  COWFixedOptional5Collection.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional5Collection - Definition
// ------------------------------------------------------------------------ //

public struct COWFixedOptional5Collection<Element> {
  
  @usableFromInline
  internal typealias Storage = COWFixedOptional5CollectionStorage<Element>
  
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
    _ d: Element?,
    _ e: Element?) {
    self.init(
      storage: Storage(
        a,
        b,
        c,
        d,
        e
      )
    )
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional5Collection - Property Exposure
// ------------------------------------------------------------------------ //

public extension COWFixedOptional5Collection {
  
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
  
  @inlinable
  var e: Element? {
    get {
      return self.storage.e
    }
    set {
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.e = newValue
      } else {
        self.storage = self.storage.with(
          e: newValue
        )
      }
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional5Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension COWFixedOptional5Collection {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWFixedOptional5Collection"
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
        String(reflecting: self.d),
        String(reflecting: self.e)
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
        "d: \(String(reflecting: self.d))",
        "e: \(String(reflecting: self.e))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional5Collection - Equatable
// ------------------------------------------------------------------------ //

extension COWFixedOptional5Collection : Equatable where Element:Equatable {
  
  @inlinable
  public static func ==(
    lhs: COWFixedOptional5Collection<Element>,
    rhs: COWFixedOptional5Collection<Element>) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: COWFixedOptional5Collection<Element>,
    rhs: COWFixedOptional5Collection<Element>) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional5Collection - Hashable
// ------------------------------------------------------------------------ //

extension COWFixedOptional5Collection : Hashable where Element:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional5Collection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional5Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional5CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional5Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional5Collection - Codable
// ------------------------------------------------------------------------ //

extension COWFixedOptional5Collection : Codable where Element:Codable {
  
  // synthesized ok
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional5Collection - RandomAccessCollection
// ------------------------------------------------------------------------ //

extension COWFixedOptional5Collection : RandomAccessCollection {
  
  public typealias Index = FixedOptional5CollectionIndex
  
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
    _ i: inout FixedOptional5CollectionIndex,
    offsetBy distance: Int,
    limitedBy limit: FixedOptional5CollectionIndex) -> Bool {
    return self.storage.formIndex(
      &i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
}


// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional5CollectionStorage - Definition
// ------------------------------------------------------------------------ //

@usableFromInline
internal final class COWFixedOptional5CollectionStorage<Element> {
  
  @usableFromInline
  internal typealias Storage = InlineFixedOptional5Collection<Element>
  
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
    _ d: Element?,
    _ e: Element?) {
    self.init(
      storage: Storage(
        a,
        b,
        c,
        d,
        e
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
// MARK: COWFixedOptional5CollectionStorage - Reflection Support
// ------------------------------------------------------------------------ //

internal extension COWFixedOptional5CollectionStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "COWFixedOptional5CollectionStorage"
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
        String(reflecting: self.d),
        String(reflecting: self.e)
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
        "d: \(String(reflecting: self.d))",
        "e: \(String(reflecting: self.e))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional5Collection - Property Exposure
// -------------------------------------------------------------------------- //

internal extension COWFixedOptional5CollectionStorage {
  
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
  
  @inlinable
  var e: Element? {
    get {
      return self.storage.e
    }
    set {
      self.storage.e = newValue
    }
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional5CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension COWFixedOptional5CollectionStorage {
  
  @inlinable
  func with(a: Element?) -> COWFixedOptional5CollectionStorage<Element> {
    return COWFixedOptional5CollectionStorage(
      a,
      b,
      c,
      d,
      e
    )
  }
  
  @inlinable
  func with(b: Element?) -> COWFixedOptional5CollectionStorage<Element> {
    return COWFixedOptional5CollectionStorage(
      a,
      b,
      c,
      d,
      e
    )
  }
  
  @inlinable
  func with(c: Element?) -> COWFixedOptional5CollectionStorage<Element> {
    return COWFixedOptional5CollectionStorage(
      a,
      b,
      c,
      d,
      e
    )
  }
  
  @inlinable
  func with(d: Element?) -> COWFixedOptional5CollectionStorage<Element> {
    return COWFixedOptional5CollectionStorage(
      a,
      b,
      c,
      d,
      e
    )
  }
  
  @inlinable
  func with(e: Element?) -> COWFixedOptional5CollectionStorage<Element> {
    return COWFixedOptional5CollectionStorage(
      a,
      b,
      c,
      d,
      e
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional5CollectionStorage - Equatable
// -------------------------------------------------------------------------- //

extension COWFixedOptional5CollectionStorage : Equatable where Element:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: COWFixedOptional5CollectionStorage<Element>,
    rhs: COWFixedOptional5CollectionStorage<Element>) -> Bool {
    return lhs === rhs || lhs.storage == rhs.storage
  }
  
  @inlinable
  internal static func !=(
    lhs: COWFixedOptional5CollectionStorage<Element>,
    rhs: COWFixedOptional5CollectionStorage<Element>) -> Bool {
    return lhs !== rhs && lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional5CollectionStorage - Hashable
// -------------------------------------------------------------------------- //

extension COWFixedOptional5CollectionStorage : Hashable where Element:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional5CollectionStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional5CollectionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional5CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional5CollectionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional5CollectionStorage - Codable
// -------------------------------------------------------------------------- //

extension COWFixedOptional5CollectionStorage : Codable where Element:Codable {
  
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
// MARK: COWFixedOptional5CollectionStorage - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension COWFixedOptional5CollectionStorage : RandomAccessCollection {
  
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
    _ i: inout FixedOptional5CollectionIndex,
    offsetBy distance: Int,
    limitedBy limit: FixedOptional5CollectionIndex) -> Bool {
    return self.storage.formIndex(
      &i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
}

