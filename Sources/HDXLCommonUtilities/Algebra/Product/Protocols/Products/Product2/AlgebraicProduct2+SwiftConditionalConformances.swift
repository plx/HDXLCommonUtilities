//
//  AlgebraicProduct2+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct2 - Equatable
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct2
  where
  A:Equatable,
  B:Equatable {
  
  @inlinable
  static func ==(
    lhs: Self,
    rhs: Self) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(lhs))
    pedantic_assert(isValidOrIndifferent(rhs))
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.a == rhs.a,
      lhs.b == rhs.b else {
        return false
    }
    return true
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct2 - Comparable
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct2
  where
  A:Comparable,
  B:Comparable {
  
  @inlinable
  func lexicographicComparison(to other: Self) -> ComparisonResult {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(self))
    pedantic_assert(isValidOrIndifferent(other))
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      self.a <=> other.a,
      self.b <=> other.b
    )
  }
  
  @inlinable
  static func <(
    lhs: Self,
    rhs: Self) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(lhs))
    pedantic_assert(isValidOrIndifferent(rhs))
    // /////////////////////////////////////////////////////////////////////////
    return lhs.lexicographicComparison(
      to: rhs
    ).impliesLessThan
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct2 - Hashable
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct2
  where
  A:Hashable,
  B:Hashable {
  
  @inlinable
  func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct2 - CustomStringConvertible
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct2 {

  @inlinable
  var description: String {
    get {
      return [
        String(describing: self.a),
        String(describing: self.b)
      ].toTupleLikeJoin()
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct2 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct2 {
  
  @inlinable
  var debugDescription: String {
    get {
      let components = [
        String(reflecting: self.a),
        String(reflecting: self.b)
      ].toTupleLikeJoin()
      return "\(String(reflecting: Self.self))\(components)"
    }
  }
  
}

// TODO: case-iterable via product collection
