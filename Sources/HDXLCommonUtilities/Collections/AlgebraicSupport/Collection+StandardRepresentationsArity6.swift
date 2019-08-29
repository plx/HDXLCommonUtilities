//
//  Collection+StandardRepresentationsArity6.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Standard Representations - Arity-6
// -------------------------------------------------------------------------- //

/// Default representation for arity-6 *elements*.
public typealias
  StandardElementRepresentation6<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection>
  =
  COWProduct6<
    A.Element,
    B.Element,
    C.Element,
    D.Element,
    E.Element,
    F.Element>

/// Default representation for arity-6 *positions*.
public typealias
  StandardPositionRepresentation6<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection,
  E:Collection,
  F:Collection>
  =
  InlineProduct6<
    A.Index,
    B.Index,
    C.Index,
    D.Index,
    E.Index,
    F.Index>

/// Shorthand for *uniform* arity-6 *elements*.
public typealias
  StandardUniformElementRepresentation6<Source:Collection>
  =
  UniformCOWProduct6<Source.Element>

/// Shorthand for *uniform* arity-6 *positions*.
public typealias
  StandardUniformPositionRepresentation6<Source:Collection>
  =
  UniformInlineProduct6<Source.Index>
