//
//  Product9ZipCollectionStorage.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: ProductZip2CollectionStorage - Definition
// ------------------------------------------------------------------------ //

@usableFromInline
internal final class ProductZip2CollectionStorage<A,B,Position,Element>
  where
  A:Collection,
  B:Collection,
  Position:AlgebraicProduct2,
  Position.A == A.Index,
  Position.B == B.Index,
  Element:AlgebraicProduct2,
  Element.A == A.Element,
  Element.B == B.Element {
  
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
      self.$b.count
    )
  }

  // ------------------------------------------------------------------------ //
  // MARK: Initialization
  // ------------------------------------------------------------------------ //
  
  @inlinable
  required init(
    _ a: A,
    _ b: B) {
    self.a = a
    self.b = b
  }

  // ------------------------------------------------------------------------ //
  // MARK: Position Support
  // ------------------------------------------------------------------------ //
  
  @inlinable
  subscript(position: Position) -> Element {
    get {
      return Element(
        self.a[position.a],
        self.b[position.b]
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
      self.$b.firstSubscriptableIndex
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
      self.b.index(offsetFromStartBy: distanceToFinal)
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: ProductZip2CollectionStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension ProductZip2CollectionStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "ProductZip2CollectionStorage"
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
        String(reflecting: self.b)
        ].joined(separator: ", ")
      
    }
  }
  
  @inlinable
  var parameterDebugDescriptions: String {
    get {
      return [
        "a: \(String(reflecting: self.a))",
        "b: \(String(reflecting: self.b))"
        ].joined(separator: ", ")
      
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip2CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension ProductZip2CollectionStorage {
  
  // TODO: any way to pull the cached properties over for the unchanged properties?
  
  @inlinable
  func with(a: A) -> ProductZip2CollectionStorage<A,B,Position,Element> {
    return ProductZip2CollectionStorage<A,B,Position,Element>(
      a,
      b
    )
  }
  
  @inlinable
  func with(b: B) -> ProductZip2CollectionStorage<A,B,Position,Element> {
    return ProductZip2CollectionStorage<A,B,Position,Element>(
      a,
      b
    )
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2CollectionStorage - Validatable
// ------------------------------------------------------------------------ //

extension ProductZip2CollectionStorage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b) else {
          return false
      }
      return true
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2CollectionStorage - Equatable
// ------------------------------------------------------------------------ //

extension ProductZip2CollectionStorage : Equatable
  where
  A:Equatable,
  B:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: ProductZip2CollectionStorage<A,B,Position,Element>,
    rhs: ProductZip2CollectionStorage<A,B,Position,Element>) -> Bool {
    guard lhs !== rhs else {
      return true
    }
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b else {
        return false
    }
    return true
  }

  @inlinable
  internal static func !=(
    lhs: ProductZip2CollectionStorage<A,B,Position,Element>,
    rhs: ProductZip2CollectionStorage<A,B,Position,Element>) -> Bool {
    guard lhs !== rhs else {
      return false
    }
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b else {
        return true
    }
    return false
  }

}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2CollectionStorage - Hashable
// ------------------------------------------------------------------------ //

extension ProductZip2CollectionStorage : Hashable
  where
  A:Hashable,
  B:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2CollectionStorage - CustomStringConvertible
// ------------------------------------------------------------------------ //

extension ProductZip2CollectionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2CollectionStorage - CustomDebugStringConvertible
// ------------------------------------------------------------------------ //

extension ProductZip2CollectionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2CollectionStorage - Codable
// ------------------------------------------------------------------------ //

extension ProductZip2CollectionStorage : Codable
  where
  A:Codable,
  B:Codable {
  
  @usableFromInline
  internal typealias CodingKeys = Arity2ProductCodingKeys
  
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
      )
    )
  }

}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2CollectionStorage - Collection Support
// ------------------------------------------------------------------------ //

internal extension ProductZip2CollectionStorage {
  
  @usableFromInline
  typealias Index = ProductZip2CollectionIndex<Position>
  
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
      self.b.index(offsetFromStartBy: linearIndex)
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
      allArgumentsMutuallyEqual(
        self.a.distanceFromStart(to: position.a),
        self.b.distanceFromStart(to: position.b)) else {
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
      self.b.subscriptableIndex(position.b, offsetBy: distance)
    )
  }
  
  @inlinable
  func position(after position: Position) -> Position? {
    return Position(
      self.a.subscriptableIndex(after: position.a),
      self.b.subscriptableIndex(after: position.b)
    )
  }
    
  @inlinable
  func formPosition(after position: inout Position) -> Bool {
    guard
      self.a.formSubscriptableIndex(after: &position.a),
      self.b.formSubscriptableIndex(after: &position.b) else {
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
      )
    )
  }

}

internal extension ProductZip2CollectionStorage
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection {

  @usableFromInline
  func position(before position: Position) -> Position? {
    return Position(
      self.a.subscriptableIndex(before: position.a),
      self.b.subscriptableIndex(before: position.b)
    )
  }

  @inlinable
  func formPosition(before position: inout Position) -> Bool {
    guard
      self.a.formSubscriptableIndex(before: &position.a),
      self.b.formSubscriptableIndex(before: &position.b) else {
        return false
    }
    return true
  }

}
