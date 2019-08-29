//
//  Collection+StandardRepresentationsArity7.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Standard Representations - Arity-7
// -------------------------------------------------------------------------- //
  
/// Default representation for arity-7 *elements*.
public typealias
  StandardElementRepresentation7<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection>
  =
  COWProduct7<
    A.Element,
    B.Element,
    C.Element,
    D.Element,
    E.Element,
    F.Element,
    G.Element>

/// Default representation for arity-7 *positions*.
public typealias
  StandardPositionRepresentation7<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection,
  G:Collection>
  =
  InlineProduct7<
    A.Index,
    B.Index,
    C.Index,
    D.Index,
    E.Index,
    F.Index,
    G.Index>

/// Shorthand for *uniform* arity-7 *elements*.
public typealias
  StandardUniformElementRepresentation7<Source:Collection>
  =
  UniformCOWProduct7<Source.Element>

/// Shorthand for *uniform* arity-7 *positions*.
public typealias
  StandardUniformPositionRepresentation7<Source:Collection>
  =
  UniformInlineProduct7<Source.Index>
