//
//  ProductZip9CollectionAliases.swift
//

import Foundation

/// Typealias for a homogenous product (inline implementation).
public typealias UniformInlineProductZip9Collection<T:Collection> = InlineProductZip9Collection<T,T,T,T,T,T,T,T,T>

/// Typealias for a homogenous product (COW implementation).
public typealias UniformCOWProductZip9Collection<T:Collection> = COWProductZip9Collection<T,T,T,T,T,T,T,T,T>

/// Typealias for the default implementation choice for products at this arity.
public typealias ProductZip9Collection<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection,
  I:Collection> = COWProductZip9Collection<A,B,C,D,E,F,G,H,I>

/// Public constructor for default choice of `ProductZip9Collection` implementation.
///
/// - note:Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
///
@inlinable
public func ProductZipCollection<
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
  _ i: I) -> ProductZip9Collection<A,B,C,D,E,F,G,H,I> {
  return ProductZip9Collection<A,B,C,D,E,F,G,H,I>(
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

/// Public constructor for product-zip collection providing inline-implementation elements.
///
/// - note: Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
/// - note: May wish to rename to `InlineElementProductCollection` (etc.); maybe better tradeoff on the clarity/brevity axis.
///
@inlinable
public func InlineProductZipCollection<
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
  _ i: I) -> InlineProductZip9Collection<A,B,C,D,E,F,G,H,I> {
  return InlineProductZip9Collection<A,B,C,D,E,F,G,H,I>(
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

/// Public constructor for product-zip collection providing COW-implementation elements.
///
/// - note: Deliberate use of non-idiomatic capitalized name so as to better "pose as a type/constructor".
/// - note: May wish to rename to `InlineElementProductCollection` (etc.); maybe better tradeoff on the clarity/brevity axis.
///
@inlinable
public func COWProductZipCollection<
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
  _ i: I) -> COWProductZip9Collection<A,B,C,D,E,F,G,H,I> {
  return COWProductZip9Collection<A,B,C,D,E,F,G,H,I>(
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
