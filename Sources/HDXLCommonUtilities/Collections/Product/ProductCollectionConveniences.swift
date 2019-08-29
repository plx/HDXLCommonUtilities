//
//  ProductCollectionConveniences.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Cartesian Products - Standard Representations
// -------------------------------------------------------------------------- //

/// Standard representation for arity-2 cartesian products.
public typealias
  CartesianProduct2<
    A:Collection,
    B:Collection>
  =
  Product2Collection<
    A,B,
    StandardPositionRepresentation2<A,B>,
    StandardElementRepresentation2<A,B>>

/// Standard representation for arity-3 cartesian products.
public typealias
  CartesianProduct3<
    A:Collection,
    B:Collection,
    C:Collection>
  =
  Product3Collection<
    A,B,C,
    StandardPositionRepresentation3<A,B,C>,
    StandardElementRepresentation3<A,B,C>>

/// Standard representation for arity-4 cartesian products.
public typealias
  CartesianProduct4<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection>
  =
  Product4Collection<
    A,B,C,D,
    StandardPositionRepresentation4<A,B,C,D>,
    StandardElementRepresentation4<A,B,C,D>>

/// Standard representation for arity-5 cartesian products.
public typealias
  CartesianProduct5<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection>
  =
  Product5Collection<
    A,B,C,D,E,
    StandardPositionRepresentation5<A,B,C,D,E>,
    StandardElementRepresentation5<A,B,C,D,E>>

/// Standard representation for arity-6 cartesian products.
public typealias
  CartesianProduct6<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection>
  =
  Product6Collection<
    A,B,C,D,E,F,
    StandardPositionRepresentation6<A,B,C,D,E,F>,
    StandardElementRepresentation6<A,B,C,D,E,F>>

/// Standard representation for arity-7 cartesian products.
public typealias
  CartesianProduct7<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection,
    G:Collection>
  =
  Product7Collection<
    A,B,C,D,E,F,G,
    StandardPositionRepresentation7<A,B,C,D,E,F,G>,
    StandardElementRepresentation7<A,B,C,D,E,F,G>>

/// Standard representation for arity-8 cartesian products.
public typealias
  CartesianProduct8<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection,
    G:Collection,
    H:Collection>
  =
  Product8Collection<
    A,B,C,D,E,F,G,H,
    StandardPositionRepresentation8<A,B,C,D,E,F,G,H>,
    StandardElementRepresentation8<A,B,C,D,E,F,G,H>>

/// Standard representation for arity-9 cartesian products.
public typealias
  CartesianProduct9<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection,
    G:Collection,
    H:Collection,
    I:Collection>
  =
  Product9Collection<
    A,B,C,D,E,F,G,H,I,
  StandardPositionRepresentation9<A,B,C,D,E,F,G,H,I>,
  StandardElementRepresentation9<A,B,C,D,E,F,G,H,I>>

// -------------------------------------------------------------------------- //
// MARK: Cartesian Products - Inline Representations
// -------------------------------------------------------------------------- //

/// Convenience for inline-element, inline-position arity-2 cartesian products.
public typealias
  InlineCartesianProduct2<
    A:Collection,
    B:Collection>
  =
  Product2Collection<
    A,B,
    InlineProduct2<A.Index,B.Index>,
    InlineProduct2<A.Element,B.Element>>

/// Convenience for inline-element, inline-position arity-3 cartesian products.
public typealias
  InlineCartesianProduct3<
    A:Collection,
    B:Collection,
    C:Collection>
  =
  Product3Collection<
    A,B,C,
    InlineProduct3<A.Index,B.Index,C.Index>,
    InlineProduct3<A.Element,B.Element,C.Element>>

/// Convenience for inline-element, inline-position arity-4 cartesian products.
public typealias
  InlineCartesianProduct4<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection>
  =
  Product4Collection<
    A,B,C,D,
    InlineProduct4<A.Index,B.Index,C.Index,D.Index>,
    InlineProduct4<A.Element,B.Element,C.Element,D.Element>>

/// Convenience for inline-element, inline-position arity-5 cartesian products.
public typealias
  InlineCartesianProduct5<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection>
  =
  Product5Collection<
    A,B,C,D,E,
    InlineProduct5<A.Index,B.Index,C.Index,D.Index,E.Index>,
    InlineProduct5<A.Element,B.Element,C.Element,D.Element,E.Element>>

/// Convenience for inline-element, inline-position arity-6 cartesian products.
public typealias
  InlineCartesianProduct6<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection>
  =
  Product6Collection<
    A,B,C,D,E,F,
    InlineProduct6<A.Index,B.Index,C.Index,D.Index,E.Index,F.Index>,
    InlineProduct6<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element>>

/// Convenience for inline-element, inline-position arity-7 cartesian products.
public typealias
  InlineCartesianProduct7<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection,
    G:Collection>
  =
  Product7Collection<
    A,B,C,D,E,F,G,
    InlineProduct7<A.Index,B.Index,C.Index,D.Index,E.Index,F.Index,G.Index>,
    InlineProduct7<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element,G.Element>>

/// Convenience for inline-element, inline-position arity-8 cartesian products.
public typealias
  InlineCartesianProduct8<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection,
    G:Collection,
    H:Collection>
  =
  Product8Collection<
    A,B,C,D,E,F,G,H,
    InlineProduct8<A.Index,B.Index,C.Index,D.Index,E.Index,F.Index,G.Index,H.Index>,
    InlineProduct8<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element,G.Element,H.Element>>

/// Convenience for inline-element, inline-position arity-9 cartesian products.
public typealias
  InlineCartesianProduct9<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection,
    G:Collection,
    H:Collection,
    I:Collection>
  =
  Product9Collection<
    A,B,C,D,E,F,G,H,I,
    InlineProduct9<A.Index,B.Index,C.Index,D.Index,E.Index,F.Index,G.Index,H.Index,I.Index>,
    InlineProduct9<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element,G.Element,H.Element,I.Element>>

// -------------------------------------------------------------------------- //
// MARK: Cartesian Products - Standard - Pseudo-Constructors
// -------------------------------------------------------------------------- //

/// Obtain a 2-way cartesian-product collection using the standard representation at arity-2.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<A,B>(
  _ a: A,
  _ b: B) -> CartesianProduct2<A,B> {
  return CartesianProduct2<A,B>(
    a,
    b
  )
}

/// Obtain a 3-way cartesian-product collection using the standard representation at arity-3.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<A,B,C>(
  _ a: A,
  _ b: B,
  _ c: C) -> CartesianProduct3<A,B,C> {
  return CartesianProduct3<A,B,C>(
    a,
    b,
    c
  )
}

/// Obtain a 4-way cartesian-product collection using the standard representation at arity-4.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<A,B,C,D>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D) -> CartesianProduct4<A,B,C,D> {
  return CartesianProduct4<A,B,C,D>(
    a,
    b,
    c,
    d
  )
}

/// Obtain a 5-way cartesian-product collection using the standard representation at arity-5.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<A,B,C,D,E>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E) -> CartesianProduct5<A,B,C,D,E> {
  return CartesianProduct5<A,B,C,D,E>(
    a,
    b,
    c,
    d,
    e
  )
}

/// Obtain a 6-way cartesian-product collection using the standard representation at arity-6.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<A,B,C,D,E,F>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F) -> CartesianProduct6<A,B,C,D,E,F> {
  return CartesianProduct6<A,B,C,D,E,F>(
    a,
    b,
    c,
    d,
    e,
    f
  )
}

/// Obtain a 7-way cartesian-product collection using the standard representation at arity-7.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<A,B,C,D,E,F,G>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G) -> CartesianProduct7<A,B,C,D,E,F,G> {
  return CartesianProduct7<A,B,C,D,E,F,G>(
    a,
    b,
    c,
    d,
    e,
    f,
    g
  )
}

/// Obtain an 8-way cartesian-product collection using the standard representation at arity-8.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<A,B,C,D,E,F,G,H>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H) -> CartesianProduct8<A,B,C,D,E,F,G,H> {
  return CartesianProduct8<A,B,C,D,E,F,G,H>(
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

/// Obtain an 9-way cartesian-product collection using the standard representation at arity-9.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<A,B,C,D,E,F,G,H,I>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H,
  _ i: I) -> CartesianProduct9<A,B,C,D,E,F,G,H,I> {
  return CartesianProduct9<A,B,C,D,E,F,G,H,I>(
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

// -------------------------------------------------------------------------- //
// MARK: Cartesian Products - Inline - Pseudo-Constructors
// -------------------------------------------------------------------------- //

/// Obtain a 2-way cartesian-product collection using inline representations for positions and elements.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func InlineCartesianProduct<A,B>(
  _ a: A,
  _ b: B) -> InlineCartesianProduct2<A,B> {
  return InlineCartesianProduct2<A,B>(
    a,
    b
  )
}

/// Obtain a 3-way cartesian-product collection using inline representations for positions and elements.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func InlineCartesianProduct<A,B,C>(
  _ a: A,
  _ b: B,
  _ c: C) -> InlineCartesianProduct3<A,B,C> {
  return InlineCartesianProduct3<A,B,C>(
    a,
    b,
    c
  )
}

/// Obtain a 4-way cartesian-product collection using inline representations for positions and elements.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func InlineCartesianProduct<A,B,C,D>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D) -> InlineCartesianProduct4<A,B,C,D> {
  return InlineCartesianProduct4<A,B,C,D>(
    a,
    b,
    c,
    d
  )
}

/// Obtain a 5-way cartesian-product collection using inline representations for positions and elements.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func InlineCartesianProduct<A,B,C,D,E>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E) -> InlineCartesianProduct5<A,B,C,D,E> {
  return InlineCartesianProduct5<A,B,C,D,E>(
    a,
    b,
    c,
    d,
    e
  )
}

/// Obtain a 6-way cartesian-product collection using inline representations for positions and elements.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func InlineCartesianProduct<A,B,C,D,E,F>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F) -> InlineCartesianProduct6<A,B,C,D,E,F> {
  return InlineCartesianProduct6<A,B,C,D,E,F>(
    a,
    b,
    c,
    d,
    e,
    f
  )
}

/// Obtain a 7-way cartesian-product collection using inline representations for positions and elements.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func InlineCartesianProduct<A,B,C,D,E,F,G>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G) -> InlineCartesianProduct7<A,B,C,D,E,F,G> {
  return InlineCartesianProduct7<A,B,C,D,E,F,G>(
    a,
    b,
    c,
    d,
    e,
    f,
    g
  )
}

/// Obtain an 8-way cartesian-product collection using inline representations for positions and elements.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func InlineCartesianProduct<A,B,C,D,E,F,G,H>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H) -> InlineCartesianProduct8<A,B,C,D,E,F,G,H> {
  return InlineCartesianProduct8<A,B,C,D,E,F,G,H>(
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

/// Obtain an 9-way cartesian-product collection using inline representations for positions and elements.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func InlineCartesianProduct<A,B,C,D,E,F,G,H,I>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H,
  _ i: I) -> InlineCartesianProduct9<A,B,C,D,E,F,G,H,I> {
  return InlineCartesianProduct9<A,B,C,D,E,F,G,H,I>(
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

// -------------------------------------------------------------------------- //
// MARK: Cartesian Products - Custom - Pseudo-Constructors
// -------------------------------------------------------------------------- //

/// Obtain a 2-way cartesian-product collection using the indicated representation.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<Position,Element,A,B>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B) -> Product2Collection<A,B,Position,Element> {
  return Product2Collection<A,B,Position,Element>(
    a,
    b
  )
}

/// Obtain a 3-way cartesian-product collection using the indicated representation.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<Position,Element,A,B,C>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B,
  _ c: C) -> Product3Collection<A,B,C,Position,Element> {
  return Product3Collection<A,B,C,Position,Element>(
    a,
    b,
    c
  )
}

/// Obtain a 4-way cartesian-product collection using the indicated representation.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<Position,Element,A,B,C,D>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D) -> Product4Collection<A,B,C,D,Position,Element> {
  return Product4Collection<A,B,C,D,Position,Element>(
    a,
    b,
    c,
    d
  )
}

/// Obtain a 5-way cartesian-product collection using the indicated representation.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<Position,Element,A,B,C,D,E>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E) -> Product5Collection<A,B,C,D,E,Position,Element> {
  return Product5Collection<A,B,C,D,E,Position,Element>(
    a,
    b,
    c,
    d,
    e
  )
}

/// Obtain a 6-way cartesian-product collection using the indicated representation.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<Position,Element,A,B,C,D,E,F>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F) -> Product6Collection<A,B,C,D,E,F,Position,Element> {
  return Product6Collection<A,B,C,D,E,F,Position,Element>(
    a,
    b,
    c,
    d,
    e,
    f
  )
}

/// Obtain a 7-way cartesian-product collection using the indicated representation.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<Position,Element,A,B,C,D,E,F,G>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G) -> Product7Collection<A,B,C,D,E,F,G,Position,Element> {
  return Product7Collection<A,B,C,D,E,F,G,Position,Element>(
    a,
    b,
    c,
    d,
    e,
    f,
    g
  )
}

/// Obtain an 8-way cartesian-product collection using the indicated representation.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<Position,Element,A,B,C,D,E,F,G,H>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H) -> Product8Collection<A,B,C,D,E,F,G,H,Position,Element> {
  return Product8Collection<A,B,C,D,E,F,G,H,Position,Element>(
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

/// Obtain an 9-way cartesian-product collection using the indicated representation.
///
/// - note: `CartesianProduct` is verbose but `Product` is too overloaded to use as-is.
///
@inlinable
public func CartesianProduct<Position,Element,A,B,C,D,E,F,G,H,I>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H,
  _ i: I) -> Product9Collection<A,B,C,D,E,F,G,H,I,Position,Element> {
  return Product9Collection<A,B,C,D,E,F,G,H,I,Position,Element>(
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
