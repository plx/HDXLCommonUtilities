//
//  Product6CollectionStorage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Product6CollectionStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class Product6CollectionStorage<A,B,C,D,E,F,Position,Element>
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
    self._finalPosition = nil
    self._startIndex = nil
    self._countPerA = nil
    self._countPerB = nil
    self._countPerC = nil
    self._countPerD = nil
    self._countPerE = nil
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
    let _ = self.countPerD
    let _ = self.countPerE
  }
  
  @usableFromInline
  internal func fullyPopulateCollectionCaches() {
    self.$a.fullyPopulateCaches()
    self.$b.fullyPopulateCaches()
    self.$c.fullyPopulateCaches()
    self.$d.fullyPopulateCaches()
    self.$e.fullyPopulateCaches()
    self.$f.fullyPopulateCaches()
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
        self.$e.hasFullyPopulatedCaches,
        self.$f.hasFullyPopulatedCaches,
        nil != self._isEmpty,
        nil != self._count,
        nil != self._finalPosition,
        nil != self._startIndex,
        nil != self._countPerA,
        nil != self._countPerB,
        nil != self._countPerC,
        nil != self._countPerD,
        nil != self._countPerE else {
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
    return (
      self.$a.count
      *
      self.$b.count
      *
      self.$c.count
      *
      self.$d.count
      *
      self.$e.count
      *
      self.$f.count
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
  
  @usableFromInline
  var _countPerD: Int? = nil

  @usableFromInline
  var _countPerE: Int? = nil

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
      return self._countPerD.obtainAssuredValue(
        fallingBackUpon: self.calculateCountPerD()
      )
    }
  }

  @inlinable
  var countPerE: Int {
    get {
      return self._countPerE.obtainAssuredValue(
        fallingBackUpon: self.calculateCountPerE()
      )
    }
  }

  @inlinable
  var countPerF: Int {
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
  func calculateCountPerE() -> Int {
    guard !self.isEmpty else {
      return 0
    }
    return self.countPerF * self.$f.count
  }

  @usableFromInline
  func calculateCountPerD() -> Int {
    guard !self.isEmpty else {
      return 0
    }
    return self.countPerE * self.$e.count
  }

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
  internal typealias Index = Product6CollectionIndex<Position>
  
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
        self.d.startIndex,
        self.e.startIndex,
        self.f.startIndex
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
      self.$d.firstSubscriptableIndex,
      self.$e.firstSubscriptableIndex,
      self.$f.firstSubscriptableIndex
    )
  }
  
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
    let nextFIndex = self.$f.nextSubscriptableIndex(
      after: position.f,
      updating: &action
    )
    let nextEIndex = self.$e.nextSubscriptableIndex(
      after: position.e,
      updating: &action
    )
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
        nextDIndex,
        nextEIndex,
        nextFIndex
      )
    case .shouldAttemptAdvancement:
      return nil
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product6CollectionStorage - Conveniences
// -------------------------------------------------------------------------- //

internal extension Product6CollectionStorage {
  
  /// Retrieves the component-wise counts.
  @usableFromInline
  var constituentCounts: UniformInlineProduct6<Int> {
    get {
      return UniformInlineProduct6<Int>(
        self.$a.count,
        self.$b.count,
        self.$c.count,
        self.$d.count,
        self.$e.count,
        self.$f.count
      )
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: Product6CollectionStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension Product6CollectionStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Product6CollectionStorage"
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
        String(reflecting: F.self)
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
// MARK: Product6CollectionStorage - Position Retreat Support
// -------------------------------------------------------------------------- //

internal extension Product6CollectionStorage
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection,
  C:BidirectionalCollection,
  D:BidirectionalCollection,
  E:BidirectionalCollection,
  F:BidirectionalCollection {
  
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
    let previousFIndex = self.$f.previousSubscriptableIndex(
      before: position.f,
      updating: &action
    )
    let previousEIndex = self.$e.previousSubscriptableIndex(
      before: position.e,
      updating: &action
    )
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
        previousDIndex,
        previousEIndex,
        previousFIndex
      )
    case .shouldAttemptRetreat:
      return nil
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product6CollectionStorage - Distance Calculation
// -------------------------------------------------------------------------- //

internal extension Product6CollectionStorage {
  
  @usableFromInline
  typealias DistancesFromStarts = UniformInlineProduct6<Int>
  
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
      ),
      self.e.distance(
        from: self.e.startIndex,
        to: position.e
      ),
      self.f.distance(
        from: self.f.startIndex,
        to: position.f
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
      +
      self.countPerE * distancesFromStarts.e
      +
      self.countPerF * distancesFromStarts.f
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
    let (dDistance, dRemainder) = cRemainder.quotientAndRemainder(
      dividingBy: self.countPerD
    )
    let (eDistance, eRemainder) = dRemainder.quotientAndRemainder(
      dividingBy: self.countPerE
    )
    let fDistance = eRemainder
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert((0..<self.f.count).contains(fDistance))
    pedantic_assert((0..<self.e.count).contains(eDistance))
    pedantic_assert((0..<self.d.count).contains(dDistance))
    pedantic_assert((0..<self.c.count).contains(cDistance))
    pedantic_assert((0..<self.b.count).contains(bDistance))
    pedantic_assert((0..<self.a.count).contains(aDistance))
    // /////////////////////////////////////////////////////////////////////////
    return DistancesFromStarts(
      aDistance,
      bDistance,
      cDistance,
      dDistance,
      eDistance,
      fDistance
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
      ),
      self.e.index(
        self.e.startIndex,
        offsetBy: distancesFromStarts.e
      ),
      self.f.index(
        self.f.startIndex,
        offsetBy: distancesFromStarts.f
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
// MARK: Product6CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension Product6CollectionStorage {
  
  // TODO: any way to pull the cached properties over for the unchanged properties?
  
  @inlinable
  func with(a: A) -> Product6CollectionStorage<A,B,C,D,E,F,Position,Element> {
    return Product6CollectionStorage<A,B,C,D,E,F,Position,Element>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(b: B) -> Product6CollectionStorage<A,B,C,D,E,F,Position,Element> {
    return Product6CollectionStorage<A,B,C,D,E,F,Position,Element>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(c: C) -> Product6CollectionStorage<A,B,C,D,E,F,Position,Element> {
    return Product6CollectionStorage<A,B,C,D,E,F,Position,Element>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(d: D) -> Product6CollectionStorage<A,B,C,D,E,F,Position,Element> {
    return Product6CollectionStorage<A,B,C,D,E,F,Position,Element>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(e: E) -> Product6CollectionStorage<A,B,C,D,E,F,Position,Element> {
    return Product6CollectionStorage<A,B,C,D,E,F,Position,Element>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
  @inlinable
  func with(f: F) -> Product6CollectionStorage<A,B,C,D,E,F,Position,Element> {
    return Product6CollectionStorage<A,B,C,D,E,F,Position,Element>(
      a,
      b,
      c,
      d,
      e,
      f
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product6CollectionStorage - Validatable
// -------------------------------------------------------------------------- //

extension Product6CollectionStorage : Validatable {
  
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

// -------------------------------------------------------------------------- //
// MARK: Product6CollectionStorage - Equatable
// -------------------------------------------------------------------------- //

extension Product6CollectionStorage : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable,
  F:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: Product6CollectionStorage<A,B,C,D,E,F,Position,Element>,
    rhs: Product6CollectionStorage<A,B,C,D,E,F,Position,Element>) -> Bool {
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
      lhs.d == rhs.d,
      lhs.e == rhs.e,
      lhs.f == rhs.f else {
        return false
    }
    return true
  }
  
  @inlinable
  internal static func !=(
    lhs: Product6CollectionStorage<A,B,C,D,E,F,Position,Element>,
    rhs: Product6CollectionStorage<A,B,C,D,E,F,Position,Element>) -> Bool {
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
      lhs.d == rhs.d,
      lhs.e == rhs.e,
      lhs.f == rhs.f else {
        return true
    }
    return false
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product6CollectionStorage - Hashable
// -------------------------------------------------------------------------- //

extension Product6CollectionStorage : Hashable
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

// -------------------------------------------------------------------------- //
// MARK: Product6CollectionStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Product6CollectionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "( \(self.parameterDescriptions) )"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product6CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Product6CollectionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Product6CollectionStorage - Codable
// -------------------------------------------------------------------------- //

extension Product6CollectionStorage : Codable
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
