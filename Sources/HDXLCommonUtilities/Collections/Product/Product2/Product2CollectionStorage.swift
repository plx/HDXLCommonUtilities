//
//  Product2CollectionStorage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class Product2CollectionStorage<A,B,Position,Element>
  where
  A:Collection,
  B:Collection,
  Position:AlgebraicProduct2,
  Position.A == A.Index,
  Position.B == B.Index,
  Element:AlgebraicProduct2,
  Element.A == A.Element,
  Element.B == B.Element {
  
  // -------------------------------------------------------------------------- //
  // MARK: Constituent Collections
  // -------------------------------------------------------------------------- //

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
    self._finalPosition = nil
    self._startIndex = nil
    self._countPerA = nil
  }
  
  @inlinable
  internal func fullyPopulateLocalCaches() {
    let _ = self.isEmpty
    let _ = self.count
    let _ = self.finalPosition
    let _ = self.startIndex
    let _ = self.countPerA
  }
  
  @usableFromInline
  internal func fullyPopulateCollectionCaches() {
    self.$a.fullyPopulateCaches()
    self.$b.fullyPopulateCaches()
  }
  
  @inlinable
  internal func fullyPopulateCaches() {
    self.fullyPopulateLocalCaches()
    self.fullyPopulateCollectionCaches()
  }
  
  @usableFromInline
  internal var hasFullyPopulatedCaches: Bool {
    get {
      guard
        self.$a.hasFullyPopulatedCaches,
        self.$b.hasFullyPopulatedCaches,
        nil != self._isEmpty,
        nil != self._count,
        nil != self._finalPosition,
        nil != self._startIndex,
        nil != self._countPerA else {
          return false
      }
      return true
    }
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
    return (
      self.$a.count
      *
      self.$b.count
    )
  }

  // ------------------------------------------------------------------------ //
  // MARK: Incremental Count Support - Storage
  // ------------------------------------------------------------------------ //

  @usableFromInline
  var _countPerA: Int? = nil

  // ------------------------------------------------------------------------ //
  // MARK: Incremental Count Support - Access
  // ------------------------------------------------------------------------ //
  
  @inlinable
  var countPerA: Int {
    get {
      return self._countPerA.obtainAssuredValue(
        fallingBackUpon: self.calculateCountPerA()
      )
    }
  }

  @inlinable
  var countPerB: Int {
    get {
      guard !self.isEmpty else{
        return 0
      }
      return 1
    }
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Incremental Count Support - Calculation
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  func calculateCountPerA() -> Int {
    guard !self.isEmpty else {
      return 0
    }
    return self.countPerB * self.$b.count
  }

  // ------------------------------------------------------------------------ //
  // MARK: Index Support
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  internal typealias Index = Product2CollectionIndex<Position>
  
  // ------------------------------------------------------------------------ //
  // MARK: startIndex Support
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  var _startIndex: Index? = nil
  
  @inlinable
  var startIndex: Index {
    get {
      return self._startIndex.obtainAssuredValue(
        fallingBackUpon: self.calculateStartIndex()
      )
    }
  }
  
  @inlinable
  func calculateStartIndex() -> Index {
    guard !self.isEmpty else {
      return self.endIndex
    }
    return Index(
      position: Position(
        self.a.startIndex,
        self.b.startIndex
      )
    )
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: endIndex Support
  // ------------------------------------------------------------------------ //
  
  @inlinable
  var endIndex: Index {
    get {
      return Index.endIndex
    }
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
    
  @usableFromInline
  var _finalPosition: Position?? = nil
  
  @inlinable
  var finalPosition: Position? {
    get {
      return self._finalPosition.obtainAssuredValue(
        fallingBackUpon: self.calculateFinalPosition()
      )
    }
  }
  
  @usableFromInline
  func calculateFinalPosition() -> Position? {
    return Position(
      self.$a.firstSubscriptableIndex,
      self.$b.firstSubscriptableIndex
    )
  }
  
  @inlinable
  subscript(position: Position) -> Element {
    get {
      return Element(
        self.a[position.a],
        self.b[position.b]
      )
    }
  }
  
  @usableFromInline
  func position(after position: Position) -> Position? {
    // NOTE: this blindly does all 9 advancements then figures out at the end
    // if it "went over the edge" or not. This is more-efficient than it looks
    // b.c the `nextSubscriptableIndex` usually just returns the supplied index,
    // and it's *hopefully* not worth bloating this with a ton of early-exits
    // (e.g. checking for "hold position" after each advancement and bailing).
    guard !self.isEmpty else {
      return nil
    }
    var action: ProductIndexAdvancementContext = .shouldAttemptAdvancement
    let nextBIndex = self.$b.nextSubscriptableIndex(
      after: position.b,
      updating: &action
    )
    let nextAIndex = self.$a.nextSubscriptableIndex(
      after: position.a,
      updating: &action
    )
    switch action {
    case .shouldHoldPosition:
      return Position(
        nextAIndex,
        nextBIndex
      )
    case .shouldAttemptAdvancement:
      return nil
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionStorage - Conveniences
// -------------------------------------------------------------------------- //

internal extension Product2CollectionStorage {
  
  /// Retrieves the component-wise counts.
  @usableFromInline
  var constituentCounts: UniformInlineProduct2<Int> {
    get {
      return UniformInlineProduct2<Int>(
        self.$a.count,
        self.$b.count
      )
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension Product2CollectionStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Product2CollectionStorage"
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
        String(reflecting: B.self)
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
// MARK: Product2CollectionStorage - Position Retreat Support
// -------------------------------------------------------------------------- //

internal extension Product2CollectionStorage
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection {
  
  @usableFromInline
  func position(before position: Position) -> Position? {
    // NOTE: this blindly does all 9 retreats then figures out at the end
    // if it "went over the edge" or not. This is more-efficient than it looks
    // b.c the `previousSubscriptableIndex` usually just returns the supplied index,
    // and it's *hopefully* not worth bloating this with a ton of early-exits
    // (e.g. checking for "hold position" after each advancement and bailing).
    guard !self.isEmpty else {
      return nil
    }
    var action: ProductIndexRetreatContext = .shouldAttemptRetreat
    let previousBIndex = self.$b.previousSubscriptableIndex(
      before: position.b,
      updating: &action
    )
    let previousAIndex = self.$a.previousSubscriptableIndex(
      before: position.a,
      updating: &action
    )
    switch action {
    case .shouldHoldPosition:
      return Position(
        previousAIndex,
        previousBIndex
      )
    case .shouldAttemptRetreat:
      return nil
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionStorage - Distance Calculation
// -------------------------------------------------------------------------- //

internal extension Product2CollectionStorage {
  
  @usableFromInline
  typealias DistancesFromStarts = UniformInlineProduct2<Int>
  
  @inlinable
  func distancesFromStarts(forPosition position: Position) -> DistancesFromStarts {
    return DistancesFromStarts(
      self.a.distance(
        from: self.a.startIndex,
        to: position.a
      ),
      self.b.distance(
        from: self.b.startIndex,
        to: position.b
      )
    )
  }
  
  @inlinable
  func linearPosition(forPosition position: Position) -> Int {
    let distancesFromStarts = self.distancesFromStarts(
      forPosition: position
    )
    return (
      self.countPerA * distancesFromStarts.a
      +
      self.countPerB * distancesFromStarts.b
    )
  }
  
  @inlinable
  func distancesFromStarts(forLinearPosition linearPosition: Int) -> DistancesFromStarts {
    let (aDistance, aRemainder) = linearPosition.quotientAndRemainder(
      dividingBy: self.countPerA
    )
    let bDistance = aRemainder
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert((0..<self.b.count).contains(bDistance))
    pedantic_assert((0..<self.a.count).contains(aDistance))
    // /////////////////////////////////////////////////////////////////////////
    return DistancesFromStarts(
      aDistance,
      bDistance
    )
  }
  
  @inlinable
  func position(forDistancesFromStarts distancesFromStarts: DistancesFromStarts) -> Position {
    return Position(
      self.a.index(
        self.a.startIndex,
        offsetBy: distancesFromStarts.a
      ),
      self.b.index(
        self.b.startIndex,
        offsetBy: distancesFromStarts.b
      )
    )
  }
  
  @inlinable
  func position(forLinearPosition linearPosition: Int) -> Position {
    let distancesFromStarts = self.distancesFromStarts(forLinearPosition: linearPosition)
    return self.position(
      forDistancesFromStarts: distancesFromStarts
    )
  }
  
}


// -------------------------------------------------------------------------- //
// MARK: Product2CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension Product2CollectionStorage {
  
  // TODO: any way to pull the cached properties over for the unchanged properties?
  
  @inlinable
  func with(a: A) -> Product2CollectionStorage<A,B,Position,Element> {
    return Product2CollectionStorage<A,B,Position,Element>(
      a,
      b
    )
  }
  
  @inlinable
  func with(b: B) -> Product2CollectionStorage<A,B,Position,Element> {
    return Product2CollectionStorage<A,B,Position,Element>(
      a,
      b
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionStorage - Validatable
// -------------------------------------------------------------------------- //

extension Product2CollectionStorage : Validatable {
  
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

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionStorage - Equatable
// -------------------------------------------------------------------------- //

extension Product2CollectionStorage : Equatable
  where
  A:Equatable,
  B:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: Product2CollectionStorage<A,B,Position,Element>,
    rhs: Product2CollectionStorage<A,B,Position,Element>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
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
    lhs: Product2CollectionStorage<A,B,Position,Element>,
    rhs: Product2CollectionStorage<A,B,Position,Element>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
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

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionStorage - Hashable
// -------------------------------------------------------------------------- //

extension Product2CollectionStorage : Hashable
  where
  A:Hashable,
  B:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Product2CollectionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "( \(self.parameterDescriptions) )"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Product2CollectionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product2CollectionStorage - Codable
// -------------------------------------------------------------------------- //

extension Product2CollectionStorage : Codable
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
