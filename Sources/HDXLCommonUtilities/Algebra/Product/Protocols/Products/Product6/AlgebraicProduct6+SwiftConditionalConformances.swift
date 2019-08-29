//
//  AlgebraicProduct6+SwiftConditionalConformances.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct6 - Equatable
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct6
  where
  A:Equatable,
  B:Equatable,
  C:Equatable,
  D:Equatable,
  E:Equatable,
  F:Equatable {
  
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
      lhs.c == rhs.c,
      lhs.d == rhs.d,
      lhs.e == rhs.e,
      lhs.f == rhs.f else {
        return false
    }
    return true
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct6 - Comparable
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct6
  where
  A:Comparable,
  B:Comparable,
  C:Comparable,
  D:Comparable,
  E:Comparable,
  F:Comparable {
  
  @inlinable
  func lexicographicComparison(to other: Self) -> ComparisonResult {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(isValidOrIndifferent(self))
    pedantic_assert(isValidOrIndifferent(other))
    // /////////////////////////////////////////////////////////////////////////
    return ComparisonResult.coalescing(
      self.a <=> other.a,
      self.b <=> other.b,
      self.c <=> other.c,
      self.d <=> other.d,
      self.e <=> other.e,
      self.f <=> other.f
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
// MARK: AlgebraicProduct6 - Hashable
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct6
  where
  A:Hashable,
  B:Hashable,
  C:Hashable,
  D:Hashable,
  E:Hashable,
  F:Hashable {
  
  @inlinable
  func hash(into hasher: inout Hasher) {
    self.a.hash(into: &hasher)
    self.b.hash(into: &hasher)
    self.c.hash(into: &hasher)
    self.d.hash(into: &hasher)
    self.e.hash(into: &hasher)
    self.f.hash(into: &hasher)
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct6 - CustomStringConvertible
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct6 {

  @inlinable
  var description: String {
    get {
      return [
        String(describing: self.a),
        String(describing: self.b),
        String(describing: self.c),
        String(describing: self.d),
        String(describing: self.e),
        String(describing: self.f)
      ].toTupleLikeJoin()
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct6 - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct6 {
  
  @inlinable
  var debugDescription: String {
    get {
      let components = [
        String(reflecting: self.a),
        String(reflecting: self.b),
        String(reflecting: self.c),
        String(reflecting: self.d),
        String(reflecting: self.e),
        String(reflecting: self.f)
      ].toTupleLikeJoin()
      return "\(String(reflecting: Self.self))\(components)"
    }
  }
  
}

// TODO: case-iterable via product collection
