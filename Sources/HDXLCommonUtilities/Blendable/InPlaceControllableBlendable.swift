//
//  InPlaceControllableBlendable.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InPlaceBlendable - Definition
// -------------------------------------------------------------------------- //

/// `InPlaceControllableBlendable` extends `ControllableBlendable` with mutating,
/// in-place equivalents for its methods.
public protocol InPlaceControllableBlendable : ControllableBlendable {
  
  /// In-place overwrites `self` with the result of blending `first` and `other` with the requested
  /// weights.
  ///
  /// - parameter first: The first value to blend
  /// - parameter firstWeight: The weight to use with the first value
  /// - parameter other: The other value to blend
  /// - parameter otherWeight: The weight to use with the other value
  /// - parameter options: Options controlling the blending.
  ///
  /// - note: Default implementation supplied but types encouraged to supply a proper one, instead.
  /// - note: Narrow-purpose method to help reduce allocations for COW types (but not sufficient to do so on its own; needs other support).
  ///
  mutating func becomeBlend(
    of first: Self,
    weight firstWeight: BlendingWeight,
    with other: Self,
    weight otherWeight: BlendingWeight,
    options: Options)
  
  /// In-place overwrites `self` with the interpolated value at `distance` between `start` and `limit`.
  ///
  /// - parameter start: The start (`0.0`) value.
  /// - parameter limit: The limit (`1.0`) value.
  /// - parameter distance: The relative position (expected to be in `[0.0, 1.0]`).
  /// - parameter options: Options controlling the blending.
  ///
  /// - note: Narrow-purpose method to help reduce allocations for COW types (but not sufficient to do so on its own; needs other support).
  ///
  mutating func becomeInterpolation(
    from start: Self,
    to limit: Self,
    at distance: BlendingWeight,
    options: Options
  )
  
  /// In-place blends `other` (with `otherWeight`) into `self`, weighting `self` at an implicit `1.0`.
  ///
  /// - parameter other: The other value to blend
  /// - parameter otherWeight: The weight to use with the other value
  /// - parameter options: Options controlling the blending.
  ///
  /// Always equivalent-to `formBlend(at: 1.0, with: other, weight: otherWeight, options: options)`,
  /// but will often be more-efficient b/c it avoids dealing with `self`'s weight.
  ///
  /// - note: Default implementation supplied but types encouraged to supply a proper one, instead.
  ///
  mutating func formIncorporation(
    of other: Self,
    weight otherWeight: BlendingWeight,
    options: Options)
  
  /// In-place blends `self` (at `weight`) with `other` (at `otherWeight`).
  ///
  /// - parameter weight: The weight to use for `self`
  /// - parameter other: The other value to blend
  /// - parameter otherWeight: The weight to use with the other value
  /// - parameter options: Options controlling the blending.
  ///
  mutating func formBlend(
    at weight: BlendingWeight,
    of other: Self,
    weight otherWeight: BlendingWeight,
    options: Options)
  
  /// In-place replaces `self` with the location at `distance` between `self` and `other`.
  ///
  /// - parameter distance: A relative distance *away-from* `self`; expected to be in `[0.0, 1.0]`.
  /// - parameter other: The destination (e.g. the `1.0` value).
  /// - parameter options: Options controlling the blending.
  ///
  mutating func formInterpolation(
    at distance: BlendingWeight,
    towards other: Self,
    options: Options)
  
}

// -------------------------------------------------------------------------- //
// MARK: InPlaceControllableBlendable - Default Implementations
// -------------------------------------------------------------------------- //

public extension InPlaceControllableBlendable {
  
  @inlinable
  mutating func becomeBlend(
    of first: Self,
    weight firstWeight: BlendingWeight,
    with other: Self,
    weight otherWeight: BlendingWeight,
    options: Options) {
    self = Self(
      byBlending: first,
      weight: firstWeight,
      with: other,
      weight: otherWeight,
      options: options
    )
  }
  
  @inlinable
  mutating func becomeInterpolation(
    from start: Self,
    to limit: Self,
    at distance: BlendingWeight,
    options: Options) {
    self = Self(
      byInterpolatingFrom: start,
      towards: limit,
      at: distance,
      options: options
    )
  }
  
  @inlinable
  mutating func formIncorporation(
    of other: Self,
    weight otherWeight: BlendingWeight,
    options: Options) {
    self.formBlend(
      at: 1.0,
      of: other,
      weight: otherWeight,
      options: options
    )
  }
  
  @inlinable
  mutating func formInterpolation(
    at distance: BlendingWeight,
    towards other: Self,
    options: Options) {
    self.formBlend(
      at: (1.0 - distance),
      of: other,
      weight: distance,
      options: options
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InPlaceControllableBlendable - Default Implementation Overrides
// -------------------------------------------------------------------------- //

public extension InPlaceControllableBlendable {
  
  @inlinable
  mutating func becomeBlend(
    of first: Self,
    weight firstWeight: BlendingWeight,
    with other: Self,
    weight otherWeight: BlendingWeight) {
    self.becomeBlend(
      of: first,
      weight: firstWeight,
      with: other,
      weight: otherWeight,
      options: Self.standardOptions
    )
  }
  
  @inlinable
  mutating func becomeInterpolation(
    from start: Self,
    to limit: Self,
    at distance: BlendingWeight) {
    self.becomeInterpolation(
      from: start,
      to: limit,
      at: distance,
      options: Self.standardOptions
    )
  }

  @inlinable
  mutating func formIncorporation(
    of other: Self,
    weight otherWeight: BlendingWeight) {
    self.formIncorporation(
      of: other,
      weight: otherWeight,
      options: Self.standardOptions
    )
  }
  
  @inlinable
  mutating func formBlend(
    at weight: BlendingWeight,
    of other: Self,
    weight otherWeight: BlendingWeight) {
    self.formBlend(
      at: weight,
      of: other,
      weight: otherWeight,
      options: Self.standardOptions
    )
  }
  
  @inlinable
  mutating func formInterpolation(
    at distance: BlendingWeight,
    towards other: Self) {
    self.formInterpolation(
      at: distance,
      towards: other,
      options: Self.standardOptions
    )
  }
  
}
