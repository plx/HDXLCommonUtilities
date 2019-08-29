//
//  Product9Aliases.swift
//

import Foundation

/// Typealias for a homogenous product (inline implementation).
public typealias UniformInlineProduct9<T> = InlineProduct9<T,T,T,T,T,T,T,T,T>

/// Typealias for a homogenous product (COW implementation).
public typealias UniformCOWProduct9<T> = COWProduct9<T,T,T,T,T,T,T,T,T>

/// Typealias for the default implementation choice for products at this arity.
public typealias Product9<A,B,C,D,E,F,G,H,I> = COWProduct9<A,B,C,D,E,F,G,H,I>

/// Public constructor for default choice of `Product9` implementation.
///
/// - note:Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
///
@inlinable
public func Product<A,B,C,D,E,F,G,H,I>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H,
  _ i: I) -> Product9<A,B,C,D,E,F,G,H,I> {
  return Product9<A,B,C,D,E,F,G,H,I>(
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
