//
//  SumChain9CollectionStorage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class SumChain9CollectionStorage<
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
  
  @inlinable
  internal func resetCaches() {
    self._isEmpty = nil
    self._count = nil
    
    self._rangeForA = nil
    self._rangeForB = nil
    self._rangeForC = nil
    self._rangeForD = nil
    self._rangeForE = nil
    self._rangeForF = nil
    self._rangeForG = nil
    self._rangeForH = nil
    self._rangeForI = nil
    
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
      &&
      self.b.isEmpty
      &&
      self.c.isEmpty
      &&
      self.d.isEmpty
      &&
      self.e.isEmpty
      &&
      self.f.isEmpty
      &&
      self.g.isEmpty
      &&
      self.h.isEmpty
      &&
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
    return (
      self.$a.count
      +
      self.$b.count
      +
      self.$c.count
      +
      self.$d.count
      +
      self.$e.count
      +
      self.$f.count
      +
      self.$g.count
      +
      self.$h.count
      +
      self.$i.count
    )
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Incremental Range Support - Storage
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  var _rangeForA: Range<Int>? = nil

  @usableFromInline
  var _rangeForB: Range<Int>? = nil

  @usableFromInline
  var _rangeForC: Range<Int>? = nil

  @usableFromInline
  var _rangeForD: Range<Int>? = nil

  @usableFromInline
  var _rangeForE: Range<Int>? = nil

  @usableFromInline
  var _rangeForF: Range<Int>? = nil

  @usableFromInline
  var _rangeForG: Range<Int>? = nil

  @usableFromInline
  var _rangeForH: Range<Int>? = nil

  @usableFromInline
  var _rangeForI: Range<Int>? = nil

  // ------------------------------------------------------------------------ //
  // MARK: Incremental Range Support - Access
  // ------------------------------------------------------------------------ //
  
  @inlinable
  var rangeForA: Range<Int> {
    get {
      return self._rangeForA.obtainAssuredValue(
        fallingBackUpon: self.calculateRangeForA()
      )
    }
  }

  @inlinable
  var rangeForB: Range<Int> {
    get {
      return self._rangeForB.obtainAssuredValue(
        fallingBackUpon: self.calculateRangeForB()
      )
    }
  }

  @inlinable
  var rangeForC: Range<Int> {
    get {
      return self._rangeForC.obtainAssuredValue(
        fallingBackUpon: self.calculateRangeForC()
      )
    }
  }

  @inlinable
  var rangeForD: Range<Int> {
    get {
      return self._rangeForD.obtainAssuredValue(
        fallingBackUpon: self.calculateRangeForD()
      )
    }
  }

  @inlinable
  var rangeForE: Range<Int> {
    get {
      return self._rangeForE.obtainAssuredValue(
        fallingBackUpon: self.calculateRangeForE()
      )
    }
  }

  @inlinable
  var rangeForF: Range<Int> {
    get {
      return self._rangeForF.obtainAssuredValue(
        fallingBackUpon: self.calculateRangeForF()
      )
    }
  }

  @inlinable
  var rangeForG: Range<Int> {
    get {
      return self._rangeForG.obtainAssuredValue(
        fallingBackUpon: self.calculateRangeForG()
      )
    }
  }

  @inlinable
  var rangeForH: Range<Int> {
    get {
      return self._rangeForH.obtainAssuredValue(
        fallingBackUpon: self.calculateRangeForH()
      )
    }
  }

  @inlinable
  var rangeForI: Range<Int> {
    get {
      return self._rangeForI.obtainAssuredValue(
        fallingBackUpon: self.calculateRangeForI()
      )
    }
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Incremental Range Support - Calculation
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  func calculateRangeForA() -> Range<Int> {
    guard !self.isEmpty else {
      return 0..<0
    }
    return 0..<self.$a.count
  }

  @usableFromInline
  func calculateRangeForB() -> Range<Int> {
    guard !self.isEmpty else {
      return 0..<0
    }
    let previousUpperBound = self.rangeForA.upperBound
    let currentCount = self.$b.count
    return previousUpperBound..<(previousUpperBound + currentCount)
  }

  @usableFromInline
  func calculateRangeForC() -> Range<Int> {
    guard !self.isEmpty else {
      return 0..<0
    }
    let previousUpperBound = self.rangeForB.upperBound
    let currentCount = self.$c.count
    return previousUpperBound..<(previousUpperBound + currentCount)
  }

  @usableFromInline
  func calculateRangeForD() -> Range<Int> {
    guard !self.isEmpty else {
      return 0..<0
    }
    let previousUpperBound = self.rangeForC.upperBound
    let currentCount = self.$d.count
    return previousUpperBound..<(previousUpperBound + currentCount)
  }

  @usableFromInline
  func calculateRangeForE() -> Range<Int> {
    guard !self.isEmpty else {
      return 0..<0
    }
    let previousUpperBound = self.rangeForD.upperBound
    let currentCount = self.$e.count
    return previousUpperBound..<(previousUpperBound + currentCount)
  }

  @usableFromInline
  func calculateRangeForF() -> Range<Int> {
    guard !self.isEmpty else {
      return 0..<0
    }
    let previousUpperBound = self.rangeForE.upperBound
    let currentCount = self.$f.count
    return previousUpperBound..<(previousUpperBound + currentCount)
  }

  @usableFromInline
  func calculateRangeForG() -> Range<Int> {
    guard !self.isEmpty else {
      return 0..<0
    }
    let previousUpperBound = self.rangeForF.upperBound
    let currentCount = self.$g.count
    return previousUpperBound..<(previousUpperBound + currentCount)
  }

  @usableFromInline
  func calculateRangeForH() -> Range<Int> {
    guard !self.isEmpty else {
      return 0..<0
    }
    let previousUpperBound = self.rangeForG.upperBound
    let currentCount = self.$h.count
    return previousUpperBound..<(previousUpperBound + currentCount)
  }

  @usableFromInline
  func calculateRangeForI() -> Range<Int> {
    guard !self.isEmpty else {
      return 0..<0
    }
    let previousUpperBound = self.rangeForH.upperBound
    let currentCount = self.$i.count
    return previousUpperBound..<(previousUpperBound + currentCount)
  }
    
  // ------------------------------------------------------------------------ //
  // MARK: Index Support
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  internal typealias Index = SumChain9CollectionIndex<A,B,C,D,E,F,G,H,I>
  
  @usableFromInline
  internal typealias Position = Index.Position
  
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
    // recall: lazy evaluation, first-to-last
    return Position.firstNonNil(
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
    // recall: lazy evaluation, last-to-first
    return Position.finalNonNil(
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

  // ------------------------------------------------------------------------ //
  // MARK: Extremal Indices
  // ------------------------------------------------------------------------ //

  @inlinable
  var startIndex: Index {
    get {
      guard let firstPosition = self.firstPosition else {
        return self.endIndex
      }
      return Index(position: firstPosition)
    }
  }
  
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
  internal typealias Element = Sum9<
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
  
  @inlinable
  subscript(position: Position) -> Element {
    get {
      switch position {
      case .a(let a):
        return .a(self.a[a])
      case .b(let b):
        return .b(self.b[b])
      case .c(let c):
        return .c(self.c[c])
      case .d(let d):
        return .d(self.d[d])
      case .e(let e):
        return .e(self.e[e])
      case .f(let f):
        return .f(self.f[f])
      case .g(let g):
        return .g(self.g[g])
      case .h(let h):
        return .h(self.h[h])
      case .i(let i):
        return .i(self.i[i])
      }
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
    switch position {
    case .a(let a):
      guard let nextAIndex = self.$a.subscriptableIndex(after: a) else {
        return self.firstPosition(after: .a)
      }
      return .a(nextAIndex)
    case .b(let b):
      guard let nextBIndex = self.$b.subscriptableIndex(after: b) else {
        return self.firstPosition(after: .b)
      }
      return .b(nextBIndex)
    case .c(let c):
      guard let nextCIndex = self.$c.subscriptableIndex(after: c) else {
        return self.firstPosition(after: .c)
      }
      return .c(nextCIndex)
    case .d(let d):
      guard let nextDIndex = self.$d.subscriptableIndex(after: d) else {
        return self.firstPosition(after: .d)
      }
      return .d(nextDIndex)
    case .e(let e):
      guard let nextEIndex = self.$e.subscriptableIndex(after: e) else {
        return self.firstPosition(after: .e)
      }
      return .e(nextEIndex)
    case .f(let f):
      guard let nextFIndex = self.$f.subscriptableIndex(after: f) else {
        return self.firstPosition(after: .f)
      }
      return .f(nextFIndex)
    case .g(let g):
      guard let nextGIndex = self.$g.subscriptableIndex(after: g) else {
        return self.firstPosition(after: .g)
      }
      return .g(nextGIndex)
    case .h(let h):
      guard let nextHIndex = self.$h.subscriptableIndex(after: h) else {
        return self.firstPosition(after: .h)
      }
      return .h(nextHIndex)
    case .i(let i):
      guard let nextIIndex = self.$i.subscriptableIndex(after: i) else {
        return self.firstPosition(after: .i)
      }
      return .i(nextIIndex)
    }
  }
  
  @inlinable
  func position(
    _ position: Position,
    offsetBy distance: Int) -> Position? {
    let linearPosition = self.linearPosition(forPosition: position)
    let destination = linearPosition + distance
    guard (0...self.count).contains(destination) else {
      preconditionFailure("Invalid navigation, went from \(position) (linear: \(linearPosition)) => \(destination) (offset: \(distance)), but valid range is 0...\(self.count)!")
    }
    guard destination < self.count else {
      return nil
    }
    return self.position(
      forLinearPosition: destination
    )
  }
  
  @inlinable
  func distance(
    from start: Position,
    to end: Position) -> Int {
    return (
      self.linearPosition(forPosition: end)
      -
      self.linearPosition(forPosition: start)
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain9CollectionStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain9CollectionStorage"
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
        String(reflecting: I.self)
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
// MARK: SumChain9CollectionStorage - Position Advancement Support
// -------------------------------------------------------------------------- //

internal extension SumChain9CollectionStorage {
  
  @usableFromInline
  func firstPositionAfterA() -> Position? {
    return Position.firstNonNil(
      nil,
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
  func firstPositionAfterB() -> Position? {
    return Position.firstNonNil(
      nil,
      nil,
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
  func firstPositionAfterC() -> Position? {
    return Position.firstNonNil(
      nil,
      nil,
      nil,
      self.$d.firstSubscriptableIndex,
      self.$e.firstSubscriptableIndex,
      self.$f.firstSubscriptableIndex,
      self.$g.firstSubscriptableIndex,
      self.$h.firstSubscriptableIndex,
      self.$i.firstSubscriptableIndex
    )
  }
  
  @usableFromInline
  func firstPositionAfterD() -> Position? {
    return Position.firstNonNil(
      nil,
      nil,
      nil,
      nil,
      self.$e.firstSubscriptableIndex,
      self.$f.firstSubscriptableIndex,
      self.$g.firstSubscriptableIndex,
      self.$h.firstSubscriptableIndex,
      self.$i.firstSubscriptableIndex
    )
  }
  
  @usableFromInline
  func firstPositionAfterE() -> Position? {
    return Position.firstNonNil(
      nil,
      nil,
      nil,
      nil,
      nil,
      self.$f.firstSubscriptableIndex,
      self.$g.firstSubscriptableIndex,
      self.$h.firstSubscriptableIndex,
      self.$i.firstSubscriptableIndex
    )
  }
  
  @usableFromInline
  func firstPositionAfterF() -> Position? {
    return Position.firstNonNil(
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      self.$g.firstSubscriptableIndex,
      self.$h.firstSubscriptableIndex,
      self.$i.firstSubscriptableIndex
    )
  }
  
  @usableFromInline
  func firstPositionAfterG() -> Position? {
    return Position.firstNonNil(
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      self.$h.firstSubscriptableIndex,
      self.$i.firstSubscriptableIndex
    )
  }
  
  @usableFromInline
  func firstPositionAfterH() -> Position? {
    return Position.firstNonNil(
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      self.$i.firstSubscriptableIndex
    )
  }
  
  @usableFromInline
  func firstPositionAfterI() -> Position? {
    return nil
  }
  
  @inlinable
  func firstPosition(after position: Arity9Position) -> Position? {
    switch position {
    case .a:
      return self.firstPositionAfterA()
    case .b:
      return self.firstPositionAfterB()
    case .c:
      return self.firstPositionAfterC()
    case .d:
      return self.firstPositionAfterD()
    case .e:
      return self.firstPositionAfterE()
    case .f:
      return self.firstPositionAfterF()
    case .g:
      return self.firstPositionAfterG()
    case .h:
      return self.firstPositionAfterH()
    case .i:
      return self.firstPositionAfterI()
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionStorage - Position Linearization Support
// -------------------------------------------------------------------------- //

internal extension SumChain9CollectionStorage {
  
  @inlinable
  func position(forLinearPosition linearPosition: Int) -> Position {
    if self.rangeForA.contains(linearPosition) {
      return .a(
        self.a.index(
          self.a.startIndex,
          offsetBy: linearPosition - self.rangeForA.lowerBound
        )
      )
    } else if self.rangeForB.contains(linearPosition) {
      return .b(
        self.b.index(
          self.b.startIndex,
          offsetBy: linearPosition - self.rangeForB.lowerBound
        )
      )
    } else if self.rangeForC.contains(linearPosition) {
      return .c(
        self.c.index(
          self.c.startIndex,
          offsetBy: linearPosition - self.rangeForC.lowerBound
        )
      )
    } else if self.rangeForD.contains(linearPosition) {
      return .d(
        self.d.index(
          self.d.startIndex,
          offsetBy: linearPosition - self.rangeForD.lowerBound
        )
      )
    } else if self.rangeForE.contains(linearPosition) {
      return .e(
        self.e.index(
          self.e.startIndex,
          offsetBy: linearPosition - self.rangeForE.lowerBound
        )
      )
    } else if self.rangeForF.contains(linearPosition) {
      return .f(
        self.f.index(
          self.f.startIndex,
          offsetBy: linearPosition - self.rangeForF.lowerBound
        )
      )
    } else if self.rangeForG.contains(linearPosition) {
      return .g(
        self.g.index(
          self.g.startIndex,
          offsetBy: linearPosition - self.rangeForG.lowerBound
        )
      )
    } else if self.rangeForH.contains(linearPosition) {
      return .h(
        self.h.index(
          self.h.startIndex,
          offsetBy: linearPosition - self.rangeForH.lowerBound
        )
      )
    } else if self.rangeForI.contains(linearPosition) {
      return .i(
        self.i.index(
          self.i.startIndex,
          offsetBy: linearPosition - self.rangeForI.lowerBound
        )
      )
    } else {
      preconditionFailure("Attempted to obtain position for out-of-bounds `linearPosition` \(linearPosition) in \(self.debugDescription)!")
    }
  }
  
  @inlinable
  func linearPosition(forPosition position: Position) -> Int {
    switch position {
    case .a(let a):
      return (
        self.rangeForA.lowerBound
        +
        self.a.distance(
          from: self.a.startIndex,
          to: a
        )
      )
    case .b(let b):
      return (
        self.rangeForB.lowerBound
        +
        self.b.distance(
          from: self.b.startIndex,
          to: b
        )
      )
    case .c(let c):
      return (
        self.rangeForC.lowerBound
          +
          self.c.distance(
            from: self.c.startIndex,
            to: c
        )
      )
    case .d(let d):
      return (
        self.rangeForD.lowerBound
          +
          self.d.distance(
            from: self.d.startIndex,
            to: d
        )
      )
    case .e(let e):
      return (
        self.rangeForE.lowerBound
          +
          self.e.distance(
            from: self.e.startIndex,
            to: e
        )
      )
    case .f(let f):
      return (
        self.rangeForF.lowerBound
          +
          self.f.distance(
            from: self.f.startIndex,
            to: f
        )
      )
    case .g(let g):
      return (
        self.rangeForG.lowerBound
          +
          self.g.distance(
            from: self.g.startIndex,
            to: g
        )
      )
    case .h(let h):
      return (
        self.rangeForH.lowerBound
          +
          self.h.distance(
            from: self.h.startIndex,
            to: h
        )
      )
    case .i(let i):
      return (
        self.rangeForI.lowerBound
          +
          self.i.distance(
            from: self.i.startIndex,
            to: i
        )
      )
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionStorage - Position Retreat
// -------------------------------------------------------------------------- //

internal extension SumChain9CollectionStorage
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
    switch position {
    case .i(let i):
      guard let previousIIndex = self.$i.subscriptableIndex(before: i) else {
        return self.finalPositionBeforeI()
      }
      return .i(previousIIndex)
    case .h(let h):
      guard let previousHIndex = self.$h.subscriptableIndex(before: h) else {
        return self.finalPositionBeforeH()
      }
      return .h(previousHIndex)
    case .g(let g):
      guard let previousGIndex = self.$g.subscriptableIndex(before: g) else {
        return self.finalPositionBeforeG()
      }
      return .g(previousGIndex)
    case .f(let f):
      guard let previousFIndex = self.$f.subscriptableIndex(before: f) else {
        return self.finalPositionBeforeF()
      }
      return .f(previousFIndex)
    case .e(let e):
      guard let previousEIndex = self.$e.subscriptableIndex(before: e) else {
        return self.finalPositionBeforeE()
      }
      return .e(previousEIndex)
    case .d(let d):
      guard let previousDIndex = self.$d.subscriptableIndex(before: d) else {
        return self.finalPositionBeforeD()
      }
      return .d(previousDIndex)
    case .c(let c):
      guard let previousCIndex = self.$c.subscriptableIndex(before: c) else {
        return self.finalPositionBeforeC()
      }
      return .c(previousCIndex)
    case .b(let b):
      guard let previousBIndex = self.$b.subscriptableIndex(before: b) else {
        return self.finalPositionBeforeB()
      }
      return .b(previousBIndex)
    case .a(let a):
      guard let previousAIndex = self.$a.subscriptableIndex(before: a) else {
        return self.finalPositionBeforeA()
      }
      return .a(previousAIndex)
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionStorage - Position Retreat Support
// -------------------------------------------------------------------------- //

internal extension SumChain9CollectionStorage {
  
  @usableFromInline
  func finalPositionBeforeA() -> Position? {
    return nil
  }
  
  @usableFromInline
  func finalPositionBeforeB() -> Position? {
    return Position.finalNonNil(
      self.$a.finalSubscriptableIndex,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil
    )
  }
  
  @usableFromInline
  func finalPositionBeforeC() -> Position? {
    return Position.finalNonNil(
      self.$a.finalSubscriptableIndex,
      self.$b.finalSubscriptableIndex,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil
    )
  }
  
  @usableFromInline
  func finalPositionBeforeD() -> Position? {
    return Position.finalNonNil(
      self.$a.finalSubscriptableIndex,
      self.$b.finalSubscriptableIndex,
      self.$c.finalSubscriptableIndex,
      nil,
      nil,
      nil,
      nil,
      nil,
      nil
    )
  }
  
  @usableFromInline
  func finalPositionBeforeE() -> Position? {
    return Position.finalNonNil(
      self.$a.finalSubscriptableIndex,
      self.$b.finalSubscriptableIndex,
      self.$c.finalSubscriptableIndex,
      self.$d.finalSubscriptableIndex,
      nil,
      nil,
      nil,
      nil,
      nil
    )
  }
  
  @usableFromInline
  func finalPositionBeforeF() -> Position? {
    return Position.finalNonNil(
      self.$a.finalSubscriptableIndex,
      self.$b.finalSubscriptableIndex,
      self.$c.finalSubscriptableIndex,
      self.$d.finalSubscriptableIndex,
      self.$e.finalSubscriptableIndex,
      nil,
      nil,
      nil,
      nil
    )
  }
  
  @usableFromInline
  func finalPositionBeforeG() -> Position? {
    return Position.finalNonNil(
      self.$a.finalSubscriptableIndex,
      self.$b.finalSubscriptableIndex,
      self.$c.finalSubscriptableIndex,
      self.$d.finalSubscriptableIndex,
      self.$e.finalSubscriptableIndex,
      self.$f.finalSubscriptableIndex,
      nil,
      nil,
      nil
    )
  }
  
  @usableFromInline
  func finalPositionBeforeH() -> Position? {
    return Position.finalNonNil(
      self.$a.finalSubscriptableIndex,
      self.$b.finalSubscriptableIndex,
      self.$c.finalSubscriptableIndex,
      self.$d.finalSubscriptableIndex,
      self.$e.finalSubscriptableIndex,
      self.$f.finalSubscriptableIndex,
      self.$g.finalSubscriptableIndex,
      nil,
      nil
    )
  }
  
  @usableFromInline
  func finalPositionBeforeI() -> Position? {
    return Position.finalNonNil(
      self.$a.finalSubscriptableIndex,
      self.$b.finalSubscriptableIndex,
      self.$c.finalSubscriptableIndex,
      self.$d.finalSubscriptableIndex,
      self.$e.finalSubscriptableIndex,
      self.$f.finalSubscriptableIndex,
      self.$g.finalSubscriptableIndex,
      self.$h.finalSubscriptableIndex,
      nil
    )
  }
  
  @inlinable
  func finalPosition(before position: Arity9Position) -> Position? {
    switch position {
    case .a:
      return self.finalPositionBeforeA()
    case .b:
      return self.finalPositionBeforeB()
    case .c:
      return self.finalPositionBeforeC()
    case .d:
      return self.finalPositionBeforeD()
    case .e:
      return self.finalPositionBeforeE()
    case .f:
      return self.finalPositionBeforeF()
    case .g:
      return self.finalPositionBeforeG()
    case .h:
      return self.finalPositionBeforeH()
    case .i:
      return self.finalPositionBeforeI()
    }
  }

  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension SumChain9CollectionStorage {
  
  // TODO: any way to pull the cached properties over for the unchanged properties?
  
  @inlinable
  func with(a: A) -> SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(b: B) -> SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(c: C) -> SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(d: D) -> SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(e: E) -> SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(f: F) -> SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(g: G) -> SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(h: H) -> SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
  func with(i: I) -> SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I> {
    return SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I>(
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
// MARK: SumChain9CollectionStorage - Validatable
// -------------------------------------------------------------------------- //

extension SumChain9CollectionStorage : Validatable {
  
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

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionStorage - Equatable
// -------------------------------------------------------------------------- //

extension SumChain9CollectionStorage : Equatable
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
    lhs: SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
  
  @inlinable
  internal static func !=(
    lhs: SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I>,
    rhs: SumChain9CollectionStorage<A,B,C,D,E,F,G,H,I>) -> Bool {
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
// MARK: SumChain9CollectionStorage - Hashable
// -------------------------------------------------------------------------- //

extension SumChain9CollectionStorage : Hashable
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

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain9CollectionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "( \(self.parameterDescriptions) )"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain9CollectionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain9CollectionStorage - Codable
// -------------------------------------------------------------------------- //

extension SumChain9CollectionStorage : Codable
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
    
    @inlinable
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
    
    @inlinable
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
