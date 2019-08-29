//
//  Collection+StandardRepresentationsArity4.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Standard Representations - Arity-4
// -------------------------------------------------------------------------- //

/// Default representation for arity-4 *elements*.
public typealias
  StandardElementRepresentation4<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection>
  =
  COWProduct4<
    A.Element,
    B.Element,
    C.Element,
    D.Element>

/// Default representation for arity-4 *positions*.
public typealias
  StandardPositionRepresentation4<
  A:Collection,
  B:Collection,
  C:Collection,
  D:Collection>
  =
  InlineProduct4<
    A.Index,
    B.Index,
    C.Index,
    D.Index>

/// Shorthand for *uniform* arity-4 *elements*.
public typealias
  StandardUniformElementRepresentation4<Source:Collection>
  =
  UniformCOWProduct4<Source.Element>

/// Shorthand for *uniform* arity-4 *positions*.
public typealias
  StandardUniformPositionRepresentation4<Source:Collection>
  =
  UniformInlineProduct4<Source.Index>

