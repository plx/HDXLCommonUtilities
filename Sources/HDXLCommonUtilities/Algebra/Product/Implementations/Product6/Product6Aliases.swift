//
//  Product6Aliases.swift
//

import Foundation

/// Typealias for a homogenous product (inline implementation).
public typealias UniformInlineProduct6<T> = InlineProduct6<T,T,T,T,T,T>

/// Typealias for a homogenous product (COW implementation).
public typealias UniformCOWProduct6<T> = COWProduct6<T,T,T,T,T,T>

/// Typealias for the default implementation choice for products at this arity.
public typealias Product6<A,B,C,D,E,F> = COWProduct6<A,B,C,D,E,F>

/// Public constructor for default choice of `Product6` implementation.
///
/// - note:Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
///
@inlinable
public func Product<A,B,C,D,E,F>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F) -> Product6<A,B,C,D,E,F> {
  return Product6<A,B,C,D,E,F>(
    a,
    b,
    c,
    d,
    e,
    f
  )
}
