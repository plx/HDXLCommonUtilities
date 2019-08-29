//
//  Product7Aliases.swift
//

import Foundation

/// Typealias for a homogenous product (inline implementation).
public typealias UniformInlineProduct7<T> = InlineProduct7<T,T,T,T,T,T,T>

/// Typealias for a homogenous product (COW implementation).
public typealias UniformCOWProduct7<T> = COWProduct7<T,T,T,T,T,T,T>

/// Typealias for the default implementation choice for products at this arity.
public typealias Product7<A,B,C,D,E,F,G> = COWProduct7<A,B,C,D,E,F,G>

/// Public constructor for default choice of `Product7` implementation.
///
/// - note:Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
///
@inlinable
public func Product<A,B,C,D,E,F,G>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G) -> Product7<A,B,C,D,E,F,G> {
  return Product7<A,B,C,D,E,F,G>(
    a,
    b,
    c,
    d,
    e,
    f,
    g
  )
}
