//
//  Product8Aliases.swift
//

import Foundation

/// Typealias for a homogenous product (inline implementation).
public typealias UniformInlineProduct8<T> = InlineProduct8<T,T,T,T,T,T,T,T>

/// Typealias for a homogenous product (COW implementation).
public typealias UniformCOWProduct8<T> = COWProduct8<T,T,T,T,T,T,T,T>

/// Typealias for the default implementation choice for products at this arity.
public typealias Product8<A,B,C,D,E,F,G,H> = COWProduct8<A,B,C,D,E,F,G,H>

/// Public constructor for default choice of `Product8` implementation.
///
/// - note:Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
///
@inlinable
public func Product<A,B,C,D,E,F,G,H>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H) -> Product8<A,B,C,D,E,F,G,H> {
  return Product8<A,B,C,D,E,F,G,H>(
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
