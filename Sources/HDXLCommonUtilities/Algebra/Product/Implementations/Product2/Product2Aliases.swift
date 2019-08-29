//
//  Product2Aliases.swift
//

import Foundation

/// Typealias for a homogenous product (inline implementation).
public typealias UniformInlineProduct2<T> = InlineProduct2<T,T>

/// Typealias for a homogenous product (COW implementation).
public typealias UniformCOWProduct2<T> = COWProduct2<T,T>

/// Typealias for the default implementation choice for products at this arity.
public typealias Product2<A,B> = InlineProduct2<A,B>

/// Public constructor for default choice of `Product2` implementation.
///
/// - note:Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
///
@inlinable
public func Product<A,B>(
  _ a: A,
  _ b: B) -> Product2<A,B> {
  return Product2<A,B>(
    a,
    b
  )
}
