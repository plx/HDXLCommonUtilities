//
//  Blendable.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Blendable - Definition
// -------------------------------------------------------------------------- //

/// Protocol for types that support simple weighted blending.
///
///
public protocol Blendable {
  
  /// Parameter used when weighting contributions from blends.
  associatedtype BlendingWeight: BinaryFloatingPoint
  
  /// Constructs a value as a weighted blend of two others.
  ///
  /// - parameter first: The first value to blend
  /// - parameter firstWeight: The weight to use with the first value
  /// - parameter other: The other value to blend
  /// - parameter otherWeight: The weight to use with the other value
  ///
  /// - returns: The type-appropriate equivalent of `(first * firstWeight) + (other * otherWeight)`.
  ///
  /// - note: This is the core primitive and only *required* method in the protocol; interpolation is built atop this.
  ///
  init(
    byBlending first: Self,
    weight firstWeight: BlendingWeight,
    with other: Self,
    weight otherWeight: BlendingWeight)
  
  /// Construct a value interpolated between `start` and `limit`.
  ///
  /// - parameter start: The start, `0.0`, etc., value for the interpolation
  /// - parameter limit: The limit, `1.0`, etc., value for the interpolation
  /// - parameter distance: The interpolation distance; expected to be in `[0.0, 1.0]`.
  ///
  /// - returns: The requested interpolated value.
  ///
  /// - note: Equivalent semantics to `init(byBlending: first, weight: (1.0 - distance), with: other, weight: distance)` but can be more-efficient.
  /// - note: Default implementation provided but types should generally include their own.
  ///
  init(
    byInterpolatingFrom start: Self,
    towards limit: Self,
    at distance: BlendingWeight)
  
  /// Returns the result of blending `other` (at `weight`) into `self` (at implicit weight of `1.0`).
  ///
  /// - parameter other: The value to blend with `self`
  /// - parameter weight: The weight with-which to blend `other`
  ///
  /// - returns: The result of blending `other` (at `weight`) into `self` (at implicit weight of `1.0`).
  ///
  /// - note: Semantically-equivalent to `blended(at: 1.0, with: other, weight: distance)`, but potentially more-efficient.
  /// - note: Default implementation provided but types should generally implement this where possible.
  ///
  ///
  func incorporating(
    _ other: Self,
    at weight: BlendingWeight) -> Self

  /// Returns the result of blending `self` (at `weight`) with `other` (at `otherWeight`).
  ///
  /// - parameter weight: The weight to use for `self`
  /// - parameter other: The other value to blend-into `self`
  /// - parameter otherWeight: The weight to use for `other`
  ///
  /// - returns: The result of blending `self` (at `weight`) with `other` (at `otherWeight`).
  ///
  func blended(
    at weight: BlendingWeight,
    with other: Self,
    weight otherWeight: BlendingWeight) -> Self
  
  
  /// Returns the result of traveling `distance` towards `other`.
  ///
  /// - parameter distance: Distance *from* `self` and *towards* `limit`; expected to be in `[0.0, 1.0]`).
  /// - parameter other: The destination value (e.g. the value @ `1.0`)
  ///
  /// - returns: The result of traveling `distance` towards `other` from `self`.
  ///
  /// - note: Semantically-equivalent to `blended(at: (1.0 - distance), with: other, weight: distance)`, but potentially more-efficient.
  /// - note: Default implementation provided but types should generally implement this where possible.
  ///
  func interpolated(
    at distance: BlendingWeight,
    towards other: Self) -> Self
  
}

// -------------------------------------------------------------------------- //
// MARK: Blendable - Default Implementations
// -------------------------------------------------------------------------- //

public extension Blendable {
  
  @inlinable
  init(
    byInterpolatingFrom start: Self,
    towards limit: Self,
    at distance: BlendingWeight) {
    self.init(
      byBlending: start,
      weight: (1.0 - distance),
      with: limit,
      weight: distance
    )
  }
  
  @inlinable
  func incorporating(
    _ other: Self,
    at weight: BlendingWeight) -> Self {
    return Self(
      byBlending: self,
      weight: 1.0,
      with: other,
      weight: weight
    )
  }
  
  @inlinable
  func blended(
    at weight: BlendingWeight,
    with other: Self,
    weight otherWeight: BlendingWeight) -> Self {
    return Self(
      byBlending: self,
      weight: weight,
      with: other,
      weight: otherWeight
    )
  }
  
  @inlinable
  func interpolated(
    at distance: BlendingWeight,
    towards other: Self) -> Self {
    return Self(
      byInterpolatingFrom: self,
      towards: other,
      at: distance
    )
  }
  
}
