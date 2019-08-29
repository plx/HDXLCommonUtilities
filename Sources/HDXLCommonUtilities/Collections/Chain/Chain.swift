//
//  Chain.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: ChainCollection - Arity 2
// -------------------------------------------------------------------------- //

/// "Pseudo-constructor" for a specific `ChainXCollection`.
///
/// - parameter a: The first collection in the chain.
/// - parameter b: The second collection in the chain.
///
/// - returns: A collection of the elements in `a`, followed by the elements in `b`, (etc.).
///
/// - note: Non-idiomatic capitalization of the function name is to look more like a type constructor.
///
@inlinable
public func ChainCollection<
  A:Collection,
  B:Collection>(
  _ a: A, 
  _ b: B) -> Chain2Collection<A,B> {
    return Chain2Collection<A,B>(
      a,
      b
    )
}

// -------------------------------------------------------------------------- //
// MARK: ChainCollection - Arity 3
// -------------------------------------------------------------------------- //

/// "Pseudo-constructor" for a specific `ChainXCollection`.
///
/// - parameter a: The first collection in the chain.
/// - parameter b: The second collection in the chain.
/// - parameter c: The third collection in the chain.
///
/// - returns: A collection of the elements in `a`, followed by the elements in `b`, (etc.).
///
/// - note: Non-idiomatic capitalization of the function name is to look more like a type constructor.
///
@inlinable
public func ChainCollection<
  A:Collection,
  B:Collection,
  C:Collection>(
  _ a: A, 
  _ b: B,
  _ c: C) -> Chain3Collection<A,B,C> {
    return Chain3Collection<A,B,C>(
      a,
      b,
      c
    )
}

// -------------------------------------------------------------------------- //
// MARK: ChainCollection - Arity 4
// -------------------------------------------------------------------------- //

/// "Pseudo-constructor" for a specific `ChainXCollection`.
///
/// - parameter a: The first collection in the chain.
/// - parameter b: The second collection in the chain.
/// - parameter c: The third collection in the chain.
/// - parameter d: The fourth collection in the chain.
///
/// - returns: A collection of the elements in `a`, followed by the elements in `b`, (etc.).
///
/// - note: Non-idiomatic capitalization of the function name is to look more like a type constructor.
///
@inlinable
public func ChainCollection<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection>(
  _ a: A, 
  _ b: B,
  _ c: C,
  _ d: D) -> Chain4Collection<A,B,C,D> {
    return Chain4Collection<A,B,C,D>(
      a,
      b,
      c,
      d
    )
}

// -------------------------------------------------------------------------- //
// MARK: ChainCollection - Arity 5
// -------------------------------------------------------------------------- //

/// "Pseudo-constructor" for a specific `ChainXCollection`.
///
/// - parameter a: The first collection in the chain.
/// - parameter b: The second collection in the chain.
/// - parameter c: The third collection in the chain.
/// - parameter d: The fourth collection in the chain.
/// - parameter e: The fifth collection in the chain.
///
/// - returns: A collection of the elements in `a`, followed by the elements in `b`, (etc.).
///
/// - note: Non-idiomatic capitalization of the function name is to look more like a type constructor.
///
@inlinable
public func ChainCollection<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection>(
  _ a: A, 
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E) -> Chain5Collection<A,B,C,D,E> {
    return Chain5Collection<A,B,C,D,E>(
      a,
      b,
      c,
      d,
      e
    )
}

// -------------------------------------------------------------------------- //
// MARK: ChainCollection - Arity 6
// -------------------------------------------------------------------------- //

/// "Pseudo-constructor" for a specific `ChainXCollection`.
///
/// - parameter a: The first collection in the chain.
/// - parameter b: The second collection in the chain.
/// - parameter c: The third collection in the chain.
/// - parameter d: The fourth collection in the chain.
/// - parameter e: The fifth collection in the chain.
/// - parameter f: The sixth collection in the chain.
///
/// - returns: A collection of the elements in `a`, followed by the elements in `b`, (etc.).
///
/// - note: Non-idiomatic capitalization of the function name is to look more like a type constructor.
///
@inlinable
public func ChainCollection<
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
  _ f: F) -> Chain6Collection<A,B,C,D,E,F> {
    return Chain6Collection<A,B,C,D,E,F>(
      a,
      b,
      c,
      d,
      e,
      f
    )
}

// -------------------------------------------------------------------------- //
// MARK: ChainCollection - Arity 7
// -------------------------------------------------------------------------- //

/// "Pseudo-constructor" for a specific `ChainXCollection`.
///
/// - parameter a: The first collection in the chain.
/// - parameter b: The second collection in the chain.
/// - parameter c: The third collection in the chain.
/// - parameter d: The fourth collection in the chain.
/// - parameter e: The fifth collection in the chain.
/// - parameter f: The sixth collection in the chain.
/// - parameter g: The seventh collection in the chain.
///
/// - returns: A collection of the elements in `a`, followed by the elements in `b`, (etc.).
///
/// - note: Non-idiomatic capitalization of the function name is to look more like a type constructor.
///
@inlinable
public func ChainCollection<
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
  _ g: G) -> Chain7Collection<A,B,C,D,E,F,G> {
    return Chain7Collection<A,B,C,D,E,F,G>(
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
// MARK: ChainCollection - Arity 8
// -------------------------------------------------------------------------- //

/// "Pseudo-constructor" for a specific `ChainXCollection`.
///
/// - parameter a: The first collection in the chain.
/// - parameter b: The second collection in the chain.
/// - parameter c: The third collection in the chain.
/// - parameter d: The fourth collection in the chain.
/// - parameter e: The fifth collection in the chain.
/// - parameter f: The sixth collection in the chain.
/// - parameter g: The seventh collection in the chain.
/// - parameter h: The eigth collection in the chain.
///
/// - returns: A collection of the elements in `a`, followed by the elements in `b`, (etc.).
///
/// - note: Non-idiomatic capitalization of the function name is to look more like a type constructor.
///
@inlinable
public func ChainCollection<
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
  _ h: H) -> Chain8Collection<A,B,C,D,E,F,G,H> {
    return Chain8Collection<A,B,C,D,E,F,G,H>(
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
// MARK: ChainCollection - Arity 9
// -------------------------------------------------------------------------- //

/// "Pseudo-constructor" for a specific `ChainXCollection`.
///
/// - parameter a: The first collection in the chain.
/// - parameter b: The second collection in the chain.
/// - parameter c: The third collection in the chain.
/// - parameter d: The fourth collection in the chain.
/// - parameter e: The fifth collection in the chain.
/// - parameter f: The sixth collection in the chain.
/// - parameter g: The seventh collection in the chain.
/// - parameter h: The eigth collection in the chain.
/// - parameter i: The ninth collection in the chain.
///
/// - returns: A collection of the elements in `a`, followed by the elements in `b`, (etc.).
///
/// - note: Non-idiomatic capitalization of the function name is to look more like a type constructor.
///
@inlinable
public func ChainCollection<
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
  _ i: I) -> Chain9Collection<A,B,C,D,E,F,G,H,I> {
    return Chain9Collection<A,B,C,D,E,F,G,H,I>(
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
