//
//  AlgebraicProduct3+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct3 - Equatable
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct3
  where
  A:Equatable,
  B:Equatable,
  C:Equatable {
  
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
      lhs.b == rhs.b,
      lhs.c == rhs.c else {
        return false
    }
    return true
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct3 - Comparable
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct3
  where
  A:Comparable,
  B:Comparable,
  C:Comparable {
  
  @inlinable
  func lexicographicComparison(to other: Self) -> ComparisonResult {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(self))
    pedantic_assert(isValidOrIndifferent(other))
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      self.a <=> other.a,
      self.b <=> other.b,
      self.c <=> other.c
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
// MARK: AlgebraicProduct3 - Hashable
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct3
  where
  A:Hashable,
  B:Hashable,
  C:Hashable {
  
  @inlinable
  func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct3 - CustomStringConvertible
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct3 {

  @inlinable
  var description: String {
    get {
      return [
        String(describing: self.a),
        String(describing: self.b),
        String(describing: self.c)
      ].toTupleLikeJoin()
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct3 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct3 {
  
  @inlinable
  var debugDescription: String {
    get {
      let components = [
        String(reflecting: self.a),
        String(reflecting: self.b),
        String(reflecting: self.c)
      ].toTupleLikeJoin()
      return "\(String(reflecting: Self.self))\(components)"
    }
  }
  
}

// TODO: case-iterable via product collection
