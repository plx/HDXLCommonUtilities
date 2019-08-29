//
//  SumChain.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: SumChainCollection - Arity 2
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the sum-chain collection of this specific arity.
///
/// - parameter a: The first collection.
/// - parameter b: The second collection.
///
/// - returns: A collection containing the elements from `a`, then those from `b`, and so on.
///
@inlinable
public func SumChainCollection<
  A:Collection,
  B:Collection>(
  _ a: A,
  _ b: B) -> SumChain2Collection<A,B> {
    return SumChain2Collection<A,B>(
      a,
      b
    )
}

// -------------------------------------------------------------------------- //
// MARK: SumChainCollection - Arity 3
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the sum-chain collection of this specific arity.
///
/// - parameter a: The first collection.
/// - parameter b: The second collection.
/// - parameter c: The third collection.
///
/// - returns: A collection containing the elements from `a`, then those from `b`, and so on.
///
@inlinable
public func SumChainCollection<
  A:Collection,
  B:Collection,
  C:Collection>(
  _ a: A,
  _ b: B,
  _ c: C) -> SumChain3Collection<A,B,C> {
    return SumChain3Collection<A,B,C>(
      a,
      b,
      c
    )
}

// -------------------------------------------------------------------------- //
// MARK: SumChainCollection - Arity 4
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the sum-chain collection of this specific arity.
///
/// - parameter a: The first collection.
/// - parameter b: The second collection.
/// - parameter c: The third collection.
/// - parameter d: The fourth collection.
///
/// - returns: A collection containing the elements from `a`, then those from `b`, and so on.
///
@inlinable
public func SumChainCollection<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D) -> SumChain4Collection<A,B,C,D> {
    return SumChain4Collection<A,B,C,D>(
      a,
      b,
      c,
      d
    )
}

// -------------------------------------------------------------------------- //
// MARK: SumChainCollection - Arity 5
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the sum-chain collection of this specific arity.
///
/// - parameter a: The first collection.
/// - parameter b: The second collection.
/// - parameter c: The third collection.
/// - parameter d: The fourth collection.
/// - parameter e: The fifth collection.
///
/// - returns: A collection containing the elements from `a`, then those from `b`, and so on.
///
@inlinable
public func SumChainCollection<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E) -> SumChain5Collection<A,B,C,D,E> {
    return SumChain5Collection<A,B,C,D,E>(
      a,
      b,
      c,
      d,
      e
    )
}

// -------------------------------------------------------------------------- //
// MARK: SumChainCollection - Arity 6
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the sum-chain collection of this specific arity.
///
/// - parameter a: The first collection.
/// - parameter b: The second collection.
/// - parameter c: The third collection.
/// - parameter d: The fourth collection.
/// - parameter e: The fifth collection.
/// - parameter f: The sixth collection.
///
/// - returns: A collection containing the elements from `a`, then those from `b`, and so on.
///
@inlinable
public func SumChainCollection<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F) -> SumChain6Collection<A,B,C,D,E,F> {
    return SumChain6Collection<A,B,C,D,E,F>(
      a,
      b,
      c,
      d,
      e,
      f
    )
}

// -------------------------------------------------------------------------- //
// MARK: SumChainCollection - Arity 7
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the sum-chain collection of this specific arity.
///
/// - parameter a: The first collection.
/// - parameter b: The second collection.
/// - parameter c: The third collection.
/// - parameter d: The fourth collection.
/// - parameter e: The fifth collection.
/// - parameter f: The sixth collection.
/// - parameter g: The seventh collection.
///
/// - returns: A collection containing the elements from `a`, then those from `b`, and so on.
///
@inlinable
public func SumChainCollection<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G) -> SumChain7Collection<A,B,C,D,E,F,G> {
    return SumChain7Collection<A,B,C,D,E,F,G>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
}

// -------------------------------------------------------------------------- //
// MARK: SumChainCollection - Arity 8
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the sum-chain collection of this specific arity.
///
/// - parameter a: The first collection.
/// - parameter b: The second collection.
/// - parameter c: The third collection.
/// - parameter d: The fourth collection.
/// - parameter e: The fifth collection.
/// - parameter f: The sixth collection.
/// - parameter g: The seventh collection.
/// - parameter h: The eigth collection.
///
/// - returns: A collection containing the elements from `a`, then those from `b`, and so on.
///
@inlinable
public func SumChainCollection<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H) -> SumChain8Collection<A,B,C,D,E,F,G,H> {
    return SumChain8Collection<A,B,C,D,E,F,G,H>(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h
    )
}

// -------------------------------------------------------------------------- //
// MARK: SumChainCollection - Arity 9
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the sum-chain collection of this specific arity.
///
/// - parameter a: The first collection.
/// - parameter b: The second collection.
/// - parameter c: The third collection.
/// - parameter d: The fourth collection.
/// - parameter e: The fifth collection.
/// - parameter f: The sixth collection.
/// - parameter g: The seventh collection.
/// - parameter h: The eigth collection.
/// - parameter i: The ninth collection.
///
/// - returns: A collection containing the elements from `a`, then those from `b`, and so on.
///
@inlinable
public func SumChainCollection<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection,
  I:Collection>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H,
  _ i: I) -> SumChain9Collection<A,B,C,D,E,F,G,H,I> {
    return SumChain9Collection<A,B,C,D,E,F,G,H,I>(
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
