//
//  Product9ZipCollectionStorage.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: ProductZip6CollectionStorage - Definition
// ------------------------------------------------------------------------ //

@usableFromInline
internal final class ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element>
  where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  Position:AlgebraicProduct6,
  Position.A == A.Index,
  Position.B == B.Index,
  Position.C == C.Index,
  Position.D == D.Index,
  Position.E == E.Index,
  Position.F == F.Index,
  Element:AlgebraicProduct6,
  Element.A == A.Element,
  Element.B == B.Element,
  Element.C == C.Element,
  Element.D == D.Element,
  Element.E == E.Element,
  Element.F == F.Element {
  
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
      self.$f.count
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
    _ f: F) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.f = f
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
        self.f[position.f]
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
      self.$f.firstSubscriptableIndex
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
      self.f.index(offsetFromStartBy: distanceToFinal)
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: ProductZip6CollectionStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension ProductZip6CollectionStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "ProductZip6CollectionStorage"
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
        String(reflecting: self.f)
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
        "f: \(String(reflecting: self.f))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip6CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension ProductZip6CollectionStorage {
  
  // TODO: any way to pull the cached properties over for the unchanged properties?
  
  @inlinable
  func with(a: A) -> ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element> {
    return ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(b: B) -> ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element> {
    return ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(c: C) -> ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element> {
    return ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(d: D) -> ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element> {
    return ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(e: E) -> ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element> {
    return ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(f: F) -> ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element> {
    return ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip6CollectionStorage - Validatable
// ------------------------------------------------------------------------ //

extension ProductZip6CollectionStorage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b),
        isValidOrIndifferent(self.c),
        isValidOrIndifferent(self.d),
        isValidOrIndifferent(self.e),
        isValidOrIndifferent(self.f) else {
          return false
      }
      return true
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip6CollectionStorage - Equatable
// ------------------------------------------------------------------------ //

extension ProductZip6CollectionStorage : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable,
  F:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element>,
    rhs: ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element>) -> Bool {
    guard lhs !== rhs else {
      return true
    }
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d,
      lhs.e == rhs.e,
      lhs.f == rhs.f else {
        return false
    }
    return true
  }

  @inlinable
  internal static func !=(
    lhs: ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element>,
    rhs: ProductZip6CollectionStorage<A,B,C,D,E,F,Position,Element>) -> Bool {
    guard lhs !== rhs else {
      return false
    }
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d,
      lhs.e == rhs.e,
      lhs.f == rhs.f else {
        return true
    }
    return false
  }

}

// ------------------------------------------------------------------------ //
// MARK: ProductZip6CollectionStorage - Hashable
// ------------------------------------------------------------------------ //

extension ProductZip6CollectionStorage : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable,
  F:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
    self.d.hash(into: &hasher)
    self.e.hash(into: &hasher)
    self.f.hash(into: &hasher)
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip6CollectionStorage - CustomStringConvertible
// ------------------------------------------------------------------------ //

extension ProductZip6CollectionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip6CollectionStorage - CustomDebugStringConvertible
// ------------------------------------------------------------------------ //

extension ProductZip6CollectionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip6CollectionStorage - Codable
// ------------------------------------------------------------------------ //

extension ProductZip6CollectionStorage : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable,
  F:Codable {
  
  @usableFromInline
  internal typealias CodingKeys = Arity6ProductCodingKeys
  
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
      )
    )
  }

}

// ------------------------------------------------------------------------ //
// MARK: ProductZip6CollectionStorage - Collection Support
// ------------------------------------------------------------------------ //

internal extension ProductZip6CollectionStorage {
  
  @usableFromInline
  typealias Index = ProductZip6CollectionIndex<Position>
  
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
      self.f.index(offsetFromStartBy: linearIndex)
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
      allArgumentsMutuallyEqual(
        self.a.distanceFromStart(to: position.a),
        self.b.distanceFromStart(to: position.b),
        self.c.distanceFromStart(to: position.c),
        self.d.distanceFromStart(to: position.d),
        self.e.distanceFromStart(to: position.e),
        self.f.distanceFromStart(to: position.f)) else {
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
      self.f.subscriptableIndex(position.f, offsetBy: distance)
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
      self.f.subscriptableIndex(after: position.f)
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
      self.f.formSubscriptableIndex(after: &position.f) else {
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
      )
    )
  }

}

internal extension ProductZip6CollectionStorage
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection,
  C:BidirectionalCollection,
  D:BidirectionalCollection,
  E:BidirectionalCollection,
  F:BidirectionalCollection {

  @usableFromInline
  func position(before position: Position) -> Position? {
    return Position(
      self.a.subscriptableIndex(before: position.a),
      self.b.subscriptableIndex(before: position.b),
      self.c.subscriptableIndex(before: position.c),
      self.d.subscriptableIndex(before: position.d),
      self.e.subscriptableIndex(before: position.e),
      self.f.subscriptableIndex(before: position.f)
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
      self.f.formSubscriptableIndex(before: &position.f) else {
        return false
    }
    return true
  }

}
