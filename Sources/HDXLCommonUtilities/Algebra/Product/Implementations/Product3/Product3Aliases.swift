//
//  Product3Aliases.swift
//

import Foundation

/// Typealias for a homogenous product (inline implementation).
public typealias UniformInlineProduct3<T> = InlineProduct3<T,T,T>

/// Typealias for a homogenous product (COW implementation).
public typealias UniformCOWProduct3<T> = COWProduct3<T,T,T>

/// Typealias for the default implementation choice for products at this arity.
public typealias Product3<A,B,C> = COWProduct3<A,B,C>

/// Public constructor for default choice of `Product3` implementation.
///
/// - note:Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
///
@inlinable
public func Product<A,B,C>(
  _ a: A,
  _ b: B,
  _ c: C) -> Product3<A,B,C> {
  return Product3<A,B,C>(
    a,
    b,
    c
  )
}
