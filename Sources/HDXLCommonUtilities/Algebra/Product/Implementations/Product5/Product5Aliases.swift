//
//  Product5Aliases.swift
//

import Foundation

/// Typealias for a homogenous product (inline implementation).
public typealias UniformInlineProduct5<T> = InlineProduct5<T,T,T,T,T>

/// Typealias for a homogenous product (COW implementation).
public typealias UniformCOWProduct5<T> = COWProduct5<T,T,T,T,T>

/// Typealias for the default implementation choice for products at this arity.
public typealias Product5<A,B,C,D,E> = COWProduct5<A,B,C,D,E>

/// Public constructor for default choice of `Product5` implementation.
///
/// - note:Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
///
@inlinable
public func Product<A,B,C,D,E>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E) -> Product5<A,B,C,D,E> {
  return Product5<A,B,C,D,E>(
    a,
    b,
    c,
    d,
    e
  )
}
