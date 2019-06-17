//
//  InPlaceBlendable.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InPlaceBlendable - Definition
// -------------------------------------------------------------------------- //

/// `InPlaceBlendable` extends `Blendable` with mutating, in-place equivalents for its methods.
public protocol InPlaceBlendable : Blendable {
  
  /// In-place overwrites `self` with the result of blending `first` and `other` with the requested
  /// weights.
  /// 
  /// - parameter first: The first value to blend
  /// - parameter firstWeight: The weight to use with the first value
  /// - parameter other: The other value to blend
  /// - parameter otherWeight: The weight to use with the other value
  ///
  /// - note: Default implementation supplied but types encouraged to supply a proper one, instead.
  /// - note: Narrow-purpose method to help reduce allocations for COW types (but not sufficient to do so on its own; needs other support).
  ///
  mutating func becomeBlend(
    of first: Self,
    weight firstWeight: BlendingWeight,
    with other: Self,
    weight otherWeight: BlendingWeight)

  /// In-place overwrites `self` with the interpolated value at `distance` between `start` and `limit`.
  ///
  /// - parameter start: The start (`0.0`) value.
  /// - parameter limit: The limit (`1.0`) value.
  /// - parameter distance: The relative position (expected to be in `[0.0, 1.0]`).
  ///
  /// - note: Narrow-purpose method to help reduce allocations for COW types (but not sufficient to do so on its own; needs other support).
  ///
  mutating func becomeInterpolation(
    from start: Self,
    to limit: Self,
    at distance: BlendingWeight
  )

  /// In-place blends `other` (with `weight`) into `self` witthout weighting self.
  ///
  /// Always equivalent-to `formBlend(at: 1.0, with: other, weight: otherWeight)`,
  /// but will often be more-efficient b/c it avoids dealing with `self`'s weight.
  ///
  /// - note: Default implementation supplied but types encouraged to supply a proper one, instead.
  ///
  mutating func formIncorporation(
    of other: Self,
    weight otherWeight: BlendingWeight)

  /// In-place blends `self` (at `weight`) with `other` (at `otherWeight`).
  mutating func formBlend(
    at weight: BlendingWeight,
    of other: Self,
    weight otherWeight: BlendingWeight)
  
  /// In-place replaces `self` with the location at `distance` between `self` and `other`.
  ///
  /// - parameter distance: A relative distance *away-from* `self`; expected to be in `[0.0, 1.0]`.
  /// - parameter other: The destination (e.g. the `1.0` value).
  ///
  mutating func formInterpolation(
    at distance: BlendingWeight,
    towards other: Self)
  
}

// -------------------------------------------------------------------------- //
// MARK: InPlaceBlendable - Default Implementations
// -------------------------------------------------------------------------- //

public extension InPlaceBlendable {
  
  @inlinable
  mutating func becomeBlend(
    of first: Self,
    weight firstWeight: BlendingWeight,
    with other: Self,
    weight otherWeight: BlendingWeight) {
    self = Self(
      byBlending: first,
      weight: firstWeight,
      with: other,
      weight: otherWeight
    )
  }
  
  @inlinable
  mutating func formIncorporation(
    of other: Self,
    weight otherWeight: BlendingWeight) {
    self.formBlend(
      at: 1.0,
      of: other,
      weight: otherWeight
    )
  }

  
  @inlinable
  mutating func formInterpolation(
    at distance: BlendingWeight,
    towards other: Self) {
    self.formBlend(
      at: (1.0 - distance),
      of: other,
      weight: distance
    )
  }
  
  @inlinable
  mutating func becomeInterpolation(
    from start: Self,
    to limit: Self,
    at distance: BlendingWeight) {
    self.becomeBlend(
      of: start,
      weight: (1.0 - distance),
      with: limit,
      weight: distance
    )
  }
  
}
