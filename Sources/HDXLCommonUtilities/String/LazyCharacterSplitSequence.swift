//
//  LazySplitSequence.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: String + LazyCharacterSplitSequence
// -------------------------------------------------------------------------- //

public extension String {
  
  /// A *lazy* work-alike for Swift's `String.split(separator:)`. Calling this
  /// will get you the same *elements* as `String.split(separator:)`, but without
  /// constructing an intermediate array holding the elements.
  ///
  @inlinable
  func lazySplit(separator: Character) -> LazyCharacterSplitSequence {
    return LazyCharacterSplitSequence(
      target: self,
      separator: separator
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: LazyCharacterSplitSequence - Definition
// -------------------------------------------------------------------------- //

/// Implements a *lazy* work-alike for Swift's `String.split(separator:)`.
///
/// Exists to support cases like "split a string, then map each component to
/// something else (possibly early-exiting if anything fails/throws)"--no point
/// building the entire intermediate array just to throw it away again (or to
/// drop it if you hit a failure partway through).
///
/// Although in theory this could be promoted to `Collection`, it'd either
/// (a) have *slow* index operations or (b) do internal caching (and thus allocation).
/// Option (b) defeats the motivating point, here--I'm trying to avoid a pointless
/// allocation!. Option A isn't great, but would be consistent with my goals.
///
/// If I see a concrete reason to conform to `Collection` I'll come back and use
/// option A, but, again, for now I don't see a concrete need.
///
/// - todo: Investigate a work-alike returning substrings, not strings (unclear how useful in practice).
///
public struct LazyCharacterSplitSequence : Sequence {
  
  public typealias Iterator = LazyCharacterSplitSequenceIterator
  
  @usableFromInline
  internal let _target: String

  @usableFromInline
  internal let _separator: Character

  @inlinable
  public var target: String {
    get {
      return self._target
    }
  }

  @inlinable
  public var separator: Character {
    get {
      return self._separator
    }
  }

  @inlinable
  internal init(
    target: String,
    separator: Character) {
    self._target = target
    self._separator = separator
  }
  
  @inlinable
  public var underestimatedCount: Int {
    get {
      switch self._target.isEmpty {
      case true:
        return 0
      case false:
        return 1
      }
    }
  }
  
  @inlinable
  public func makeIterator() -> LazyCharacterSplitSequenceIterator {
    return LazyCharacterSplitSequenceIterator(
      target: self._target,
      separator: self._separator
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: LazyCharacterSplitSequence - Equatable
// -------------------------------------------------------------------------- //

extension LazyCharacterSplitSequence : Equatable {
  
  @inlinable
  public static func ==(
    lhs: LazyCharacterSplitSequence,
    rhs: LazyCharacterSplitSequence) -> Bool {
    guard
      lhs._target == rhs._target,
      lhs._separator == rhs._separator else {
        return false
    }
    return true
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: LazyCharacterSplitSequence - Hashable
// -------------------------------------------------------------------------- //

extension LazyCharacterSplitSequence : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self._target.hash(into: &hasher)
    self._separator.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: LazyCharacterSplitSequence - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension LazyCharacterSplitSequence : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "lazy-split on '\(self._separator)' applied-to \"\(self._target)\""
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: LazyCharacterSplitSequence - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension LazyCharacterSplitSequence : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "LazyCharacterSplitSequence(target: \"\(self._target)\", separator: '\(self._separator)')"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: LazyCharacterSplitSequenceIterator - Definition
// -------------------------------------------------------------------------- //

public struct LazyCharacterSplitSequenceIterator : IteratorProtocol {
  
  public typealias Element = String

  @usableFromInline
  internal let target: String

  @usableFromInline
  internal let separator: Character
  
  @usableFromInline
  internal var currentBaseIndex: String.Index
  
  @inlinable
  internal init(target: String, separator: Character) {
    self.target = target
    self.separator = separator
    self.currentBaseIndex = target.startIndex
  }
  
  @inlinable
  mutating public func next() -> String? {
    guard self.currentBaseIndex < self.target.endIndex else {
      return nil
    }
    let segmentEndIndex = self.target[
      self.currentBaseIndex..<self.target.endIndex
    ].firstIndex(of: self.separator) ?? self.target.endIndex
    let element = self.target[
      self.currentBaseIndex..<segmentEndIndex
    ]
    switch segmentEndIndex == self.target.endIndex {
    case true:
      self.currentBaseIndex = segmentEndIndex
    case false:
      self.currentBaseIndex = self.target.index(
        after: segmentEndIndex
      )
    }
    return String(element)
  }
  
}
