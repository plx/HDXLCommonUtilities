//
//  Collection+StandardRepresentationsArity3.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Standard Representations - Arity-3
// -------------------------------------------------------------------------- //

/// Default representation for arity-3 *elements*.
public typealias
  StandardElementRepresentation3<
  A:Collection,
  B:Collection,
  C:Collection>
  =
  InlineProduct3<
    A.Element,
    B.Element,
    C.Element>
  
/// Default representation for arity-3 *positions*.
public typealias
  StandardPositionRepresentation3<
  A:Collection,
  B:Collection,
  C:Collection>
  =
  InlineProduct3<
    A.Index,
    B.Index,
    C.Index>

/// Shorthand for *uniform* arity-3 *elements*.
public typealias
  StandardUniformElementRepresentation3<Source:Collection>
  =
  UniformInlineProduct3<Source.Element>

/// Shorthand for *uniform* arity-3 *positions*.
public typealias
  StandardUniformPositionRepresentation3<Source:Collection>
  =
  UniformInlineProduct3<Source.Index>
