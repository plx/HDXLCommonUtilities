//
//  SumChain7CollectionStorage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class SumChain7CollectionStorage<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection> {
  
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

  // ------------------------------------------------------------------------ //
  // MARK: Index Support
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  internal typealias Index = SumChain7CollectionIndex<A,B,C,D,E,F,G>
  
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
      self.$g.firstSubscriptableIndex
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
      self.$g.firstSubscriptableIndex
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
    _ g: G) {
    self.a = a
    self.b = b
    self.c = c
    self.d = d
    self.e = e
    self.f = f
    self.g = g
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Position Support
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  internal typealias Element = Sum7<
    A.Element,
    B.Element,
    C.Element,
    D.Element,
    E.Element,
    F.Element,
    G.Element
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
// MARK: SumChain7CollectionStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension SumChain7CollectionStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "SumChain7CollectionStorage"
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
        String(reflecting: G.self)
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
        String(reflecting: self.g)
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
        "g: \(String(reflecting: self.g))"
        ].joined(separator: ", ")

    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionStorage - Position Advancement Support
// -------------------------------------------------------------------------- //

internal extension SumChain7CollectionStorage {
  
  @usableFromInline
  func firstPositionAfterA() -> Position? {
    return Position.firstNonNil(
      nil,
      self.$b.firstSubscriptableIndex,
      self.$c.firstSubscriptableIndex,
      self.$d.firstSubscriptableIndex,
      self.$e.firstSubscriptableIndex,
      self.$f.firstSubscriptableIndex,
      self.$g.firstSubscriptableIndex
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
      self.$g.firstSubscriptableIndex
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
      self.$g.firstSubscriptableIndex
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
      self.$g.firstSubscriptableIndex
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
      self.$g.firstSubscriptableIndex
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
      self.$g.firstSubscriptableIndex
    )
  }
  
  @usableFromInline
  func firstPositionAfterG() -> Position? {
    return nil
  }
  
  @inlinable
  func firstPosition(after position: Arity7Position) -> Position? {
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
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionStorage - Position Linearization Support
// -------------------------------------------------------------------------- //

internal extension SumChain7CollectionStorage {
  
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
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionStorage - Position Retreat
// -------------------------------------------------------------------------- //

internal extension SumChain7CollectionStorage
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection,
  C:BidirectionalCollection,
  D:BidirectionalCollection,
  E:BidirectionalCollection,
  F:BidirectionalCollection,
  G:BidirectionalCollection {
  
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
// MARK: SumChain7CollectionStorage - Position Retreat Support
// -------------------------------------------------------------------------- //

internal extension SumChain7CollectionStorage {
  
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
      nil
    )
  }
  
  @inlinable
  func finalPosition(before position: Arity7Position) -> Position? {
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
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension SumChain7CollectionStorage {
  
  // TODO: any way to pull the cached properties over for the unchanged properties?
  
  @inlinable
  func with(a: A) -> SumChain7CollectionStorage<A,B,C,D,E,F,G> {
    return SumChain7CollectionStorage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
  
  @inlinable
  func with(b: B) -> SumChain7CollectionStorage<A,B,C,D,E,F,G> {
    return SumChain7CollectionStorage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
  
  @inlinable
  func with(c: C) -> SumChain7CollectionStorage<A,B,C,D,E,F,G> {
    return SumChain7CollectionStorage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
  
  @inlinable
  func with(d: D) -> SumChain7CollectionStorage<A,B,C,D,E,F,G> {
    return SumChain7CollectionStorage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
  
  @inlinable
  func with(e: E) -> SumChain7CollectionStorage<A,B,C,D,E,F,G> {
    return SumChain7CollectionStorage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
  
  @inlinable
  func with(f: F) -> SumChain7CollectionStorage<A,B,C,D,E,F,G> {
    return SumChain7CollectionStorage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
  
  @inlinable
  func with(g: G) -> SumChain7CollectionStorage<A,B,C,D,E,F,G> {
    return SumChain7CollectionStorage<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionStorage - Validatable
// -------------------------------------------------------------------------- //

extension SumChain7CollectionStorage : Validatable {
  
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
        isValidOrIndifferent(self.g) else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionStorage - Equatable
// -------------------------------------------------------------------------- //

extension SumChain7CollectionStorage : Equatable
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable,
  F:Equatable,
  G:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: SumChain7CollectionStorage<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionStorage<A,B,C,D,E,F,G>) -> Bool {
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
      lhs.g == rhs.g else {
        return false
    }
    return true
  }
  
  @inlinable
  internal static func !=(
    lhs: SumChain7CollectionStorage<A,B,C,D,E,F,G>,
    rhs: SumChain7CollectionStorage<A,B,C,D,E,F,G>) -> Bool {
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
      lhs.g == rhs.g else {
        return true
    }
    return false
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionStorage - Hashable
// -------------------------------------------------------------------------- //

extension SumChain7CollectionStorage : Hashable
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable,
  F:Hashable,
  G:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
    self.d.hash(into: &hasher)
    self.e.hash(into: &hasher)
    self.f.hash(into: &hasher)
    self.g.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain7CollectionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "( \(self.parameterDescriptions) )"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension SumChain7CollectionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SumChain7CollectionStorage - Codable
// -------------------------------------------------------------------------- //

extension SumChain7CollectionStorage : Codable
  where
  A:Codable,
  B:Codable,
  C:Codable,
  D:Codable,
  E:Codable,
  F:Codable,
  G:Codable {
  
  @usableFromInline
  internal enum CodingKeys : String, CodingKey {
    
    case a = "a"
    case b = "b"
    case c = "c"
    case d = "d"
    case e = "e"
    case f = "f"
    case g = "g"
    
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
      )
    )
  }
  
}
