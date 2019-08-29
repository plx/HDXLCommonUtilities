//
//  Collection+StandardRepresentationsArity2.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Standard Representations - Arity-2
// -------------------------------------------------------------------------- //

/// Default representation for arity-2 *elements*.
public typealias
  StandardElementRepresentation2<
  A:Collection,
  B:Collection>
  =
  InlineProduct2<
    A.Element,
    B.Element>
  
/// Default representation for arity-2 *positions*.
public typealias
  StandardPositionRepresentation2<
  A:Collection,
  B:Collection>
  =
  InlineProduct2<
    A.Index,
    B.Index>

/// Shorthand for *uniform* arity-2 *elements*.
public typealias
  StandardUniformElementRepresentation2<Source:Collection>
  =
  UniformInlineProduct2<Source.Element>

/// Shorthand for *uniform* arity-2 *positions*.
public typealias
  StandardUniformPositionRepresentation2<Source:Collection>
  =
  UniformInlineProduct2<Source.Index>
