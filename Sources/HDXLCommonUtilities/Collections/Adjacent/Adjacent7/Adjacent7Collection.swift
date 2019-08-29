//
//  Adjacent7Collection.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Adjacent7Collection - Definition
// -------------------------------------------------------------------------- //

public struct Adjacent7Collection<Source,Position,Element>
  where
  Source:Collection,
  Position:AlgebraicProduct7,
  Position.A == Source.Index,
  Position.A == Position.B,
  Position.A == Position.C,
  Position.A == Position.D,
  Position.A == Position.E,
  Position.A == Position.F,
  Position.A == Position.G,
  Element:AlgebraicProduct7,
  Element.A == Source.Element,
  Element.A == Element.B,
  Element.A == Element.C,
  Element.A == Element.D,
  Element.A == Element.E,
  Element.A == Element.F,
  Element.A == Element.G {
  
  @usableFromInline
  internal let source: Source
  
  @inlinable
  internal init(source: Source) {
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.source = source
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent7Collection - Support
// -------------------------------------------------------------------------- //

public extension Adjacent7Collection {
  
  @inlinable
  static var arity: Int {
    get {
      return 7
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent7Collection - Validatable
// -------------------------------------------------------------------------- //

extension Adjacent7Collection:Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        isValidOrIndifferent(self.source),
        type(of: self).arity == Position.arity,
        type(of: self).arity == Element.arity else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent7Collection - Equatable
// -------------------------------------------------------------------------- //

extension Adjacent7Collection:Equatable where Source:Equatable {
  
  @inlinable
  public static func ==(
    lhs: Adjacent7Collection<Source,Position,Element>,
    rhs: Adjacent7Collection<Source,Position,Element>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.source == rhs.source
  }

  @inlinable
  public static func !=(
    lhs: Adjacent7Collection<Source,Position,Element>,
    rhs: Adjacent7Collection<Source,Position,Element>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.source != rhs.source
  }

}

// -------------------------------------------------------------------------- //
// MARK: Adjacent7Collection - Hashable
// -------------------------------------------------------------------------- //

extension Adjacent7Collection:Hashable where Source:Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.source.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: Adjacent7Collection - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension Adjacent7Collection : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "adjacent \(type(of: self).arity)-tuples from \(String(describing: self))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent7Collection - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension Adjacent7Collection : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "Adjacent7Collection<\(String(reflecting: Source.self)), \(String(reflecting: Position.self)), \(String(reflecting: Element.self))>(source: \(String(reflecting: self.source)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent7Collection - Codable
// -------------------------------------------------------------------------- //

extension Adjacent7Collection : Codable where Source:Codable {
  
  // synthesized ok
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent7Collection - Collection
// -------------------------------------------------------------------------- //

extension Adjacent7Collection : Collection {
  
  public typealias Index = Adjacent7CollectionIndex<Position>
  
  @inlinable
  public var isEmpty: Bool {
    get {
      return self.source.count < type(of: self).arity
    }
  }
  
  @inlinable
  public var count: Int {
    get {
      return Swift.max(
        0,
        (1 + (self.source.count - type(of: self).arity))
      )
    }
  }
  
  @inlinable
  public var startIndex: Index {
    get {
      guard !self.isEmpty else {
        return self.endIndex
      }
      return self.index(
        startingAt: self.source.startIndex
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
  public func distance(
    from start: Index,
    to end: Index) -> Int {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(start.isValid)
    pedantic_assert(end.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch (start.storage, end.storage) {
    case (.position(let startPosition), .position(let endPosition)):
      return self.source.distance(
        from: startPosition.firstValue,
        to: endPosition.firstValue
      )
    case (.position(let startPosition), .end):
      return self.source.distance(
        from: startPosition.lastValue,
        to: self.source.endIndex
      )
    case (.end, .position(let endPosition)):
      return self.source.distance(
        from: self.source.endIndex,
        to: endPosition.lastValue
      )
    case (.end, .end):
      return 0
    }
  }
  
  @inlinable
  public subscript(index: Index) -> Element {
    get {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(index.isValid)
      pedantic_assert(self.canSubscript(index: index))
      // ///////////////////////////////////////////////////////////////////////
      switch index.storage {
      case .position(let position):
        return self[position]
      case .end:
        preconditionFailure("Attempted to subscript the `endIndex` on \(String(reflecting: self))!")
      }
    }
  }
  
  @inlinable
  public func index(after index: Index) -> Index {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(index.isValid)
    pedantic_assert(self.canSubscript(index: index))
    // /////////////////////////////////////////////////////////////////////////
    switch index.storage {
    case .position(let position):
      guard let nextPosition = self.position(after: position) else {
        return self.endIndex // this only works if we maintain our invariants, hence the paranoia!
      }
      return Index(
        position: nextPosition
      )
    case .end:
      preconditionFailure("Attempted to advance the `endIndex` in \(String(reflecting: self))!")
    }
  }
  
  @inlinable
  public func formIndex(after index: inout Index) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(index.isValid)
    pedantic_assert(self.canSubscript(index: index))
    // /////////////////////////////////////////////////////////////////////////
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
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(index.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard distance != 0 else {
      return index
    }
    switch index.storage {
    case .position(let position):
      guard
        let destinationPosition = self.position(
          position,
          offsetBy: distance) else {
            return self.endIndex
      }
      return Index(
        position: destinationPosition
      )
    case .end:
      precondition(distance < 0)
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(self.source.count >= type(of: self).arity)
      // ///////////////////////////////////////////////////////////////////////
      // here's how this works:
      //
      // - we're moving backwards from `endIndex` (ergo: `distance` is < 0)
      // - to move "one step back" from `endIndex`, we need to jump back by `type(of: self).arity`
      // - having moved "one step back" we can move the remaining n-1 steps back the ordinary way:
      //   - shift the destinationStartIndex further back by n-1
      //   - construct the resulting position as `startingAt: destinationStartIndex`
      //
      // Or, concretely, for say 3-tuples, suppose `source` is `[0,1,2,3,4,5,6,7]`.
      // The final *position* has indices `(5,6,7)`, and `source.endIndex` is `8`;
      // thus to go back "by one" from *our* `endIndex` we go back to `5`, which
      // is just `5 == 8 - 3 == source.endIndex - arity` (for arity 3, naturally).
      //
      // From there, though, to go from `(5,6,7) => (3,4,5)` we only go back by
      // `2` (e.g. the obvious/natural way), and there we are.
      //
      // So, in the end, for a `distance < 0`, to offset `endIndex` by distance
      // we select our start index by first going-back from `endIndex` by `arity`,
      // and then we offset that destination by a further `distance + 1` (or, if
      // you like, by `-(|distance| - 1)`).
      let destinationStartIndex = self.source.index(
        self.source.endIndex,
        offsetBy: (
          (distance + 1)
          -
          type(of: self).arity
        )
      )
      return self.index(
        startingAt: destinationStartIndex
      )
    }
  }
  
  @inlinable
  public func formIndex(
    _ index: inout Index,
    offsetBy distance: Int) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(index.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard distance != 0 else {
      return
    }
    index.unsafe_performMutation(
      sendingEndTo: self.endIndexReplacement(
        forDistanceFromEndIndex: distance
    )) {
      (position: inout Position) -> IndexPositionStoragePositionMutationDetermination
      in
      self.source.formIndex(
        &position.firstValue,
        offsetBy: distance
      )
      if position.firstValue < self.source.startIndex {
        return .failure
      } else {
        let distanceToEnd = self.source.distance(
          from: position.firstValue,
          to: self.source.endIndex
        )
        if distanceToEnd <= type(of: self).arity {
          self.fixupPositionFromFirstValue(&position)
          return .success
        } else if distanceToEnd + 1 == type(of: self).arity {
          return .becomeEnd
        } else {
          return .failure // *overshot* past end index
        }
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent7Collection - BidirectionalCollection
// -------------------------------------------------------------------------- //

extension Adjacent7Collection : BidirectionalCollection where Source:BidirectionalCollection {
  
  @inlinable
  public func index(before index: Index) -> Index {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(index.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch index.storage {
    case .position(let position):
      guard let previousPosition = self.position(before: position) else {
        preconditionFailure("Attempted to go back from the `startIndex` in \(String(reflecting: self))!")
      }
      return Index(
        position: previousPosition
      )
    case .end:
      guard self.startIndex != self.endIndex else {
        preconditionFailure("Attempted to go back from the `startIndex` in \(String(reflecting: self))!")
      }
      return self.index(
        startingAt: self.source.index(
          self.source.endIndex,
          offsetBy: type(of: self).arity
        )
      )
    }
  }
  
  @inlinable
  public func formIndex(before index: inout Index) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(index.isValid)
    // /////////////////////////////////////////////////////////////////////////
    index.unsafe_performMutation(
      sendingEndTo: self.endIndexReplacement(
        forDistanceFromEndIndex: -1)) {
          (position: inout Position) -> IndexPositionStoragePositionMutationDetermination
          in
          switch self.formPosition(before: &position) {
          case true:
            return .success
          case false:
            return .failure
          }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent7Collection - RandomAccessCollection
// -------------------------------------------------------------------------- //

extension Adjacent7Collection : RandomAccessCollection where Source:RandomAccessCollection {
  
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent7Collection - Collection Support
// -------------------------------------------------------------------------- //

internal extension Adjacent7Collection {
  
  @inlinable
  func position(
    startingAt index: Source.Index) -> Position {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.canObtainPosition(startingAt: index))
    // /////////////////////////////////////////////////////////////////////////
    let a = index
    let b = self.source.index(after: a)
    let c = self.source.index(after: b)
    let d = self.source.index(after: c)
    let e = self.source.index(after: d)
    let f = self.source.index(after: e)
    let g = self.source.index(after: f)
    return Position(
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
  func index(
    startingAt index: Source.Index) -> Index {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.canObtainPosition(startingAt: index))
    // /////////////////////////////////////////////////////////////////////////
    return Index(
      position: self.position(
        startingAt: index
      )
    )
  }

  @inlinable
  func canObtainPosition(startingAt index: Source.Index) -> Bool {
    return type(of: self).arity >= self.source.distance(
      from: index,
      to: self.source.endIndex
    )
  }

  @inlinable
  func canSubscript(index: Index) -> Bool {
    switch index.storage {
    case .position(let position):
      return self.canSubscript(position: position)
    case .end:
      return false
    }
  }
  

  @inlinable
  func canSubscript(position: Position) -> Bool {
    return position.lastValue < self.source.endIndex
  }
  
  @inlinable
  subscript(position: Position) -> Element {
    get {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(self.canSubscript(position: position))
      // ///////////////////////////////////////////////////////////////////////
      return Element(
        self.source[position.a],
        self.source[position.b],
        self.source[position.c],
        self.source[position.d],
        self.source[position.e],
        self.source[position.f],
        self.source[position.g]
      )
    }
  }
  
  @inlinable
  func position(after position: Position) -> Position? {
    guard let nextLastValue = self.source.subscriptableIndex(after: position.lastValue) else {
      return nil
    }
    return position.pushedLeftward(
      byAppending: nextLastValue
    )
  }
  
  @inlinable
  func formPosition(after position: inout Position) -> Bool {
    guard let nextLastValue = self.source.subscriptableIndex(after: position.lastValue) else {
      return false
    }
    position.formLeftwardPush(
      byAppending: nextLastValue
    )
    return true
  }

  @inlinable
  func position(
    _ position: Position,
    offsetBy distance: Int) -> Position? {
    switch self.source.subscriptableIndex(position.firstValue, offsetBy: distance) {
    case .success(let destination):
      return self.position(
        startingAt: destination
      )
    case .becameEnd:
      return nil
    case .misnavigation:
      preconditionFailure("Attempted to apply invalid offset \(distance) to \(String(reflecting: position)) in \(String(reflecting: self))!")
    }
  }
  
  @inlinable
  func endIndexReplacement(forDistanceFromEndIndex distanceFromEndIndex: Int) -> IndexPositionStorageEndReplacement<Position> {
    precondition(distanceFromEndIndex < 0)
    let intendedStartIndex = self.source.index(
      self.source.endIndex,
      offsetBy: (
        (distanceFromEndIndex + 1)
        -
        type(of: self).arity
      )
    )
    guard intendedStartIndex >= self.source.startIndex else {
      return .misnavigation
    }
    return .position(
      self.position(
        startingAt: intendedStartIndex
      )
    )
  }
  
  @inlinable
  func fixupPositionFromFirstValue(_ position: inout Position) {
    position.b = self.source.index(after: position.a)
    position.c = self.source.index(after: position.b)
    position.d = self.source.index(after: position.c)
    position.e = self.source.index(after: position.d)
    position.f = self.source.index(after: position.e)
    position.g = self.source.index(after: position.f)
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: Adjacent7Collection - BidirectionalCollection Support
// -------------------------------------------------------------------------- //

internal extension Adjacent7Collection where Source:BidirectionalCollection {
  
  @inlinable
  func position(before position: Position) -> Position? {
    guard
      let previousFirstValue = self.source.subscriptableIndex(
        before: position.firstValue) else {
      return nil
    }
    return position.pushedRightward(
      byPrepending: previousFirstValue
    )
  }
  
  @inlinable
  func formPosition(before position: inout Position) -> Bool {
    guard position.firstValue > self.source.startIndex else {
      return false
    }
    position.formRightwardPush(
      byPrepending: self.source.index(
        before: position.firstValue
      )
    )
    return true
  }
  
}
