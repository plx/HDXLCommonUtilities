//
//  Chain2CollectionStorage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Chain2CollectionStorage - Definition
// -------------------------------------------------------------------------- //

@usableFromInline
internal final class Chain2CollectionStorage<
  A:Collection,
  B:Collection>
  where
  A.Element == B.Element {
  
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
    
    self._rangeForA = nil
    self._rangeForB = nil
    
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
    )
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Incremental Range Support - Storage
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  var _rangeForA: Range<Int>? = nil

  @usableFromInline
  var _rangeForB: Range<Int>? = nil

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

  // ------------------------------------------------------------------------ //
  // MARK: Index Support
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  internal typealias Index = Chain2CollectionIndex<A,B>
  
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
      self.$b.firstSubscriptableIndex
    )
  }

  @usableFromInline
  func calculateFinalPosition() -> Position? {
    // recall: lazy evaluation, last-to-first
    return Position.finalNonNil(
      self.$a.finalSubscriptableIndex,
      self.$b.finalSubscriptableIndex
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
    _ b: B) {
    self.a = a
    self.b = b
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Position Support
  // ------------------------------------------------------------------------ //
  
  @usableFromInline
  internal typealias Element = A.Element
  
  @inlinable
  subscript(position: Position) -> Element {
    get {
      switch position {
      case .a(let a):
        return self.a[a]
      case .b(let b):
        return self.b[b]
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
// MARK: Chain2CollectionStorage - Reflection Support
// -------------------------------------------------------------------------- //

internal extension Chain2CollectionStorage {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "Chain2CollectionStorage"
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
// MARK: Chain2CollectionStorage - Position Advancement Support
// -------------------------------------------------------------------------- //

internal extension Chain2CollectionStorage {
  
  @usableFromInline
  func firstPositionAfterA() -> Position? {
    return Position.firstNonNil(
      nil,
      self.$b.firstSubscriptableIndex
    )
  }
  
  @usableFromInline
  func firstPositionAfterB() -> Position? {
    return nil
  }
  
  @inlinable
  func firstPosition(after position: Arity2Position) -> Position? {
    switch position {
    case .a:
      return self.firstPositionAfterA()
    case .b:
      return self.firstPositionAfterB()
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain2CollectionStorage - Position Linearization Support
// -------------------------------------------------------------------------- //

internal extension Chain2CollectionStorage {
  
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
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain2CollectionStorage - Position Retreat
// -------------------------------------------------------------------------- //

internal extension Chain2CollectionStorage
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
    switch position {
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
// MARK: Chain2CollectionStorage - Position Retreat Support
// -------------------------------------------------------------------------- //

internal extension Chain2CollectionStorage {
  
  @usableFromInline
  func finalPositionBeforeA() -> Position? {
    return nil
  }
  
  @usableFromInline
  func finalPositionBeforeB() -> Position? {
    return Position.finalNonNil(
      self.$a.finalSubscriptableIndex,
      nil
    )
  }
    
  @inlinable
  func finalPosition(before position: Arity2Position) -> Position? {
    switch position {
    case .a:
      return self.finalPositionBeforeA()
    case .b:
      return self.finalPositionBeforeB()
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain2CollectionStorage - With Derivation
// -------------------------------------------------------------------------- //

internal extension Chain2CollectionStorage {
  
  // TODO: any way to pull the cached properties over for the unchanged properties?
  
  @inlinable
  func with(a: A) -> Chain2CollectionStorage<A,B> {
    return Chain2CollectionStorage<A,B>(
      a,
      b
    )
  }
  
  @inlinable
  func with(b: B) -> Chain2CollectionStorage<A,B> {
    return Chain2CollectionStorage<A,B>(
      a,
      b
    )
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: Chain2CollectionStorage - Validatable
// -------------------------------------------------------------------------- //

extension Chain2CollectionStorage : Validatable {
  
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
// MARK: Chain2CollectionStorage - Equatable
// -------------------------------------------------------------------------- //

extension Chain2CollectionStorage : Equatable
  where
  A:Equatable,
  B:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: Chain2CollectionStorage<A,B>,
    rhs: Chain2CollectionStorage<A,B>) -> Bool {
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
    lhs: Chain2CollectionStorage<A,B>,
    rhs: Chain2CollectionStorage<A,B>) -> Bool {
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
// MARK: Chain2CollectionStorage - Hashable
// -------------------------------------------------------------------------- //

extension Chain2CollectionStorage : Hashable
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
// MARK: Chain2CollectionStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Chain2CollectionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "( \(self.parameterDescriptions) )"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain2CollectionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Chain2CollectionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Chain2CollectionStorage - Codable
// -------------------------------------------------------------------------- //

extension Chain2CollectionStorage : Codable
  where
  A:Codable,
  B:Codable {
  
  @usableFromInline
  internal enum CodingKeys : String, CodingKey {
    
    case a = "a"
    case b = "b"
    
    @inlinable
    internal var intValue: Int? {
      get {
        switch self {
        case .a:
          return 0
        case .b:
          return 1
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
