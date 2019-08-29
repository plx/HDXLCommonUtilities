//
//  Product4Aliases.swift
//

import Foundation

/// Typealias for a homogenous product (inline implementation).
public typealias UniformInlineProduct4<T> = InlineProduct4<T,T,T,T>

/// Typealias for a homogenous product (COW implementation).
public typealias UniformCOWProduct4<T> = COWProduct4<T,T,T,T>

/// Typealias for the default implementation choice for products at this arity.
public typealias Product4<A,B,C,D> = COWProduct4<A,B,C,D>

/// Public constructor for default choice of `Product4` implementation.
///
/// - note:Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
///
@inlinable
public func Product<A,B,C,D>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D) -> Product4<A,B,C,D> {
  return Product4<A,B,C,D>(
    a,
    b,
    c,
    d
  )
}
