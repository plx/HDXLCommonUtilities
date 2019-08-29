//
//  Product9ZipCollectionStorage.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: ProductZip9CollectionStorage - Definition
// ------------------------------------------------------------------------ //

@usableFromInline
internal final class ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>
  where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection,
  I:Collection,
  Position:AlgebraicProduct9,
  Position.A == A.Index,
  Position.B == B.Index,
  Position.C == C.Index,
  Position.D == D.Index,
  Position.E == E.Index,
  Position.F == F.Index,
  Position.G == G.Index,
  Position.H == H.Index,
  Position.I == I.Index,
  Element:AlgebraicProduct9,
  Element.A == A.Element,
  Element.B == B.Element,
  Element.C == C.Element,
  Element.D == D.Element,
  Element.E == E.Element,
  Element.F == F.Element,
  Element.G == G.Element,
  Element.H == H.Element,
  Element.I == I.Element {
  
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
  
  @inlinable
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
  
  @inlinable
  var isEmpty: Bool {
    get {
      return self._isEmpty.obtainAssuredValue(
        fallingBackUpon: self.calculateIsEmpty()
      )
    }
  }
  
  @inlinable
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
  
  @inlinable
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
  
  @inlinable
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
  
  @inlinable
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
  
  @inlinable
  var firstPosition: Position? {
    get {
      return self._firstPosition.obtainAssuredValue(
        fallingBackUpon: self.calculateFirstPosition()
      )
    }
  }

  @inlinable
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
  
  @inlinable
  func calculateFinalPosition() -> Position? {
    guard !self.isEmpty else {
      return nil
    }
    let count = self.count
    let distanceToFinal = count - 1
    precondition(distanceToFinal >= 0)
    return Position(
      self.a.index(offsetFromStartBy: distanceToFinal),
      self.b.index(offsetFromStartBy: distanceToFinal),
      self.c.index(offsetFromStartBy: distanceToFinal),
      self.d.index(offsetFromStartBy: distanceToFinal),
      self.e.index(offsetFromStartBy: distanceToFinal),
      self.f.index(offsetFromStartBy: distanceToFinal),
      self.g.index(offsetFromStartBy: distanceToFinal),
      self.h.index(offsetFromStartBy: distanceToFinal),
      self.i.index(offsetFromStartBy: distanceToFinal)
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: ProductZip9CollectionStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension ProductZip9CollectionStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "ProductZip9CollectionStorage"
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
      return [
        String(reflecting: A.self),
        String(reflecting: B.self),
        String(reflecting: C.self),
        String(reflecting: D.self),
        String(reflecting: E.self),
        String(reflecting: F.self),
        String(reflecting: G.self),
        String(reflecting: H.self),
        String(reflecting: I.self),
        String(reflecting: Position.self),
        String(reflecting: Element.self),
        ].joined(separator: ", ")
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
        String(reflecting: self.e),
        String(reflecting: self.f),
        String(reflecting: self.g),
        String(reflecting: self.h),
        String(reflecting: self.i)
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
// MARK: ProductZip9CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension ProductZip9CollectionStorage {
  
  // TODO: any way to pull the cached properties over for the unchanged properties?
  
  @inlinable
  func with(a: A) -> ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element> {
    return ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>(
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
  func with(b: B) -> ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element> {
    return ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>(
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
  func with(c: C) -> ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element> {
    return ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>(
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
  func with(d: D) -> ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element> {
    return ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>(
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
  func with(e: E) -> ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element> {
    return ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>(
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
  func with(f: F) -> ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element> {
    return ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>(
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
  func with(g: G) -> ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element> {
    return ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>(
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
  func with(h: H) -> ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element> {
    return ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>(
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
  func with(i: I) -> ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element> {
    return ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>(
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
// MARK: ProductZip9CollectionStorage - Validatable
// ------------------------------------------------------------------------ //

extension ProductZip9CollectionStorage : Validatable {
  
  @inlinable
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
// MARK: ProductZip9CollectionStorage - Equatable
// ------------------------------------------------------------------------ //

extension ProductZip9CollectionStorage : Equatable
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
  
  @inlinable
  internal static func ==(
    lhs: ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>,
    rhs: ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>) -> Bool {
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

  @inlinable
  internal static func !=(
    lhs: ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>,
    rhs: ProductZip9CollectionStorage<A,B,C,D,E,F,G,H,I,Position,Element>) -> Bool {
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
// MARK: ProductZip9CollectionStorage - Hashable
// ------------------------------------------------------------------------ //

extension ProductZip9CollectionStorage : Hashable
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
  
  @inlinable
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
// MARK: ProductZip9CollectionStorage - CustomStringConvertible
// ------------------------------------------------------------------------ //

extension ProductZip9CollectionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip9CollectionStorage - CustomDebugStringConvertible
// ------------------------------------------------------------------------ //

extension ProductZip9CollectionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip9CollectionStorage - Codable
// ------------------------------------------------------------------------ //

extension ProductZip9CollectionStorage : Codable
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
  internal typealias CodingKeys = Arity9ProductCodingKeys
  
  @inlinable
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
  
  @inlinable
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

// ------------------------------------------------------------------------ //
// MARK: ProductZip9CollectionStorage - Collection Support
// ------------------------------------------------------------------------ //

internal extension ProductZip9CollectionStorage {
  
  @usableFromInline
  typealias Index = ProductZip9CollectionIndex<Position>
  
  @inlinable
  func linearIndex(forIndex index: Index) -> Int {
    switch index.storage {
    case .position(let position):
      return self.linearIndex(
        forPosition: position
      )
    case .end:
      return self.count
    }
  }
  
  @inlinable
  func linearIndex(forPosition position: Position) -> Int {
    return self.a.distanceFromStart(
      to: position.a
    )
  }

  @inlinable
  func linearIndexIsForIndex(_ linearIndex: Int) -> Bool {
    return (0...self.count).contains(linearIndex)
  }

  @inlinable
  func linearIndexIsForPosition(_ linearIndex: Int) -> Bool {
    return (0..<self.count).contains(linearIndex)
  }
  
  @inlinable
  func position(forLinearIndex linearIndex: Int) -> Position {
    pedantic_assert(self.linearIndexIsForPosition(linearIndex))
    return Position(
      self.a.index(offsetFromStartBy: linearIndex),
      self.b.index(offsetFromStartBy: linearIndex),
      self.c.index(offsetFromStartBy: linearIndex),
      self.d.index(offsetFromStartBy: linearIndex),
      self.e.index(offsetFromStartBy: linearIndex),
      self.f.index(offsetFromStartBy: linearIndex),
      self.g.index(offsetFromStartBy: linearIndex),
      self.h.index(offsetFromStartBy: linearIndex),
      self.i.index(offsetFromStartBy: linearIndex)
    )
  }
  
  @inlinable
  func index(forLinearIndex linearIndex: Int) -> Index {
    precondition(linearIndex >= 0)
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.linearIndexIsForIndex(linearIndex))
    // /////////////////////////////////////////////////////////////////////////
    switch linearIndex <=> self.count {
    case .orderedAscending:
      return Index(
        position: self.position(
          forLinearIndex: linearIndex
        )
      )
    case .orderedSame:
      return Index.endIndex
    case .orderedDescending:
      preconditionFailure("Asked for overshot `linearIndex` \(linearIndex) in \(String(reflecting: self))!")
    }
  }
  
  @inlinable
  func couldHaveCreated(index: Index) -> Bool {
    switch index.storage {
    case .position(let position):
      return self.couldHaveCreated(
        position: position
      )
    case .end:
      return true
    }
  }

  @inlinable
  func couldHaveCreated(position: Position) -> Bool {
    guard
      position.a < self.a.endIndex,
      position.b < self.b.endIndex,
      position.c < self.c.endIndex,
      position.d < self.d.endIndex,
      position.e < self.e.endIndex,
      position.f < self.f.endIndex,
      position.g < self.g.endIndex,
      position.h < self.h.endIndex,
      position.i < self.i.endIndex,
      allArgumentsMutuallyEqual(
        self.a.distanceFromStart(to: position.a),
        self.b.distanceFromStart(to: position.b),
        self.c.distanceFromStart(to: position.c),
        self.d.distanceFromStart(to: position.d),
        self.e.distanceFromStart(to: position.e),
        self.f.distanceFromStart(to: position.f),
        self.g.distanceFromStart(to: position.g),
        self.h.distanceFromStart(to: position.h),
        self.i.distanceFromStart(to: position.i)) else {
          return false
      }
    return true
  }
  
  @inlinable
  func endIndexReplacement(
    forDistanceFromEndIndex distanceFromEndIndex: Int) -> IndexPositionStorageEndReplacement<Position> {
    precondition(distanceFromEndIndex < 0)
    let distanceFromStartIndex = self.count + distanceFromEndIndex
    guard (0..<self.count).contains(distanceFromStartIndex) else {
      return .misnavigation
    }
    return .position(
      self.position(forLinearIndex: distanceFromStartIndex)
    )
  }
  
  @inlinable
  func position(
    _ position: Position,
    offsetBy distance: Int) -> IndexPositionStorageMovementAttemptDestination<Position> {
    guard distance != 0 else {
      return .success(position)
    }
    return coalesceMovementAttemptDestinations(
      self.a.subscriptableIndex(position.a, offsetBy: distance),
      self.b.subscriptableIndex(position.b, offsetBy: distance),
      self.c.subscriptableIndex(position.c, offsetBy: distance),
      self.d.subscriptableIndex(position.d, offsetBy: distance),
      self.e.subscriptableIndex(position.e, offsetBy: distance),
      self.f.subscriptableIndex(position.f, offsetBy: distance),
      self.g.subscriptableIndex(position.g, offsetBy: distance),
      self.h.subscriptableIndex(position.h, offsetBy: distance),
      self.i.subscriptableIndex(position.i, offsetBy: distance)
    )
  }
  
  @inlinable
  func position(after position: Position) -> Position? {
    return Position(
      self.a.subscriptableIndex(after: position.a),
      self.b.subscriptableIndex(after: position.b),
      self.c.subscriptableIndex(after: position.c),
      self.d.subscriptableIndex(after: position.d),
      self.e.subscriptableIndex(after: position.e),
      self.f.subscriptableIndex(after: position.f),
      self.g.subscriptableIndex(after: position.g),
      self.h.subscriptableIndex(after: position.h),
      self.i.subscriptableIndex(after: position.i)
    )
  }
    
  @inlinable
  func formPosition(after position: inout Position) -> Bool {
    guard
      self.a.formSubscriptableIndex(after: &position.a),
      self.b.formSubscriptableIndex(after: &position.b),
      self.c.formSubscriptableIndex(after: &position.c),
      self.d.formSubscriptableIndex(after: &position.d),
      self.e.formSubscriptableIndex(after: &position.e),
      self.f.formSubscriptableIndex(after: &position.f),
      self.g.formSubscriptableIndex(after: &position.g),
      self.h.formSubscriptableIndex(after: &position.h),
      self.i.formSubscriptableIndex(after: &position.i) else {
        return false
    }
    return true
  }
  
  @inlinable
  func formPosition(
    _ position: inout Position,
    offsetBy distance: Int) -> IndexPositionStorageMovementAttemptResult {
    return IndexPositionStorageMovementAttemptResult.coalescing(
      self.a.formSubscriptableIndex(
        &position.a,
        offsetBy: distance
      ),
      self.b.formSubscriptableIndex(
        &position.b,
        offsetBy: distance
      ),
      self.c.formSubscriptableIndex(
        &position.c,
        offsetBy: distance
      ),
      self.d.formSubscriptableIndex(
        &position.d,
        offsetBy: distance
      ),
      self.e.formSubscriptableIndex(
        &position.e,
        offsetBy: distance
      ),
      self.f.formSubscriptableIndex(
        &position.f,
        offsetBy: distance
      ),
      self.g.formSubscriptableIndex(
        &position.g,
        offsetBy: distance
      ),
      self.h.formSubscriptableIndex(
        &position.h,
        offsetBy: distance
      ),
      self.i.formSubscriptableIndex(
        &position.i,
        offsetBy: distance
      )
    )
  }

}

internal extension ProductZip9CollectionStorage
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
      self.a.subscriptableIndex(before: position.a),
      self.b.subscriptableIndex(before: position.b),
      self.c.subscriptableIndex(before: position.c),
      self.d.subscriptableIndex(before: position.d),
      self.e.subscriptableIndex(before: position.e),
      self.f.subscriptableIndex(before: position.f),
      self.g.subscriptableIndex(before: position.g),
      self.h.subscriptableIndex(before: position.h),
      self.i.subscriptableIndex(before: position.i)
    )
  }

  @inlinable
  func formPosition(before position: inout Position) -> Bool {
    guard
      self.a.formSubscriptableIndex(before: &position.a),
      self.b.formSubscriptableIndex(before: &position.b),
      self.c.formSubscriptableIndex(before: &position.c),
      self.d.formSubscriptableIndex(before: &position.d),
      self.e.formSubscriptableIndex(before: &position.e),
      self.f.formSubscriptableIndex(before: &position.f),
      self.g.formSubscriptableIndex(before: &position.g),
      self.h.formSubscriptableIndex(before: &position.h),
      self.i.formSubscriptableIndex(before: &position.i) else {
        return false
    }
    return true
  }

}
