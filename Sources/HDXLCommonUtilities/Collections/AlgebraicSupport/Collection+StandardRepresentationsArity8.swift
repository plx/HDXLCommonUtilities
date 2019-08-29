//
//  Collection+StandardRepresentationsArity8.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Standard Representations - Arity-8
// -------------------------------------------------------------------------- //

/// Default representation for arity-8 *elements*.
public typealias
  StandardElementRepresentation8<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection>
  =
  COWProduct8<
    A.Element,
    B.Element,
    C.Element,
    D.Element,
    E.Element,
    F.Element,
    G.Element,
    H.Element>

/// Default representation for arity-8 *positions*.
public typealias
  StandardPositionRepresentation8<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection,
  H:Collection>
  =
  InlineProduct8<
    A.Index,
    B.Index,
    C.Index,
    D.Index,
    E.Index,
    F.Index,
    G.Index,
    H.Index>

/// Shorthand for *uniform* arity-8 *elements*.
public typealias
  StandardUniformElementRepresentation8<Source:Collection>
  =
  UniformCOWProduct8<Source.Element>

/// Shorthand for *uniform* arity-8 *positions*.
public typealias
  StandardUniformPositionRepresentation8<Source:Collection>
  =
  UniformInlineProduct8<Source.Index>
