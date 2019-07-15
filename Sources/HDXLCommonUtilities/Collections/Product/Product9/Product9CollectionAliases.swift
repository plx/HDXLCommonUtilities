//
//  Product9CollectionAliases.swift
//

import Foundation

/// Typealias for a homogenous product (inline implementation).
public typealias UniformInlineProduct9Collection<T:Collection> = InlineProduct9Collection<T,T,T,T,T,T,T,T,T>

/// Typealias for a homogenous product (COW implementation).
public typealias UniformCOWProduct9Collection<T:Collection> = COWProduct9Collection<T,T,T,T,T,T,T,T,T>

/// Typealias for the default implementation choice for products at this arity.
public typealias Product9Collection<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection,
  I:Collection> = COWProduct9Collection<A,B,C,D,E,F,G,H,I>

/// Public constructor for default choice of `Product9` implementation.
///
/// - note:Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
///
@inlinable
public func ProductCollection<
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

/// Public constructor for product collection providing inline-implementation elements.
///
/// - note: Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
/// - note: May wish to rename to `InlineElementProductCollection` (etc.); maybe better tradeoff on the clarity/brevity axis.
///
@inlinable
public func InlineProductCollection<
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
  _ i: I) -> InlineProduct9Collection<A,B,C,D,E,F,G,H,I> {
  return InlineProduct9Collection<A,B,C,D,E,F,G,H,I>(
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

/// Public constructor for product collection providing COW-implementation elements.
///
/// - note: Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
/// - note: May wish to rename to `InlineElementProductCollection` (etc.); maybe better tradeoff on the clarity/brevity axis.
///
@inlinable
public func COWProductCollection<
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
  _ i: I) -> COWProduct9Collection<A,B,C,D,E,F,G,H,I> {
  return COWProduct9Collection<A,B,C,D,E,F,G,H,I>(
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
