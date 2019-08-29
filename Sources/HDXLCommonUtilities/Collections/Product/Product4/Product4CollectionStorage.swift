//
//  Product4CollectionStorage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Product4CollectionStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class Product4CollectionStorage<A,B,C,D,Position,Element>
  where
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  Position:AlgebraicProduct4,
  Position.A == A.Index,
  Position.B == B.Index,
  Position.C == C.Index,
  Position.D == D.Index,
  Element:AlgebraicProduct4,
  Element.A == A.Element,
  Element.B == B.Element,
  Element.C == C.Element,
  Element.D == D.Element {
  
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
    self._countPerB = nil
    self._countPerC = nil
  }
  
  @inlinable
  internal func fullyPopulateLocalCaches() {
    let _ = self.isEmpty
    let _ = self.count
    let _ = self.finalPosition
    let _ = self.startIndex
    let _ = self.countPerA
    let _ = self.countPerB
    let _ = self.countPerC
  }
  
  @usableFromInline
  internal func fullyPopulateCollectionCaches() {
    self.$a.fullyPopulateCaches()
    self.$b.fullyPopulateCaches()
    self.$c.fullyPopulateCaches()
    self.$d.fullyPopulateCaches()
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
        self.$c.hasFullyPopulatedCaches,
        self.$d.hasFullyPopulatedCaches,
        nil != self._isEmpty,
        nil != self._count,
        nil != self._finalPosition,
        nil != self._startIndex,
        nil != self._countPerA,
        nil != self._countPerB,
        nil != self._countPerC else {
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
      ||
      self.c.isEmpty
      ||
      self.d.isEmpty
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
      *
      self.$c.count
      *
      self.$d.count
    )
  }

  // ------------------------------------------------------------------------ //
  // MARK: Incremental Count Support - Storage
  // ------------------------------------------------------------------------ //

  @usableFromInline
  var _countPerA: Int? = nil

  @usableFromInline
  var _countPerB: Int? = nil
  
  @usableFromInline
  var _countPerC: Int? = nil

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
      return self._countPerB.obtainAssuredValue(
        fallingBackUpon: self.calculateCountPerB()
      )
    }
  }

  @inlinable
  var countPerC: Int {
    get {
      return self._countPerC.obtainAssuredValue(
        fallingBackUpon: self.calculateCountPerC()
      )
    }
  }

  @inlinable
  var countPerD: Int {
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
  func calculateCountPerC() -> Int {
    guard !self.isEmpty else {
      return 0
    }
    return self.countPerD * self.$d.count
  }

  @usableFromInline
  func calculateCountPerB() -> Int {
    guard !self.isEmpty else {
      return 0
    }
    return self.countPerC * self.$c.count
  }

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
  internal typealias Index = Product4CollectionIndex<Position>
  
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
        self.b.startIndex,
        self.c.startIndex,
        self.d.startIndex
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
    _ b: B,
    _ c: C,
    _ d: D) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
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
      self.$b.firstSubscriptableIndex,
      self.$c.firstSubscriptableIndex,
      self.$d.firstSubscriptableIndex
    )
  }
  
  @inlinable
  subscript(position: Position) -> Element {
    get {
      return Element(
        self.a[position.a],
        self.b[position.b],
        self.c[position.c],
        self.d[position.d]
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
    let nextDIndex = self.$d.nextSubscriptableIndex(
      after: position.d,
      updating: &action
    )
    let nextCIndex = self.$c.nextSubscriptableIndex(
      after: position.c,
      updating: &action
    )
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
        nextBIndex,
        nextCIndex,
        nextDIndex
      )
    case .shouldAttemptAdvancement:
      return nil
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product4CollectionStorage - Conveniences
// -------------------------------------------------------------------------- //

internal extension Product4CollectionStorage {
  
  /// Retrieves the component-wise counts.
  @usableFromInline
  var constituentCounts: UniformInlineProduct4<Int> {
    get {
      return UniformInlineProduct4<Int>(
        self.$a.count,
        self.$b.count,
        self.$c.count,
        self.$d.count
      )
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Product4CollectionStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension Product4CollectionStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Product4CollectionStorage"
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
        String(reflecting: D.self)
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
// MARK: Product4CollectionStorage - Position Retreat Support
// -------------------------------------------------------------------------- //

internal extension Product4CollectionStorage
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection,
  C:BidirectionalCollection,
  D:BidirectionalCollection {
  
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
    let previousDIndex = self.$d.previousSubscriptableIndex(
      before: position.d,
      updating: &action
    )
    let previousCIndex = self.$c.previousSubscriptableIndex(
      before: position.c,
      updating: &action
    )
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
        previousBIndex,
        previousCIndex,
        previousDIndex
      )
    case .shouldAttemptRetreat:
      return nil
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product4CollectionStorage - Distance Calculation
// -------------------------------------------------------------------------- //

internal extension Product4CollectionStorage {
  
  @usableFromInline
  typealias DistancesFromStarts = UniformInlineProduct4<Int>
  
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
      ),
      self.c.distance(
        from: self.c.startIndex,
        to: position.c
      ),
      self.d.distance(
        from: self.d.startIndex,
        to: position.d
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
      +
      self.countPerC * distancesFromStarts.c
      +
      self.countPerD * distancesFromStarts.d
    )
  }
  
  @inlinable
  func distancesFromStarts(forLinearPosition linearPosition: Int) -> DistancesFromStarts {
    let (aDistance, aRemainder) = linearPosition.quotientAndRemainder(
      dividingBy: self.countPerA
    )
    let (bDistance, bRemainder) = aRemainder.quotientAndRemainder(
      dividingBy: self.countPerB
    )
    let (cDistance, cRemainder) = bRemainder.quotientAndRemainder(
      dividingBy: self.countPerC
    )
    let dDistance = cRemainder
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert((0..<self.d.count).contains(dDistance))
    pedantic_assert((0..<self.c.count).contains(cDistance))
    pedantic_assert((0..<self.b.count).contains(bDistance))
    pedantic_assert((0..<self.a.count).contains(aDistance))
    // /////////////////////////////////////////////////////////////////////////
    return DistancesFromStarts(
      aDistance,
      bDistance,
      cDistance,
      dDistance
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
      ),
      self.c.index(
        self.c.startIndex,
        offsetBy: distancesFromStarts.c
      ),
      self.d.index(
        self.d.startIndex,
        offsetBy: distancesFromStarts.d
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
// MARK: Product4CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension Product4CollectionStorage {
  
  // TODO: any way to pull the cached properties over for the unchanged properties?
  
  @inlinable
  func with(a: A) -> Product4CollectionStorage<A,B,C,D,Position,Element> {
    return Product4CollectionStorage<A,B,C,D,Position,Element>(
      a,
      b,
      c,
      d
    )
  }
  
  @inlinable
  func with(b: B) -> Product4CollectionStorage<A,B,C,D,Position,Element> {
    return Product4CollectionStorage<A,B,C,D,Position,Element>(
      a,
      b,
      c,
      d
    )
  }
  
  @inlinable
  func with(c: C) -> Product4CollectionStorage<A,B,C,D,Position,Element> {
    return Product4CollectionStorage<A,B,C,D,Position,Element>(
      a,
      b,
      c,
      d
    )
  }
  
  @inlinable
  func with(d: D) -> Product4CollectionStorage<A,B,C,D,Position,Element> {
    return Product4CollectionStorage<A,B,C,D,Position,Element>(
      a,
      b,
      c,
      d
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product4CollectionStorage - Validatable
// -------------------------------------------------------------------------- //

extension Product4CollectionStorage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.a),
        isValidOrIndifferent(self.b),
        isValidOrIndifferent(self.c),
        isValidOrIndifferent(self.d) else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product4CollectionStorage - Equatable
// -------------------------------------------------------------------------- //

extension Product4CollectionStorage : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: Product4CollectionStorage<A,B,C,D,Position,Element>,
    rhs: Product4CollectionStorage<A,B,C,D,Position,Element>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard lhs !== rhs else {
      return true
    }
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d else {
        return false
    }
    return true
  }
  
  @inlinable
  internal static func !=(
    lhs: Product4CollectionStorage<A,B,C,D,Position,Element>,
    rhs: Product4CollectionStorage<A,B,C,D,Position,Element>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard lhs !== rhs else {
      return false
    }
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b,
      lhs.c == rhs.c,
      lhs.d == rhs.d else {
        return true
    }
    return false
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product4CollectionStorage - Hashable
// -------------------------------------------------------------------------- //

extension Product4CollectionStorage : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
    self.d.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product4CollectionStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Product4CollectionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "( \(self.parameterDescriptions) )"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product4CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Product4CollectionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product4CollectionStorage - Codable
// -------------------------------------------------------------------------- //

extension Product4CollectionStorage : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable {
  
  @usableFromInline
  internal typealias CodingKeys = Arity4ProductCodingKeys
  

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
      )
    )
  }
  
}
