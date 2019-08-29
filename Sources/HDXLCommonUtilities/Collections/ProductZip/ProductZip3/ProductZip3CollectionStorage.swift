//
//  Product9ZipCollectionStorage.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: ProductZip3CollectionStorage - Definition
// ------------------------------------------------------------------------ //

@usableFromInline
internal final class ProductZip3CollectionStorage<A,B,C,Position,Element>
  where
  A:Collection,
  B:Collection,
  C:Collection,
  Position:AlgebraicProduct3,
  Position.A == A.Index,
  Position.B == B.Index,
  Position.C == C.Index,
  Element:AlgebraicProduct3,
  Element.A == A.Element,
  Element.B == B.Element,
  Element.C == C.Element {
  
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
      self.$c.count
    )
  }

  // ------------------------------------------------------------------------ //
  // MARK: Initialization
  // ------------------------------------------------------------------------ //
  
  @inlinable
  required init(
    _ a: A,
    _ b: B,
    _ c: C) {
    self.a = a
    self.b = b
    self.c = c
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
        self.c[position.c]
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
      self.$c.firstSubscriptableIndex
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
      self.c.index(offsetFromStartBy: distanceToFinal)
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: ProductZip3CollectionStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension ProductZip3CollectionStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "ProductZip3CollectionStorage"
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
// MARK: ProductZip3CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension ProductZip3CollectionStorage {
  
  // TODO: any way to pull the cached properties over for the unchanged properties?
  
  @inlinable
  func with(a: A) -> ProductZip3CollectionStorage<A,B,C,Position,Element> {
    return ProductZip3CollectionStorage<A,B,C,Position,Element>(
      a,
      b,
      c
    )
  }
  
  @inlinable
  func with(b: B) -> ProductZip3CollectionStorage<A,B,C,Position,Element> {
    return ProductZip3CollectionStorage<A,B,C,Position,Element>(
      a,
      b,
      c
    )
  }
  
  @inlinable
  func with(c: C) -> ProductZip3CollectionStorage<A,B,C,Position,Element> {
    return ProductZip3CollectionStorage<A,B,C,Position,Element>(
      a,
      b,
      c
    )
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip3CollectionStorage - Validatable
// ------------------------------------------------------------------------ //

extension ProductZip3CollectionStorage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b),
        isValidOrIndifferent(self.c) else {
          return false
      }
      return true
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip3CollectionStorage - Equatable
// ------------------------------------------------------------------------ //

extension ProductZip3CollectionStorage : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: ProductZip3CollectionStorage<A,B,C,Position,Element>,
    rhs: ProductZip3CollectionStorage<A,B,C,Position,Element>) -> Bool {
    guard lhs !== rhs else {
      return true
    }
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c else {
        return false
    }
    return true
  }

  @inlinable
  internal static func !=(
    lhs: ProductZip3CollectionStorage<A,B,C,Position,Element>,
    rhs: ProductZip3CollectionStorage<A,B,C,Position,Element>) -> Bool {
    guard lhs !== rhs else {
      return false
    }
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c else {
        return true
    }
    return false
  }

}

// ------------------------------------------------------------------------ //
// MARK: ProductZip3CollectionStorage - Hashable
// ------------------------------------------------------------------------ //

extension ProductZip3CollectionStorage : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip3CollectionStorage - CustomStringConvertible
// ------------------------------------------------------------------------ //

extension ProductZip3CollectionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip3CollectionStorage - CustomDebugStringConvertible
// ------------------------------------------------------------------------ //

extension ProductZip3CollectionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip3CollectionStorage - Codable
// ------------------------------------------------------------------------ //

extension ProductZip3CollectionStorage : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable {
  
  @usableFromInline
  internal typealias CodingKeys = Arity3ProductCodingKeys
  
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
      )
    )
  }

}

// ------------------------------------------------------------------------ //
// MARK: ProductZip3CollectionStorage - Collection Support
// ------------------------------------------------------------------------ //

internal extension ProductZip3CollectionStorage {
  
  @usableFromInline
  typealias Index = ProductZip3CollectionIndex<Position>
  
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
      self.c.index(offsetFromStartBy: linearIndex)
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
      allArgumentsMutuallyEqual(
        self.a.distanceFromStart(to: position.a),
        self.b.distanceFromStart(to: position.b),
        self.c.distanceFromStart(to: position.c)) else {
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
      self.c.subscriptableIndex(position.c, offsetBy: distance)
    )
  }
  
  @inlinable
  func position(after position: Position) -> Position? {
    return Position(
      self.a.subscriptableIndex(after: position.a),
      self.b.subscriptableIndex(after: position.b),
      self.c.subscriptableIndex(after: position.c)
    )
  }
    
  @inlinable
  func formPosition(after position: inout Position) -> Bool {
    guard
      self.a.formSubscriptableIndex(after: &position.a),
      self.b.formSubscriptableIndex(after: &position.b),
      self.c.formSubscriptableIndex(after: &position.c) else {
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
      )
    )
  }

}

internal extension ProductZip3CollectionStorage
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection,
  C:BidirectionalCollection {

  @usableFromInline
  func position(before position: Position) -> Position? {
    return Position(
      self.a.subscriptableIndex(before: position.a),
      self.b.subscriptableIndex(before: position.b),
      self.c.subscriptableIndex(before: position.c)
    )
  }

  @inlinable
  func formPosition(before position: inout Position) -> Bool {
    guard
      self.a.formSubscriptableIndex(before: &position.a),
      self.b.formSubscriptableIndex(before: &position.b),
      self.c.formSubscriptableIndex(before: &position.c) else {
        return false
    }
    return true
  }

}
