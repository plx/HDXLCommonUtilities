//
//  ProductZipConveniences.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Zips - Standard Representations
// -------------------------------------------------------------------------- //

/// Standard representation for arity-2 cartesian products.
public typealias
  Zip2Collection<
    A:Collection,
    B:Collection>
  =
  ProductZip2Collection<
    A,B,
    StandardPositionRepresentation2<A,B>,
    StandardElementRepresentation2<A,B>>

/// Standard representation for arity-3 cartesian products.
public typealias
  Zip3Collection<
    A:Collection,
    B:Collection,
    C:Collection>
  =
  ProductZip3Collection<
    A,B,C,
    StandardPositionRepresentation3<A,B,C>,
    StandardElementRepresentation3<A,B,C>>

/// Standard representation for arity-4 cartesian products.
public typealias
  Zip4Collection<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection>
  =
  ProductZip4Collection<
    A,B,C,D,
    StandardPositionRepresentation4<A,B,C,D>,
    StandardElementRepresentation4<A,B,C,D>>

/// Standard representation for arity-5 cartesian products.
public typealias
  Zip5Collection<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection>
  =
  ProductZip5Collection<
    A,B,C,D,E,
    StandardPositionRepresentation5<A,B,C,D,E>,
    StandardElementRepresentation5<A,B,C,D,E>>

/// Standard representation for arity-6 cartesian products.
public typealias
  Zip6Collection<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection>
  =
  ProductZip6Collection<
    A,B,C,D,E,F,
    StandardPositionRepresentation6<A,B,C,D,E,F>,
    StandardElementRepresentation6<A,B,C,D,E,F>>

/// Standard representation for arity-7 cartesian products.
public typealias
  Zip7Collection<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection,
    G:Collection>
  =
  ProductZip7Collection<
    A,B,C,D,E,F,G,
    StandardPositionRepresentation7<A,B,C,D,E,F,G>,
    StandardElementRepresentation7<A,B,C,D,E,F,G>>

/// Standard representation for arity-8 cartesian products.
public typealias
  Zip8Collection<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection,
    G:Collection,
    H:Collection>
  =
  ProductZip8Collection<
    A,B,C,D,E,F,G,H,
    StandardPositionRepresentation8<A,B,C,D,E,F,G,H>,
    StandardElementRepresentation8<A,B,C,D,E,F,G,H>>

/// Standard representation for arity-9 cartesian products.
public typealias
  Zip9Collection<
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
  ProductZip9Collection<
    A,B,C,D,E,F,G,H,I,
  StandardPositionRepresentation9<A,B,C,D,E,F,G,H,I>,
  StandardElementRepresentation9<A,B,C,D,E,F,G,H,I>>

// -------------------------------------------------------------------------- //
// MARK: Zips - Inline Representations
// -------------------------------------------------------------------------- //

/// Convenience for inline-element, inline-position arity-2 cartesian products.
public typealias
  InlineZip2Collection<
    A:Collection,
    B:Collection>
  =
  ProductZip2Collection<
    A,B,
    InlineProduct2<A.Index,B.Index>,
    InlineProduct2<A.Element,B.Element>>

/// Convenience for inline-element, inline-position arity-3 cartesian products.
public typealias
  InlineZip3Collection<
    A:Collection,
    B:Collection,
    C:Collection>
  =
  ProductZip3Collection<
    A,B,C,
    InlineProduct3<A.Index,B.Index,C.Index>,
    InlineProduct3<A.Element,B.Element,C.Element>>

/// Convenience for inline-element, inline-position arity-4 cartesian products.
public typealias
  InlineZip4Collection<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection>
  =
  ProductZip4Collection<
    A,B,C,D,
    InlineProduct4<A.Index,B.Index,C.Index,D.Index>,
    InlineProduct4<A.Element,B.Element,C.Element,D.Element>>

/// Convenience for inline-element, inline-position arity-5 cartesian products.
public typealias
  InlineZip5Collection<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection>
  =
  ProductZip5Collection<
    A,B,C,D,E,
    InlineProduct5<A.Index,B.Index,C.Index,D.Index,E.Index>,
    InlineProduct5<A.Element,B.Element,C.Element,D.Element,E.Element>>

/// Convenience for inline-element, inline-position arity-6 cartesian products.
public typealias
  InlineZip6Collection<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection>
  =
  ProductZip6Collection<
    A,B,C,D,E,F,
    InlineProduct6<A.Index,B.Index,C.Index,D.Index,E.Index,F.Index>,
    InlineProduct6<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element>>

/// Convenience for inline-element, inline-position arity-7 cartesian products.
public typealias
  InlineZip7Collection<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection,
    G:Collection>
  =
  ProductZip7Collection<
    A,B,C,D,E,F,G,
    InlineProduct7<A.Index,B.Index,C.Index,D.Index,E.Index,F.Index,G.Index>,
    InlineProduct7<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element,G.Element>>

/// Convenience for inline-element, inline-position arity-8 cartesian products.
public typealias
  InlineZip8Collection<
    A:Collection,
    B:Collection,
    C:Collection,
    D:Collection,
    E:Collection,
    F:Collection,
    G:Collection,
    H:Collection>
  =
  ProductZip8Collection<
    A,B,C,D,E,F,G,H,
    InlineProduct8<A.Index,B.Index,C.Index,D.Index,E.Index,F.Index,G.Index,H.Index>,
    InlineProduct8<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element,G.Element,H.Element>>

/// Convenience for inline-element, inline-position arity-9 cartesian products.
public typealias
  InlineZip9Collection<
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
  ProductZip9Collection<
    A,B,C,D,E,F,G,H,I,
    InlineProduct9<A.Index,B.Index,C.Index,D.Index,E.Index,F.Index,G.Index,H.Index,I.Index>,
    InlineProduct9<A.Element,B.Element,C.Element,D.Element,E.Element,F.Element,G.Element,H.Element,I.Element>>

// -------------------------------------------------------------------------- //
// MARK: Zips - Standard - Pseudo-Constructors
// -------------------------------------------------------------------------- //

/// Obtain a 2-way zip collection using the standard representation at arity-2.
@inlinable
public func Zip<A,B>(
  _ a: A,
  _ b: B) -> Zip2Collection<A,B> {
  return Zip2Collection<A,B>(
    a,
    b
  )
}

/// Obtain a 3-way zip collection using the standard representation at arity-3.
@inlinable
public func Zip<A,B,C>(
  _ a: A,
  _ b: B,
  _ c: C) -> Zip3Collection<A,B,C> {
  return Zip3Collection<A,B,C>(
    a,
    b,
    c
  )
}

/// Obtain a 4-way zip collection using the standard representation at arity-4.
@inlinable
public func Zip<A,B,C,D>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D) -> Zip4Collection<A,B,C,D> {
  return Zip4Collection<A,B,C,D>(
    a,
    b,
    c,
    d
  )
}

/// Obtain a 5-way zip collection using the standard representation at arity-5.
@inlinable
public func Zip<A,B,C,D,E>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E) -> Zip5Collection<A,B,C,D,E> {
  return Zip5Collection<A,B,C,D,E>(
    a,
    b,
    c,
    d,
    e
  )
}

/// Obtain a 6-way zip collection using the standard representation at arity-6.
@inlinable
public func Zip<A,B,C,D,E,F>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F) -> Zip6Collection<A,B,C,D,E,F> {
  return Zip6Collection<A,B,C,D,E,F>(
    a,
    b,
    c,
    d,
    e,
    f
  )
}

/// Obtain a 7-way zip collection using the standard representation at arity-7.
@inlinable
public func Zip<A,B,C,D,E,F,G>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G) -> Zip7Collection<A,B,C,D,E,F,G> {
  return Zip7Collection<A,B,C,D,E,F,G>(
    a,
    b,
    c,
    d,
    e,
    f,
    g
  )
}

/// Obtain an 8-way zip collection using the standard representation at arity-8.
@inlinable
public func Zip<A,B,C,D,E,F,G,H>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H) -> Zip8Collection<A,B,C,D,E,F,G,H> {
  return Zip8Collection<A,B,C,D,E,F,G,H>(
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

/// Obtain an 9-way zip collection using the standard representation at arity-9.
@inlinable
public func Zip<A,B,C,D,E,F,G,H,I>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H,
  _ i: I) -> Zip9Collection<A,B,C,D,E,F,G,H,I> {
  return Zip9Collection<A,B,C,D,E,F,G,H,I>(
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
// MARK: Zips - Inline - Pseudo-Constructors
// -------------------------------------------------------------------------- //

/// Obtain a 2-way zip collection using inline representations for positions and elements.
@inlinable
public func InlineZip<A,B>(
  _ a: A,
  _ b: B) -> InlineZip2Collection<A,B> {
  return InlineZip2Collection<A,B>(
    a,
    b
  )
}

/// Obtain a 3-way zip collection using inline representations for positions and elements.
@inlinable
public func InlineZip<A,B,C>(
  _ a: A,
  _ b: B,
  _ c: C) -> InlineZip3Collection<A,B,C> {
  return InlineZip3Collection<A,B,C>(
    a,
    b,
    c
  )
}

/// Obtain a 4-way zip collection using inline representations for positions and elements.
@inlinable
public func InlineZip<A,B,C,D>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D) -> InlineZip4Collection<A,B,C,D> {
  return InlineZip4Collection<A,B,C,D>(
    a,
    b,
    c,
    d
  )
}

/// Obtain a 5-way zip collection using inline representations for positions and elements.
@inlinable
public func InlineZip<A,B,C,D,E>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E) -> InlineZip5Collection<A,B,C,D,E> {
  return InlineZip5Collection<A,B,C,D,E>(
    a,
    b,
    c,
    d,
    e
  )
}

/// Obtain a 6-way zip collection using inline representations for positions and elements.
@inlinable
public func InlineZip<A,B,C,D,E,F>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F) -> InlineZip6Collection<A,B,C,D,E,F> {
  return InlineZip6Collection<A,B,C,D,E,F>(
    a,
    b,
    c,
    d,
    e,
    f
  )
}

/// Obtain a 7-way zip collection using inline representations for positions and elements.
@inlinable
public func InlineZip<A,B,C,D,E,F,G>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G) -> InlineZip7Collection<A,B,C,D,E,F,G> {
  return InlineZip7Collection<A,B,C,D,E,F,G>(
    a,
    b,
    c,
    d,
    e,
    f,
    g
  )
}

/// Obtain an 8-way zip collection using inline representations for positions and elements.
@inlinable
public func InlineZip<A,B,C,D,E,F,G,H>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H) -> InlineZip8Collection<A,B,C,D,E,F,G,H> {
  return InlineZip8Collection<A,B,C,D,E,F,G,H>(
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

/// Obtain an 9-way zip collection using inline representations for positions and elements.
@inlinable
public func InlineZip<A,B,C,D,E,F,G,H,I>(
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H,
  _ i: I) -> InlineZip9Collection<A,B,C,D,E,F,G,H,I> {
  return InlineZip9Collection<A,B,C,D,E,F,G,H,I>(
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
// MARK: Zips - Custom - Pseudo-Constructors
// -------------------------------------------------------------------------- //

/// Obtain a 2-way zip collection using the indicated representation.
@inlinable
public func Zip<Position,Element,A,B>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B) -> ProductZip2Collection<A,B,Position,Element> {
  return ProductZip2Collection<A,B,Position,Element>(
    a,
    b
  )
}

/// Obtain a 3-way zip collection using the indicated representation.
@inlinable
public func Zip<Position,Element,A,B,C>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B,
  _ c: C) -> ProductZip3Collection<A,B,C,Position,Element> {
  return ProductZip3Collection<A,B,C,Position,Element>(
    a,
    b,
    c
  )
}

/// Obtain a 4-way zip collection using the indicated representation.
@inlinable
public func Zip<Position,Element,A,B,C,D>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D) -> ProductZip4Collection<A,B,C,D,Position,Element> {
  return ProductZip4Collection<A,B,C,D,Position,Element>(
    a,
    b,
    c,
    d
  )
}

/// Obtain a 5-way zip collection using the indicated representation.
@inlinable
public func Zip<Position,Element,A,B,C,D,E>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E) -> ProductZip5Collection<A,B,C,D,E,Position,Element> {
  return ProductZip5Collection<A,B,C,D,E,Position,Element>(
    a,
    b,
    c,
    d,
    e
  )
}

/// Obtain a 6-way zip collection using the indicated representation.
@inlinable
public func Zip<Position,Element,A,B,C,D,E,F>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F) -> ProductZip6Collection<A,B,C,D,E,F,Position,Element> {
  return ProductZip6Collection<A,B,C,D,E,F,Position,Element>(
    a,
    b,
    c,
    d,
    e,
    f
  )
}

/// Obtain a 7-way zip collection using the indicated representation.
@inlinable
public func Zip<Position,Element,A,B,C,D,E,F,G>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G) -> ProductZip7Collection<A,B,C,D,E,F,G,Position,Element> {
  return ProductZip7Collection<A,B,C,D,E,F,G,Position,Element>(
    a,
    b,
    c,
    d,
    e,
    f,
    g
  )
}

/// Obtain an 8-way zip collection using the indicated representation.
@inlinable
public func Zip<Position,Element,A,B,C,D,E,F,G,H>(
  positionRepresentation: Position.Type,
  elementRepresentation: Element.Type,
  _ a: A,
  _ b: B,
  _ c: C,
  _ d: D,
  _ e: E,
  _ f: F,
  _ g: G,
  _ h: H) -> ProductZip8Collection<A,B,C,D,E,F,G,H,Position,Element> {
  return ProductZip8Collection<A,B,C,D,E,F,G,H,Position,Element>(
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

/// Obtain an 9-way zip collection using the indicated representation.
@inlinable
public func Zip<Position,Element,A,B,C,D,E,F,G,H,I>(
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
  _ i: I) -> ProductZip9Collection<A,B,C,D,E,F,G,H,I,Position,Element> {
  return ProductZip9Collection<A,B,C,D,E,F,G,H,I,Position,Element>(
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
