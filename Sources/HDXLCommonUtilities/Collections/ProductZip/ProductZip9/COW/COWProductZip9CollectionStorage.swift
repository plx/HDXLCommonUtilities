//
//  COWProductZip9CollectionStorage.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: COWProductZip9CollectionStorage - Definition
// ------------------------------------------------------------------------ //

@usableFromInline
internal final class COWProductZip9CollectionStorage<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection,
  I:Collection> {
  
  // ------------------------------------------------------------------------ //
  // MARK: Constituent Collections
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  @GenericCollectionStorage
  var a: A {
    didSet {
      self.resetCaches()
    }
  }
  
  @usableFromInline
  @GenericCollectionStorage
  var b: B {
    didSet {
      self.resetCaches()
    }
  }
  
  @usableFromInline
  @GenericCollectionStorage
  var c: C {
    didSet {
      self.resetCaches()
    }
  }
  
  @usableFromInline
  @GenericCollectionStorage
  var d: D {
    didSet {
      self.resetCaches()
    }
  }
  
  @usableFromInline
  @GenericCollectionStorage
  var e: E {
    didSet {
      self.resetCaches()
    }
  }
  
  @usableFromInline
  @GenericCollectionStorage
  var f: F {
    didSet {
      self.resetCaches()
    }
  }
  
  @usableFromInline
  @GenericCollectionStorage
  var g: G {
    didSet {
      self.resetCaches()
    }
  }
  
  @usableFromInline
  @GenericCollectionStorage
  var h: H {
    didSet {
      self.resetCaches()
    }
  }
  
  @usableFromInline
  @GenericCollectionStorage
  var i: I {
    didSet {
      self.resetCaches()
    }
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Cache-Management
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  internal func resetCaches() {
    self._isEmpty = nil
    self._count = nil
    
    self._firstPosition = nil
    self._finalPosition = nil
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: isEmpty Support
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  var _isEmpty: Bool? = nil
  
  @usableFromInline
  var isEmpty: Bool {
    get {
      return self._isEmpty.obtainAssuredValue(
        fallingBackUpon: self.calculateIsEmpty()
      )
    }
  }
  
  @usableFromInline
  func calculateIsEmpty() -> Bool {
    return (
      self.a.isEmpty
        ||
        self.b.isEmpty
        ||
        self.c.isEmpty
        ||
        self.d.isEmpty
        ||
        self.e.isEmpty
        ||
        self.f.isEmpty
        ||
        self.g.isEmpty
        ||
        self.h.isEmpty
        ||
        self.i.isEmpty
    )
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: count Support
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  var _count: Int? = nil
  
  @usableFromInline
  var count: Int {
    get {
      return self._count.obtainAssuredValue(
        fallingBackUpon: self.calculateCount()
      )
    }
  }
  
  @usableFromInline
  func calculateCount() -> Int {
    guard !self.isEmpty else {
      return 0
    }
    return min(
        self.$a.count,
        self.$b.count,
        self.$c.count,
        self.$d.count,
        self.$e.count,
        self.$f.count,
        self.$g.count,
        self.$h.count,
        self.$i.count
    )
  }

  // ------------------------------------------------------------------------ //
  // MARK: Initialization
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  required init(
    _ a: A,
    _ b: B,
    _ c: C,
    _ d: D,
    _ e: E,
    _ f: F,
    _ g: G,
    _ h: H,
    _ i: I) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.f = f
    self.g = g
    self.h = h
    self.i = i
  }

  // ------------------------------------------------------------------------ //
  // MARK: Position Support
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  typealias Position = COWProductZip9CollectionIndex<A,B,C,D,E,F,G,H,I>.Position
  
  @usableFromInline
  typealias Element = COWProduct9<
    A.Element,
    B.Element,
    C.Element,
    D.Element,
    E.Element,
    F.Element,
    G.Element,
    H.Element,
    I.Element
  >
  
  @usableFromInline
  subscript(position: Position) -> Element {
    get {
      return Element(
        self.a[position.a],
        self.b[position.b],
        self.c[position.c],
        self.d[position.d],
        self.e[position.e],
        self.f[position.f],
        self.g[position.g],
        self.h[position.h],
        self.i[position.i]
      )
    }
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Extremal Position Support - Storage
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  var _firstPosition: Position?? = nil
  
  @usableFromInline
  var _finalPosition: Position?? = nil
  
  // ------------------------------------------------------------------------ //
  // MARK: Extremal Position Support - Access
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  var firstPosition: Position? {
    get {
      return self._firstPosition.obtainAssuredValue(
        fallingBackUpon: self.calculateFirstPosition()
      )
    }
  }

  @usableFromInline
  var finalPosition: Position? {
    get {
      return self._finalPosition.obtainAssuredValue(
        fallingBackUpon: self.calculateFinalPosition()
      )
    }
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Extremal Position Support - Calculation
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  func calculateFirstPosition() -> Position? {
    return Position(
      self.$a.firstSubscriptableIndex,
      self.$b.firstSubscriptableIndex,
      self.$c.firstSubscriptableIndex,
      self.$d.firstSubscriptableIndex,
      self.$e.firstSubscriptableIndex,
      self.$f.firstSubscriptableIndex,
      self.$g.firstSubscriptableIndex,
      self.$h.firstSubscriptableIndex,
      self.$i.firstSubscriptableIndex
    )
  }
  
  @usableFromInline
  func calculateFinalPosition() -> Position? {
    guard !self.isEmpty else {
      return nil
    }
    let count = self.count
    let distanceToFinal = count - 1
    precondition(distanceToFinal >= 0)
    return Position(
      self.a.index(
        self.a.startIndex,
        offsetBy: distanceToFinal
      ),
      self.b.index(
        self.b.startIndex,
        offsetBy: distanceToFinal
      ),
      self.c.index(
        self.c.startIndex,
        offsetBy: distanceToFinal
      ),
      self.d.index(
        self.d.startIndex,
        offsetBy: distanceToFinal
      ),
      self.e.index(
        self.e.startIndex,
        offsetBy: distanceToFinal
      ),
      self.f.index(
        self.f.startIndex,
        offsetBy: distanceToFinal
      ),
      self.g.index(
        self.g.startIndex,
        offsetBy: distanceToFinal
      ),
      self.h.index(
        self.h.startIndex,
        offsetBy: distanceToFinal
      ),
      self.i.index(
        self.i.startIndex,
        offsetBy: distanceToFinal
      )
    )
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Position Support - Movement
  // ------------------------------------------------------------------------ //

  @usableFromInline
  func position(after position: Position) -> Position? {
    return Position(
      self.$a.subscriptableIndex(after: position.a),
      self.$b.subscriptableIndex(after: position.b),
      self.$c.subscriptableIndex(after: position.c),
      self.$d.subscriptableIndex(after: position.d),
      self.$e.subscriptableIndex(after: position.e),
      self.$f.subscriptableIndex(after: position.f),
      self.$g.subscriptableIndex(after: position.g),
      self.$h.subscriptableIndex(after: position.h),
      self.$i.subscriptableIndex(after: position.i)
    )
  }
  
  @usableFromInline
  func formPosition(after position: inout Position) -> Bool {
    guard
      let a = self.$a.subscriptableIndex(after: position.a),
      let b = self.$b.subscriptableIndex(after: position.b),
      let c = self.$c.subscriptableIndex(after: position.c),
      let d = self.$d.subscriptableIndex(after: position.d),
      let e = self.$e.subscriptableIndex(after: position.e),
      let f = self.$f.subscriptableIndex(after: position.f),
      let g = self.$g.subscriptableIndex(after: position.g),
      let h = self.$h.subscriptableIndex(after: position.h),
      let i = self.$i.subscriptableIndex(after: position.i) else {
        return false
    }
    position.a = a
    position.b = b
    position.c = c
    position.d = d
    position.e = e
    position.f = f
    position.g = g
    position.h = h
    position.i = i
    return true
  }
  
  @usableFromInline
  func position(
    _ position: Position,
    offsetBy distance: Int) -> Position? {
    return Position(
      self.$a.subscriptableIndex(
        position.a,
        offsetBy: distance
      ),
      self.$b.subscriptableIndex(
        position.b,
        offsetBy: distance
      ),
      self.$c.subscriptableIndex(
        position.c,
        offsetBy: distance
      ),
      self.$d.subscriptableIndex(
        position.d,
        offsetBy: distance
      ),
      self.$e.subscriptableIndex(
        position.e,
        offsetBy: distance
      ),
      self.$f.subscriptableIndex(
        position.f,
        offsetBy: distance
      ),
      self.$g.subscriptableIndex(
        position.g,
        offsetBy: distance
      ),
      self.$h.subscriptableIndex(
        position.h,
        offsetBy: distance
      ),
      self.$i.subscriptableIndex(
        position.i,
        offsetBy: distance
      )
    )
  }
  
  @usableFromInline
  func formPosition(
    _ position: inout Position,
    offsetBy distance: Int) -> Bool {
    guard
      let a = self.$a.subscriptableIndex(
        position.a,
        offsetBy: distance
      ),
      let b = self.$b.subscriptableIndex(
        position.b,
        offsetBy: distance
      ),
      let c = self.$c.subscriptableIndex(
        position.c,
        offsetBy: distance
      ),
      let d = self.$d.subscriptableIndex(
        position.d,
        offsetBy: distance
      ),
      let e = self.$e.subscriptableIndex(
        position.e,
        offsetBy: distance
      ),
      let f = self.$f.subscriptableIndex(
        position.f,
        offsetBy: distance
      ),
      let g = self.$g.subscriptableIndex(
        position.g,
        offsetBy: distance
      ),
      let h = self.$h.subscriptableIndex(
        position.h,
        offsetBy: distance
      ),
      let i = self.$i.subscriptableIndex(
        position.i,
        offsetBy: distance
      ) else {
        return false
    }
    position.a = a
    position.b = b
    position.c = c
    position.d = d
    position.e = e
    position.f = f
    position.g = g
    position.h = h
    position.i = i
    return true
  }

  
  @usableFromInline
  func position(forLinearPosition linearPosition: Int) -> Position {
    return Position(
      self.a.index(
        self.a.startIndex,
        offsetBy: linearPosition
      ),
      self.b.index(
        self.b.startIndex,
        offsetBy: linearPosition
      ),
      self.c.index(
        self.c.startIndex,
        offsetBy: linearPosition
      ),
      self.d.index(
        self.d.startIndex,
        offsetBy: linearPosition
      ),
      self.e.index(
        self.e.startIndex,
        offsetBy: linearPosition
      ),
      self.f.index(
        self.f.startIndex,
        offsetBy: linearPosition
      ),
      self.g.index(
        self.g.startIndex,
        offsetBy: linearPosition
      ),
      self.h.index(
        self.h.startIndex,
        offsetBy: linearPosition
      ),
      self.i.index(
        self.i.startIndex,
        offsetBy: linearPosition
      )
    )
  }

}

// ------------------------------------------------------------------------ //
// MARK: COWProductZip9CollectionStorage - Retreat Support
// ------------------------------------------------------------------------ //

internal extension COWProductZip9CollectionStorage
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection,
  C:BidirectionalCollection,
  D:BidirectionalCollection,
  E:BidirectionalCollection,
  F:BidirectionalCollection,
  G:BidirectionalCollection,
  H:BidirectionalCollection,
  I:BidirectionalCollection {
  
  @usableFromInline
  func position(before position: Position) -> Position? {
    return Position(
      self.$a.subscriptableIndex(before: position.a),
      self.$b.subscriptableIndex(before: position.b),
      self.$c.subscriptableIndex(before: position.c),
      self.$d.subscriptableIndex(before: position.d),
      self.$e.subscriptableIndex(before: position.e),
      self.$f.subscriptableIndex(before: position.f),
      self.$g.subscriptableIndex(before: position.g),
      self.$h.subscriptableIndex(before: position.h),
      self.$i.subscriptableIndex(before: position.i)
    )
  }

  @usableFromInline
  func formPosition(before position: inout Position) -> Bool {
    guard
      let a = self.$a.subscriptableIndex(before: position.a),
      let b = self.$b.subscriptableIndex(before: position.b),
      let c = self.$c.subscriptableIndex(before: position.c),
      let d = self.$d.subscriptableIndex(before: position.d),
      let e = self.$e.subscriptableIndex(before: position.e),
      let f = self.$f.subscriptableIndex(before: position.f),
      let g = self.$g.subscriptableIndex(before: position.g),
      let h = self.$h.subscriptableIndex(before: position.h),
      let i = self.$i.subscriptableIndex(before: position.i) else {
        return false
    }
    position.a = a
    position.b = b
    position.c = c
    position.d = d
    position.e = e
    position.f = f
    position.g = g
    position.h = h
    position.i = i
    return true
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProductZip9CollectionStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProductZip9CollectionStorage {
  
  @usableFromInline
  static var shortTypeName: String {
    get {
      return "COWProductZip9CollectionStorage"
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
      return [
        String(reflecting: A.self),
        String(reflecting: B.self),
        String(reflecting: C.self),
        String(reflecting: D.self),
        String(reflecting: E.self),
        String(reflecting: F.self),
        String(reflecting: G.self),
        String(reflecting: H.self),
        String(reflecting: I.self)
        ].joined(separator: ", ")
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
// MARK: COWProductZip9CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension COWProductZip9CollectionStorage {
  
  // TODO: any way to pull the cached properties over for the unchanged properties?
  
  @usableFromInline
  func with(a: A) -> COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  
  @inlinable
  func with(b: B) -> COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  
  @inlinable
  func with(c: C) -> COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  
  @inlinable
  func with(d: D) -> COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  
  @inlinable
  func with(e: E) -> COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  
  @inlinable
  func with(f: F) -> COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  
  @inlinable
  func with(g: G) -> COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  
  @inlinable
  func with(h: H) -> COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  
  @inlinable
  func with(i: I) -> COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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

// ------------------------------------------------------------------------ //
// MARK: COWProductZip9CollectionStorage - Validatable
// ------------------------------------------------------------------------ //

extension COWProductZip9CollectionStorage : Validatable {
  
  @usableFromInline
  internal var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b),
        isValidOrIndifferent(self.c),
        isValidOrIndifferent(self.d),
        isValidOrIndifferent(self.e),
        isValidOrIndifferent(self.f),
        isValidOrIndifferent(self.g),
        isValidOrIndifferent(self.h),
        isValidOrIndifferent(self.i) else {
          return false
      }
      return true
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWProductZip9CollectionStorage - Equatable
// ------------------------------------------------------------------------ //

extension COWProductZip9CollectionStorage : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable,
  F:Equatable,
  G:Equatable,
  H:Equatable,
  I:Equatable {
  
  @usableFromInline
  internal static func ==(
    lhs: COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
    guard lhs !== rhs else {
      return true
    }
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d,
      lhs.e == rhs.e,
      lhs.f == rhs.f,
      lhs.g == rhs.g,
      lhs.h == rhs.h,
      lhs.i == rhs.i else {
        return false
    }
    return true
  }

  @usableFromInline
  internal static func !=(
    lhs: COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
    guard lhs !== rhs else {
      return false
    }
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d,
      lhs.e == rhs.e,
      lhs.f == rhs.f,
      lhs.g == rhs.g,
      lhs.h == rhs.h,
      lhs.i == rhs.i else {
        return true
    }
    return false
  }

}

// ------------------------------------------------------------------------ //
// MARK: COWProductZip9CollectionStorage - Hashable
// ------------------------------------------------------------------------ //

extension COWProductZip9CollectionStorage : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable,
  F:Hashable,
  G:Hashable,
  H:Hashable,
  I:Hashable {
  
  @usableFromInline
  internal func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
    self.d.hash(into: &hasher)
    self.e.hash(into: &hasher)
    self.f.hash(into: &hasher)
    self.g.hash(into: &hasher)
    self.h.hash(into: &hasher)
    self.i.hash(into: &hasher)
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWProductZip9CollectionStorage - CustomStringConvertible
// ------------------------------------------------------------------------ //

extension COWProductZip9CollectionStorage : CustomStringConvertible {
  
  @usableFromInline
  internal var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWProductZip9CollectionStorage - CustomDebugStringConvertible
// ------------------------------------------------------------------------ //

extension COWProductZip9CollectionStorage : CustomDebugStringConvertible {
  
  @usableFromInline
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: COWProductZip9CollectionStorage - Codable
// ------------------------------------------------------------------------ //

extension COWProductZip9CollectionStorage : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable,
  F:Codable,
  G:Codable,
  H:Codable,
  I:Codable {
  
  @usableFromInline
  internal enum CodingKeys : String, CodingKey {
    
    case a = "a"
    case b = "b"
    case c = "c"
    case d = "d"
    case e = "e"
    case f = "f"
    case g = "g"
    case h = "h"
    case i = "i"
    
    @usableFromInline
    internal var intValue: Int? {
      get {
        switch self {
        case .a:
          return 0
        case .b:
          return 1
        case .c:
          return 2
        case .d:
          return 3
        case .e:
          return 4
        case .f:
          return 5
        case .g:
          return 6
        case .h:
          return 7
        case .i:
          return 8
        }
      }
    }
    
    @usableFromInline
    internal init?(intValue: Int) {
      switch intValue {
      case 0:
        self = .a
      case 1:
        self = .b
      case 2:
        self = .c
      case 3:
        self = .d
      case 4:
        self = .e
      case 5:
        self = .f
      case 6:
        self = .g
      case 7:
        self = .h
      case 8:
        self = .i
      default:
        return nil
      }
    }
    
  }
  
  @usableFromInline
  internal func encode(to encoder: Encoder) throws {
    var values = encoder.container(keyedBy: CodingKeys.self)
    try values.encode(
      self.a,
      forKey: .a
    )
    try values.encode(
      self.b,
      forKey: .b
    )
    try values.encode(
      self.c,
      forKey: .c
    )
    try values.encode(
      self.d,
      forKey: .d
    )
    try values.encode(
      self.e,
      forKey: .e
    )
    try values.encode(
      self.f,
      forKey: .f
    )
    try values.encode(
      self.g,
      forKey: .g
    )
    try values.encode(
      self.h,
      forKey: .h
    )
    try values.encode(
      self.i,
      forKey: .i
    )
  }
  
  @usableFromInline
  internal convenience init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    self.init(
      try values.decode(
        A.self,
        forKey: .a
      ),
      try values.decode(
        B.self,
        forKey: .b
      ),
      try values.decode(
        C.self,
        forKey: .c
      ),
      try values.decode(
        D.self,
        forKey: .d
      ),
      try values.decode(
        E.self,
        forKey: .e
      ),
      try values.decode(
        F.self,
        forKey: .f
      ),
      try values.decode(
        G.self,
        forKey: .g
      ),
      try values.decode(
        H.self,
        forKey: .h
      ),
      try values.decode(
        I.self,
        forKey: .i
      )
    )
  }

}
