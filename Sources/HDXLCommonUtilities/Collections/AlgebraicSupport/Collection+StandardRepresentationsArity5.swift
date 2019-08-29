//
//  Collection+StandardRepresentationsArity5.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Standard Representations - Arity-5
// -------------------------------------------------------------------------- //

/// Default representation for arity-5 *elements*.
public typealias
  StandardElementRepresentation5<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection>
  =
  COWProduct5<
    A.Element,
    B.Element,
    C.Element,
    D.Element,
    E.Element>

/// Default representation for arity-5 *positions*.
public typealias
  StandardPositionRepresentation5<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection>
  =
  InlineProduct5<
    A.Index,
    B.Index,
    C.Index,
    D.Index,
    E.Index>

/// Shorthand for *uniform* arity-5 *elements*.
public typealias
  StandardUniformElementRepresentation5<Source:Collection>
  =
  UniformCOWProduct5<Source.Element>

/// Shorthand for *uniform* arity-5 *positions*.
public typealias
  StandardUniformPositionRepresentation5<Source:Collection>
  =
  UniformInlineProduct5<Source.Index>
