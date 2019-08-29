//
//  ProductZip2Collection.swift
//

import Foundation

// ------------------------------------------------------------------------ //
// MARK: ProductZip2Collection - Definition
// ------------------------------------------------------------------------ //

public struct ProductZip2Collection<A,B,Position,Element>
  where
  A:Collection,
  B:Collection,
  Position:AlgebraicProduct2,
  Position.A == A.Index,
  Position.B == B.Index,
  Element:AlgebraicProduct2,
  Element.A == A.Element,
  Element.B == B.Element {
  
  @usableFromInline
  internal typealias Storage = ProductZip2CollectionStorage<A,B,Position,Element>
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal init(storage: Storage) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(storage.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.storage = storage
  }
  
  @inlinable
  public init(
    _ a: A,
    _ b: B) {
    self.init(
      storage: Storage(
        a,
        b
      )
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip2Collection - Property Exposure
// -------------------------------------------------------------------------- //

public extension ProductZip2Collection {
  
  @inlinable
  var a: A {
    get {
      return self.storage.a
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      // ///////////////////////////////////////////////////////////////////////
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.a = newValue
      } else {
        self.storage = self.storage.with(
          a: newValue
        )
      }
    }
  }
  
  @inlinable
  var b: B {
    get {
      return self.storage.b
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid) }
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      // ///////////////////////////////////////////////////////////////////////
      if isKnownUniquelyReferenced(&self.storage) {
        self.storage.b = newValue
      } else {
        self.storage = self.storage.with(
          b: newValue
        )
      }
    }
  }

}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2Collection - Reflection Support
// ------------------------------------------------------------------------ //

internal extension ProductZip2Collection {
  
  @inlinable
  static var shortTypeName: String {
    get {
      return "ProductZip2Collection"
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

// ------------------------------------------------------------------------ //
// MARK: ProductZip2Collection - Validatable
// ------------------------------------------------------------------------ //

extension ProductZip2Collection : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2Collection - Equatable
// ------------------------------------------------------------------------ //

extension ProductZip2Collection : Equatable
  where
  A:Equatable,
  B:Equatable {
  
  @inlinable
  public static func ==(
    lhs: ProductZip2Collection<A,B,Position,Element>,
    rhs: ProductZip2Collection<A,B,Position,Element>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: ProductZip2Collection<A,B,Position,Element>,
    rhs: ProductZip2Collection<A,B,Position,Element>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2Collection - Hashable
// ------------------------------------------------------------------------ //

extension ProductZip2Collection : Hashable
  where
  A:Hashable,
  B:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2Collection - CustomStringConvertible
// ------------------------------------------------------------------------ //

extension ProductZip2Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "(\(self.parameterDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2Collection - CustomDebugStringConvertible
// ------------------------------------------------------------------------ //

extension ProductZip2Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "\(type(of: self).completeTypeName)(\(self.parameterDebugDescriptions))"
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2Collection - Codable
// ------------------------------------------------------------------------ //

extension ProductZip2Collection : Codable
  where
  A:Codable,
  B:Codable {
  
  // synthesized ok
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2Collection - Collection
// ------------------------------------------------------------------------ //

extension ProductZip2Collection : Collection {

  public typealias Index = ProductZip2CollectionIndex<Position>
  
  @inlinable
  public var isEmpty: Bool {
    get {
      return self.storage.isEmpty
    }
  }
  
  @inlinable
  public var count: Int {
    get {
      return self.storage.count
    }
  }
  
  @inlinable
  public var startIndex: Index {
    get {
      guard let firstPosition = self.storage.firstPosition else {
        return self.endIndex
      }
      return Index(
        position: firstPosition
      )
    }
  }
  
  @inlinable
  public var endIndex: Index {
    get {
      return Index.endIndex
    }
  }
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      switch index.storage {
      case .position(let position):
        return self.storage[position]
      case .end:
        preconditionFailure("Tried to subscript the end index on \(String(reflecting: self))!")
      }
    }
  }
  
  @inlinable
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(start.isValid)
    pedantic_assert(end.isValid)
    pedantic_assert(self.couldHaveCreated(index: start))
    pedantic_assert(self.couldHaveCreated(index: end))
    // /////////////////////////////////////////////////////////////////////////
    switch (start.storage, end.storage) {
    case (.position(let startPosition), .position(let endPosition)):
      return (
        self.linearIndex(forPosition: endPosition)
        -
        self.linearIndex(forPosition: startPosition)
      )
    case (.position(let startPosition), .end):
      return (
        self.count
        -
        self.linearIndex(forPosition: startPosition)
      )
    case (.end, .position(let endPosition)):
      return (
        self.linearIndex(forPosition: endPosition)
        -
        self.count
      )
    case (.end, .end):
      return 0
    }
  }
  
  @inlinable
  public func index(after index: Index) -> Index {
    switch index.storage {
    case .position(let position):
      guard let nextPosition = self.position(after: position) else {
        return self.endIndex
      }
      return Index(
        position: nextPosition
      )
    case .end:
      preconditionFailure("Tried to advance the end index on \(String(reflecting: self))!")
    }
  }
  
  @inlinable
  public func formIndex(after index: inout Index) {
    index.unsafe_mandatoryPositionMutation() {
      (position: inout Position) -> IndexPositionStoragePositionMutationDetermination
      in
      let gotNextPosition = self.formPosition(after: &position)
      switch gotNextPosition {
      case true:
        return .success
      case false:
        return .becomeEnd
      }
    }
  }
  
  @inlinable
  public func index(
    _ index: Index,
    offsetBy distance: Int) -> Index {
    guard distance != 0 else {
      return index
    }
    switch index.storage {
    case .position(let position):
      switch self.position(position, offsetBy: distance) {
      case .success(let destination):
        return Index(
          position: destination
        )
      case .becameEnd:
        return self.endIndex
      case .misnavigation:
        preconditionFailure("Attempted invalid navigation from \(index)")
      }
    case .end:
      switch self.endIndexReplacement(forDistanceFromEndIndex: distance) {
      case .position(let position):
        return Index(
          position: position
        )
      case .end:
        return self.endIndex
      case .misnavigation:
        preconditionFailure("Attemped offset by invalid distance \(distance) from `endIndex` in \(String(reflecting: self))")
      }
    }
  }
  
  @inlinable
  public func formIndex(
    _ index: inout Index,
    offsetBy distance: Int) {
    guard distance != 0 else {
      return
    }
    index.unsafe_performMutation(
      sendingEndTo: self.endIndexReplacement(forDistanceFromEndIndex: distance)) {
        (position: inout Position) -> IndexPositionStoragePositionMutationDetermination
        in
        switch self.formPosition(&position, offsetBy: distance) {
        case .success:
          return .success
        case .becameEnd:
          return .becomeEnd
        case .misnavigation:
          return .failure
        }
    }
  }
  
}

// ------------------------------------------------------------------------ //
// MARK: ProductZip2Collection - BidirectionalCollection
// ------------------------------------------------------------------------ //

extension ProductZip2Collection : BidirectionalCollection
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection {
  
  @inlinable
  public func index(before index: Index) -> Index {
    precondition(index > self.startIndex)
    switch index.storage {
    case .position(let position):
      guard let previousPosition = self.position(before: position) else {
        preconditionFailure("Tried to go back from the start index in \(String(reflecting: self))!")
      }
      return Index(
        position: previousPosition
      )
    case .end:
      guard let finalPosition = self.storage.finalPosition else {
        preconditionFailure("Tried to go back from the start index in \(String(reflecting: self))!")
      }
      return Index(
        position: finalPosition
      )
    }
  }
  
  @inlinable
  public func formIndex(before index: inout Index) {
    precondition(index > self.startIndex)
    index.unsafe_performMutation(
      sendingEndTo: self.endIndexReplacement(forDistanceFromEndIndex: -1)) {
        (position: inout Position) -> IndexPositionStoragePositionMutationDetermination
        in
        let gotPreviousPosition = self.formPosition(before: &position)
        switch gotPreviousPosition{
        case true:
          return .success
        case false:
          return .failure
        }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip2Collection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension ProductZip2Collection : RandomAccessCollection
  where
  A:RandomAccessCollection,
  B:RandomAccessCollection {
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip2Collection - Collection Support
// -------------------------------------------------------------------------- //

internal extension ProductZip2Collection {
  
  @inlinable
  func linearIndex(forIndex index: Index) -> Int {
    return self.storage.linearIndex(
      forIndex: index
    )
  }
  
  @inlinable
  func linearIndex(forPosition position: Position) -> Int {
    return self.storage.linearIndex(
      forPosition: position
    )
  }

  @inlinable
  func linearIndexIsForIndex(_ linearIndex: Int) -> Bool {
    return self.storage.linearIndexIsForIndex(linearIndex)
  }

  @inlinable
  func linearIndexIsForPosition(_ linearIndex: Int) -> Bool {
    return self.storage.linearIndexIsForPosition(linearIndex)
  }
  
  @inlinable
  func position(forLinearIndex linearIndex: Int) -> Position {
    return self.storage.position(
      forLinearIndex: linearIndex
    )
  }
  
  @inlinable
  func index(forLinearIndex linearIndex: Int) -> Index {
    return self.storage.index(
      forLinearIndex: linearIndex
    )
  }
  
  @inlinable
  func couldHaveCreated(index: Index) -> Bool {
    return self.storage.couldHaveCreated(
      index: index
    )
  }

  @inlinable
  func couldHaveCreated(position: Position) -> Bool {
    return self.storage.couldHaveCreated(
      position: position
    )
  }
  
  @inlinable
  func endIndexReplacement(
    forDistanceFromEndIndex distanceFromEndIndex: Int) -> IndexPositionStorageEndReplacement<Position> {
    return self.storage.endIndexReplacement(
      forDistanceFromEndIndex: distanceFromEndIndex
    )
  }
  
  @inlinable
  func position(
    _ position: Position,
    offsetBy distance: Int) -> IndexPositionStorageMovementAttemptDestination<Position> {
    return self.storage.position(
      position,
      offsetBy: distance
    )
  }
  
  @inlinable
  func position(after position: Position) -> Position? {
    return self.storage.position(
      after: position
    )
  }
    
  @inlinable
  func formPosition(after position: inout Position) -> Bool {
    return self.storage.formPosition(
      after: &position
    )
  }
  
  @inlinable
  func formPosition(
    _ position: inout Position,
    offsetBy distance: Int) -> IndexPositionStorageMovementAttemptResult {
    return self.storage.formPosition(
      &position,
      offsetBy: distance
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: ProductZip2Collection - BidirectionalCollection Support
// -------------------------------------------------------------------------- //

internal extension ProductZip2Collection
  where
  A:BidirectionalCollection,
  B:BidirectionalCollection {
  
  @usableFromInline
  func position(before position: Position) -> Position? {
    return self.storage.position(
      before: position
    )
  }

  @inlinable
  func formPosition(before position: inout Position) -> Bool {
    return self.storage.formPosition(
      before: &position
    )
  }

}
