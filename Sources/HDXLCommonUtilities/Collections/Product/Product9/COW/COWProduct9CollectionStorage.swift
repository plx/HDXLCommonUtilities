//
//  COWProduct9CollectionStorage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class COWProduct9CollectionStorage<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection,
  I:Collection> {
  
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
    self._finalPosition = nil
    self._startIndex = nil
    self._countPerA = nil
    self._countPerB = nil
    self._countPerC = nil
    self._countPerD = nil
    self._countPerE = nil
    self._countPerF = nil
    self._countPerG = nil
    self._countPerH = nil
  }
  
  @usableFromInline
  internal func fullyPopulateCaches() {
    self.$a.fullyPopulateCaches()
    self.$b.fullyPopulateCaches()
    self.$c.fullyPopulateCaches()
    self.$d.fullyPopulateCaches()
    self.$e.fullyPopulateCaches()
    self.$f.fullyPopulateCaches()
    self.$g.fullyPopulateCaches()
    self.$h.fullyPopulateCaches()
    self.$i.fullyPopulateCaches()
    let _ = self.isEmpty
    let _ = self.count
    let _ = self.finalPosition
    let _ = self.startIndex
    let _ = self.countPerA
    let _ = self.countPerB
    let _ = self.countPerC
    let _ = self.countPerD
    let _ = self.countPerE
    let _ = self.countPerF
    let _ = self.countPerG
    let _ = self.countPerH
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
        self.$g.hasFullyPopulatedCaches,
        self.$h.hasFullyPopulatedCaches,
        self.$i.hasFullyPopulatedCaches,
        nil != self._isEmpty,
        nil != self._count,
        nil != self._finalPosition,
        nil != self._startIndex,
        nil != self._countPerA,
        nil != self._countPerB,
        nil != self._countPerC,
        nil != self._countPerD,
        nil != self._countPerE,
        nil != self._countPerF,
        nil != self._countPerG,
        nil != self._countPerH else {
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
        *
        self.$g.count
        *
        self.$h.count
        *
        self.$i.count
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

  @usableFromInline
  var _countPerF: Int? = nil

  @usableFromInline
  var _countPerG: Int? = nil

  @usableFromInline
  var _countPerH: Int? = nil

  // ------------------------------------------------------------------------ //
  // MARK: Incremental Count Support - Access
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  var countPerA: Int {
    get {
      return self._countPerA.obtainAssuredValue(
        fallingBackUpon: self.calculateCountPerA()
      )
    }
  }

  @usableFromInline
  var countPerB: Int {
    get {
      return self._countPerB.obtainAssuredValue(
        fallingBackUpon: self.calculateCountPerB()
      )
    }
  }

  @usableFromInline
  var countPerC: Int {
    get {
      return self._countPerC.obtainAssuredValue(
        fallingBackUpon: self.calculateCountPerC()
      )
    }
  }

  @usableFromInline
  var countPerD: Int {
    get {
      return self._countPerD.obtainAssuredValue(
        fallingBackUpon: self.calculateCountPerD()
      )
    }
  }

  @usableFromInline
  var countPerE: Int {
    get {
      return self._countPerE.obtainAssuredValue(
        fallingBackUpon: self.calculateCountPerE()
      )
    }
  }

  @usableFromInline
  var countPerF: Int {
    get {
      return self._countPerF.obtainAssuredValue(
        fallingBackUpon: self.calculateCountPerF()
      )
    }
  }

  @usableFromInline
  var countPerG: Int {
    get {
      return self._countPerG.obtainAssuredValue(
        fallingBackUpon: self.calculateCountPerG()
      )
    }
  }

  @usableFromInline
  var countPerH: Int {
    get {
      return self._countPerH.obtainAssuredValue(
        fallingBackUpon: self.calculateCountPerH()
      )
    }
  }

  @usableFromInline
  var countPerI: Int {
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
  func calculateCountPerH() -> Int {
    guard !self.isEmpty else {
      return 0
    }
    return self.$i.count
  }

  @usableFromInline
  func calculateCountPerG() -> Int {
    guard !self.isEmpty else {
      return 0
    }
    return self.countPerH * self.$h.count
  }

  @usableFromInline
  func calculateCountPerF() -> Int {
    guard !self.isEmpty else {
      return 0
    }
    return self.countPerG * self.$g.count
  }

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
  internal typealias Index = COWProduct9CollectionIndex<A,B,C,D,E,F,G,H,I>
  
  @usableFromInline
  internal typealias Position = Index.Position
  
  // ------------------------------------------------------------------------ //
  // MARK: startIndex Support
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  var _startIndex: Index? = nil
  
  @usableFromInline
  var startIndex: Index {
    get {
      return self._startIndex.obtainAssuredValue(
        fallingBackUpon: self.calculateStartIndex()
      )
    }
  }
  
  @usableFromInline
  func calculateStartIndex() -> Index {
    guard !self.isEmpty else {
      return self.endIndex
    }
    return Index(
      self.a.startIndex,
      self.b.startIndex,
      self.c.startIndex,
      self.d.startIndex,
      self.e.startIndex,
      self.f.startIndex,
      self.g.startIndex,
      self.h.startIndex,
      self.i.startIndex
    )
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: endIndex Support
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  var endIndex: Index {
    get {
      return Index.endIndex
    }
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
  internal typealias Element = COWProduct9<
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
  var _finalPosition: Position?? = nil
  
  @usableFromInline
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
      self.$f.firstSubscriptableIndex,
      self.$g.firstSubscriptableIndex,
      self.$h.firstSubscriptableIndex,
      self.$i.firstSubscriptableIndex
    )
  }
  
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
    let nextIIndex = self.$i.nextSubscriptableIndex(
      after: position.i,
      updating: &action
    )
    let nextHIndex = self.$h.nextSubscriptableIndex(
      after: position.h,
      updating: &action
    )
    let nextGIndex = self.$g.nextSubscriptableIndex(
      after: position.g,
      updating: &action
    )
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
        nextFIndex,
        nextGIndex,
        nextHIndex,
        nextIIndex
      )
    case .shouldAttemptAdvancement:
      return nil
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionStorage - Conveniences
// -------------------------------------------------------------------------- //

internal extension COWProduct9CollectionStorage {
  
  /// Retrieves the component-wise counts.
  @usableFromInline
  var constituentCounts: UniformInlineProduct9<Int> {
    get {
      return UniformInlineProduct9<Int>(
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
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension COWProduct9CollectionStorage {
  
  @usableFromInline
  static var shortTypeName: String {
    get {
      return "COWProduct9CollectionStorage"
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
// MARK: COWProduct9CollectionStorage - Position Retreat Support
// -------------------------------------------------------------------------- //

internal extension COWProduct9CollectionStorage
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
    // NOTE: this blindly does all 9 retreats then figures out at the end
    // if it "went over the edge" or not. This is more-efficient than it looks
    // b.c the `previousSubscriptableIndex` usually just returns the supplied index,
    // and it's *hopefully* not worth bloating this with a ton of early-exits
    // (e.g. checking for "hold position" after each advancement and bailing).
    guard !self.isEmpty else {
      return nil
    }
    var action: ProductIndexRetreatContext = .shouldAttemptRetreat
    let previousIIndex = self.$i.previousSubscriptableIndex(
      before: position.i,
      updating: &action
    )
    let previousHIndex = self.$h.previousSubscriptableIndex(
      before: position.h,
      updating: &action
    )
    let previousGIndex = self.$g.previousSubscriptableIndex(
      before: position.g,
      updating: &action
    )
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
        previousFIndex,
        previousGIndex,
        previousHIndex,
        previousIIndex
      )
    case .shouldAttemptRetreat:
      return nil
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionStorage - Distance Calculation
// -------------------------------------------------------------------------- //

internal extension COWProduct9CollectionStorage {
  
  @usableFromInline
  typealias DistancesFromStarts = InlineProduct9<Int,Int,Int,Int,Int,Int,Int,Int,Int>
  
  @usableFromInline
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
      ),
      self.g.distance(
        from: self.g.startIndex,
        to: position.g
      ),
      self.h.distance(
        from: self.h.startIndex,
        to: position.h
      ),
      self.i.distance(
        from: self.i.startIndex,
        to: position.i
      )
    )
  }
  
  @usableFromInline
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
      +
      self.countPerG * distancesFromStarts.g
      +
      self.countPerH * distancesFromStarts.h
      +
      self.countPerI * distancesFromStarts.i
    )
  }
  
  @usableFromInline
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
    let (fDistance, fRemainder) = eRemainder.quotientAndRemainder(
      dividingBy: self.countPerF
    )
    let (gDistance, gRemainder) = fRemainder.quotientAndRemainder(
      dividingBy: self.countPerG
    )
    let (hDistance, hRemainder) = gRemainder.quotientAndRemainder(
      dividingBy: self.countPerH
    )
    let iDistance = hRemainder
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert((0..<self.$i.count).contains(iDistance))
    pedantic_assert((0..<self.$h.count).contains(hDistance))
    pedantic_assert((0..<self.$g.count).contains(gDistance))
    pedantic_assert((0..<self.$f.count).contains(fDistance))
    pedantic_assert((0..<self.$e.count).contains(eDistance))
    pedantic_assert((0..<self.$d.count).contains(dDistance))
    pedantic_assert((0..<self.$c.count).contains(cDistance))
    pedantic_assert((0..<self.$b.count).contains(bDistance))
    pedantic_assert((0..<self.$a.count).contains(aDistance))
    // /////////////////////////////////////////////////////////////////////////
    return DistancesFromStarts(
      aDistance,
      bDistance,
      cDistance,
      dDistance,
      eDistance,
      fDistance,
      gDistance,
      hDistance,
      iDistance
    )
  }
  
  @usableFromInline
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
      ),
      self.g.index(
        self.g.startIndex,
        offsetBy: distancesFromStarts.g
      ),
      self.h.index(
        self.h.startIndex,
        offsetBy: distancesFromStarts.h
      ),
      self.i.index(
        self.i.startIndex,
        offsetBy: distancesFromStarts.i
      )
    )
  }
  
  @usableFromInline
  func position(forLinearPosition linearPosition: Int) -> Position {
    let distancesFromStarts = self.distancesFromStarts(forLinearPosition: linearPosition)
    return self.position(
      forDistancesFromStarts: distancesFromStarts
    )
  }
  
}


// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension COWProduct9CollectionStorage {
  
  // TODO: any way to pull the cached properties over for the unchanged properties?
  
  @usableFromInline
  func with(a: A) -> COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(b: B) -> COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(c: C) -> COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(d: D) -> COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(e: E) -> COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(f: F) -> COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(g: G) -> COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(h: H) -> COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(i: I) -> COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
// MARK: COWProduct9CollectionStorage - Validatable
// -------------------------------------------------------------------------- //

extension COWProduct9CollectionStorage : Validatable {
  
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

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionStorage - Equatable
// -------------------------------------------------------------------------- //

extension COWProduct9CollectionStorage : Equatable
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
    lhs: COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
    lhs: COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9CollectionStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
      lhs.f == rhs.f,
      lhs.g == rhs.g,
      lhs.h == rhs.h,
      lhs.i == rhs.i else {
        return true
    }
    return false
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionStorage - Hashable
// -------------------------------------------------------------------------- //

extension COWProduct9CollectionStorage : Hashable
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

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct9CollectionStorage : CustomStringConvertible {
  
  @usableFromInline
  internal var description: String {
    get {
      return "( \(self.parameterDescriptions) )"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension COWProduct9CollectionStorage : CustomDebugStringConvertible {
  
  @usableFromInline
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9CollectionStorage - Codable
// -------------------------------------------------------------------------- //

extension COWProduct9CollectionStorage : Codable
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
