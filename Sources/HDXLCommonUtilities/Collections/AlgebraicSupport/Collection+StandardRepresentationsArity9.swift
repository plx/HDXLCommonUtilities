//
//  Collection+StandardRepresentationsArity9.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Standard Representations - Arity-9
// -------------------------------------------------------------------------- //

/// Default representation for arity-9 *elements*.
public typealias
  StandardElementRepresentation9<
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
  COWProduct9<
    A.Element,
    B.Element,
    C.Element,
    D.Element,
    E.Element,
    F.Element,
    G.Element,
    H.Element,
    I.Element>

/// Default representation for arity-9 *positions*.
public typealias
  StandardPositionRepresentation9<
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
  InlineProduct9<
    A.Index,
    B.Index,
    C.Index,
    D.Index,
    E.Index,
    F.Index,
    G.Index,
    H.Index,
    I.Index>

/// Shorthand for *uniform* arity-9 *elements*.
public typealias
  StandardUniformElementRepresentation9<Source:Collection>
  =
  UniformCOWProduct9<Source.Element>

/// Shorthand for *uniform* arity-9 *positions*.
public typealias
  StandardUniformPositionRepresentation9<Source:Collection>
  =
  UniformInlineProduct9<Source.Index>

