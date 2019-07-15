//
//  COWFixedOptional9Collection.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional9Collection - Definition
// ------------------------------------------------------------------------ //

public struct COWFixedOptional9Collection<Element> {
  
  @usableFromInline
  internal typealias Storage = COWFixedOptional9CollectionStorage<Element>
  
  @usableFromInline
  internal var storage: Storage
  
  @usableFromInline
  internal init(storage: Storage) {
    self.storage = storage
  }
  
  @inlinable
  public init(
    _ a: Element?,
    _ b: Element?,
    _ c: Element?,
    _ d: Element?,
    _ e: Element?,
    _ f: Element?,
    _ g: Element?,
    _ h: Element?,
    _ i: Element?) {
    self.init(
      storage: Storage(
        a,
        b,
        c,
        d,
        e,
        f,
        g,
        h,
        i
      )
    )
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional9Collection - Property Exposure
// ------------------------------------------------------------------------ //

public extension COWFixedOptional9Collection {
  
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
  
  @inlinable
  var f: Element? {
    get {
      return self.storage.f
    }
    set {
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.f = newValue
      } else {
        self.storage = self.storage.with(
          f: newValue
        )
      }
    }
  }
  
  @inlinable
  var g: Element? {
    get {
      return self.storage.g
    }
    set {
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.g = newValue
      } else {
        self.storage = self.storage.with(
          g: newValue
        )
      }
    }
  }
  
  @inlinable
  var h: Element? {
    get {
      return self.storage.h
    }
    set {
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.h = newValue
      } else {
        self.storage = self.storage.with(
          h: newValue
        )
      }
    }
  }
  
  @inlinable
  var i: Element? {
    get {
      return self.storage.i
    }
    set {
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.i = newValue
      } else {
        self.storage = self.storage.with(
          i: newValue
        )
      }
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional9Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension COWFixedOptional9Collection {
  
  @usableFromInline
  static var shortTypeName: String {
    get {
      return "COWFixedOptional9Collection"
    }
  }
  
  @usableFromInline
  static var completeTypeName: String {
    get {
      return "\(self.shortTypeName)<\(self.typeParameterNames)>"
    }
  }
  
  @usableFromInline
  static var typeParameterNames: String {
    get {
      return String(reflecting: Element.self)
    }
  }
  
  @usableFromInline
  var parameterDescriptions: String {
    get {
      return [
        String(reflecting: self.a),
        String(reflecting: self.b),
        String(reflecting: self.c),
        String(reflecting: self.d),
        String(reflecting: self.e),
        String(reflecting: self.f),
        String(reflecting: self.g),
        String(reflecting: self.h),
        String(reflecting: self.i)
        ].joined(separator: ", ")
      
    }
  }
  
  @usableFromInline
  var parameterDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))",
        "c: \(String(reflecting: self.c))",
        "d: \(String(reflecting: self.d))",
        "e: \(String(reflecting: self.e))",
        "f: \(String(reflecting: self.f))",
        "g: \(String(reflecting: self.g))",
        "h: \(String(reflecting: self.h))",
        "i: \(String(reflecting: self.i))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional9Collection - Equatable
// ------------------------------------------------------------------------ //

extension COWFixedOptional9Collection : Equatable where Element:Equatable {
  
  @inlinable
  public static func ==(
    lhs: COWFixedOptional9Collection<Element>,
    rhs: COWFixedOptional9Collection<Element>) -> Bool {
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: COWFixedOptional9Collection<Element>,
    rhs: COWFixedOptional9Collection<Element>) -> Bool {
    return lhs.storage != rhs.storage
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional9Collection - Hashable
// ------------------------------------------------------------------------ //

extension COWFixedOptional9Collection : Hashable where Element:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional9Collection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional9Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional9CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional9Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional9Collection - Codable
// ------------------------------------------------------------------------ //

extension COWFixedOptional9Collection : Codable where Element:Codable {
  
  // synthesized ok
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional9Collection - RandomAccessCollection
// ------------------------------------------------------------------------ //

extension COWFixedOptional9Collection : RandomAccessCollection {
  
  public typealias Index = FixedOptional9CollectionIndex
  
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
    _ i: inout FixedOptional9CollectionIndex,
    offsetBy distance: Int,
    limitedBy limit: FixedOptional9CollectionIndex) -> Bool {
    return self.storage.formIndex(
      &i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
}


// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional9CollectionStorage - Definition
// ------------------------------------------------------------------------ //

@usableFromInline
internal final class COWFixedOptional9CollectionStorage<Element> {
  
  @usableFromInline
  internal typealias Storage = InlineFixedOptional9Collection<Element>
  
  @usableFromInline
  internal typealias Index = Storage.Index
  
  @usableFromInline
  internal var storage: Storage {
    didSet {
      self.resetCaches()
    }
  }
  
  @usableFromInline
  internal required init(storage: Storage) {
    self.storage = storage
  }
  
  @usableFromInline
  internal convenience init(
    _ a: Element?,
    _ b: Element?,
    _ c: Element?,
    _ d: Element?,
    _ e: Element?,
    _ f: Element?,
    _ g: Element?,
    _ h: Element?,
    _ i: Element?) {
    self.init(
      storage: Storage(
        a,
        b,
        c,
        d,
        e,
        f,
        g,
        h,
        i
      )
    )
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Cache Property Management
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
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
  
  @usableFromInline
  internal var isEmpty: Bool {
    get {
      return self._isEmpty.obtainAssuredValue(
        fallingBackUpon: self.storage.isEmpty
      )
    }
  }
  
  @usableFromInline
  internal var count: Int {
    get {
      return self._count.obtainAssuredValue(
        fallingBackUpon: self.storage.count
      )
    }
  }
  
  @usableFromInline
  internal var startIndex: Index {
    get {
      return self._startIndex.obtainAssuredValue(
        fallingBackUpon: self.storage.startIndex
      )
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptional9CollectionStorage - Reflection Support
// ------------------------------------------------------------------------ //

internal extension COWFixedOptional9CollectionStorage {
  
  @usableFromInline
  static var shortTypeName: String {
    get {
      return "COWFixedOptional9CollectionStorage"
    }
  }
  
  @usableFromInline
  static var completeTypeName: String {
    get {
      return "\(self.shortTypeName)<\(self.typeParameterNames)>"
    }
  }
  
  @usableFromInline
  static var typeParameterNames: String {
    get {
      return String(reflecting: Element.self)
    }
  }
  
  @usableFromInline
  var parameterDescriptions: String {
    get {
      return [
        String(reflecting: self.a),
        String(reflecting: self.b),
        String(reflecting: self.c),
        String(reflecting: self.d),
        String(reflecting: self.e),
        String(reflecting: self.f),
        String(reflecting: self.g),
        String(reflecting: self.h),
        String(reflecting: self.i)
        ].joined(separator: ", ")
      
    }
  }
  
  @usableFromInline
  var parameterDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))",
        "c: \(String(reflecting: self.c))",
        "d: \(String(reflecting: self.d))",
        "e: \(String(reflecting: self.e))",
        "f: \(String(reflecting: self.f))",
        "g: \(String(reflecting: self.g))",
        "h: \(String(reflecting: self.h))",
        "i: \(String(reflecting: self.i))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional9Collection - Property Exposure
// -------------------------------------------------------------------------- //

internal extension COWFixedOptional9CollectionStorage {
  
  @usableFromInline
  var a: Element? {
    get {
      return self.storage.a
    }
    set {
      self.storage.a = newValue
    }
  }
  
  @usableFromInline
  var b: Element? {
    get {
      return self.storage.b
    }
    set {
      self.storage.b = newValue
    }
  }
  
  @usableFromInline
  var c: Element? {
    get {
      return self.storage.c
    }
    set {
      self.storage.c = newValue
    }
  }
  
  @usableFromInline
  var d: Element? {
    get {
      return self.storage.d
    }
    set {
      self.storage.d = newValue
    }
  }
  
  @usableFromInline
  var e: Element? {
    get {
      return self.storage.e
    }
    set {
      self.storage.e = newValue
    }
  }
  
  @usableFromInline
  var f: Element? {
    get {
      return self.storage.f
    }
    set {
      self.storage.f = newValue
    }
  }
  
  @usableFromInline
  var g: Element? {
    get {
      return self.storage.g
    }
    set {
      self.storage.g = newValue
    }
  }
  
  @usableFromInline
  var h: Element? {
    get {
      return self.storage.h
    }
    set {
      self.storage.h = newValue
    }
  }
  
  @usableFromInline
  var i: Element? {
    get {
      return self.storage.i
    }
    set {
      self.storage.i = newValue
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional9CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension COWFixedOptional9CollectionStorage {
  
  @usableFromInline
  func with(a: Element?) -> COWFixedOptional9CollectionStorage<Element> {
    return COWFixedOptional9CollectionStorage(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @usableFromInline
  func with(b: Element?) -> COWFixedOptional9CollectionStorage<Element> {
    return COWFixedOptional9CollectionStorage(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @usableFromInline
  func with(c: Element?) -> COWFixedOptional9CollectionStorage<Element> {
    return COWFixedOptional9CollectionStorage(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @usableFromInline
  func with(d: Element?) -> COWFixedOptional9CollectionStorage<Element> {
    return COWFixedOptional9CollectionStorage(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @usableFromInline
  func with(e: Element?) -> COWFixedOptional9CollectionStorage<Element> {
    return COWFixedOptional9CollectionStorage(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @usableFromInline
  func with(f: Element?) -> COWFixedOptional9CollectionStorage<Element> {
    return COWFixedOptional9CollectionStorage(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @usableFromInline
  func with(g: Element?) -> COWFixedOptional9CollectionStorage<Element> {
    return COWFixedOptional9CollectionStorage(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @usableFromInline
  func with(h: Element?) -> COWFixedOptional9CollectionStorage<Element> {
    return COWFixedOptional9CollectionStorage(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
  @usableFromInline
  func with(i: Element?) -> COWFixedOptional9CollectionStorage<Element> {
    return COWFixedOptional9CollectionStorage(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional9CollectionStorage - Equatable
// -------------------------------------------------------------------------- //

extension COWFixedOptional9CollectionStorage : Equatable where Element:Equatable {
  
  @usableFromInline
  internal static func ==(
    lhs: COWFixedOptional9CollectionStorage<Element>,
    rhs: COWFixedOptional9CollectionStorage<Element>) -> Bool {
    return lhs === rhs || lhs.storage == rhs.storage
  }
  
  @usableFromInline
  internal static func !=(
    lhs: COWFixedOptional9CollectionStorage<Element>,
    rhs: COWFixedOptional9CollectionStorage<Element>) -> Bool {
    return lhs !== rhs && lhs.storage != rhs.storage
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional9CollectionStorage - Hashable
// -------------------------------------------------------------------------- //

extension COWFixedOptional9CollectionStorage : Hashable where Element:Hashable {
  
  @usableFromInline
  internal func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional9CollectionStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional9CollectionStorage : CustomStringConvertible {
  
  @usableFromInline
  internal var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional9CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWFixedOptional9CollectionStorage : CustomDebugStringConvertible {
  
  @usableFromInline
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptional9CollectionStorage - Codable
// -------------------------------------------------------------------------- //

extension COWFixedOptional9CollectionStorage : Codable where Element:Codable {
  
  @usableFromInline
  internal func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encode(self.storage)
  }
  
  @usableFromInline
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
// MARK: COWFixedOptional9CollectionStorage - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension COWFixedOptional9CollectionStorage : RandomAccessCollection {
  
  @usableFromInline
  internal var endIndex: Index {
    get {
      return self.storage.endIndex
    }
  }
  
  @usableFromInline
  internal subscript(index: Index) -> Element {
    get {
      return self.storage[index]
    }
  }
  
  @usableFromInline
  internal func distance(
    from start: Index,
    to end: Index) -> Int {
    return self.storage.distance(
      from: start,
      to: end
    )
  }
  
  @usableFromInline
  internal func index(after index: Index) -> Index {
    return self.storage.index(
      after: index
    )
  }
  
  @usableFromInline
  internal func index(before index: Index) -> Index {
    return self.storage.index(
      before: index
    )
  }
  
  @usableFromInline
  internal func index(
    _ index: Index,
    offsetBy distance: Int) -> Index {
    return self.storage.index(
      index,
      offsetBy: distance
    )
  }
  
  @usableFromInline
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
  
  @usableFromInline
  internal func formIndex(after i: inout Index) {
    self.storage.formIndex(after: &i)
  }
  
  @usableFromInline
  internal func formIndex(before i: inout Index) {
    self.storage.formIndex(before: &i)
  }
  
  @usableFromInline
  internal func formIndex(
    _ i: inout Index,
    offsetBy distance: Int) {
    self.storage.formIndex(
      &i,
      offsetBy: distance
    )
  }
  
  @usableFromInline
  internal func formIndex(
    _ i: inout FixedOptional9CollectionIndex,
    offsetBy distance: Int,
    limitedBy limit: FixedOptional9CollectionIndex) -> Bool {
    return self.storage.formIndex(
      &i,
      offsetBy: distance,
      limitedBy: limit
    )
  }
  
}

