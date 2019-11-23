//
//  MobiusTransformationMappedPair.swift
//

import Foundation
import Numerics

/// `Pair`-alike for a pair like `(z,w)` wherein `z` is *intended* to be mapped to `w` by some
/// `MobiusTransformation` (recall that 3 distinct such pairs are needed to specify a transformation).
///
/// *Currently* the implementation of this type consists entirely of vacuous, trivial boilerplate, but that won't
/// last forever: once the transformation code is working, this will then get substantially-extended with support
/// for *smart* pair-pair interpolation (the issue being e.g. interpolating *from* a finite-z to an infinite-z, etc.,
/// wherein linear interpolation won't work and what must instead happen is producing some kind of contextually-
/// appropriate "interpolation proxy" for such infinite coordinates).
///
@usableFromInline
internal struct MobiusTransformationMappedPair<Representation:Real> {
  
  @usableFromInline
  internal var z: Complex<Representation>
  
  @usableFromInline
  internal var w: Complex<Representation>
  
  @inlinable
  init(
    sending z: Complex<Representation>,
    to w: Complex<Representation>) {
    self.z = z
    self.w = w
  }
  
}

internal extension MobiusTransformationMappedPair {
  
  @inlinable
  var infinityCount: Int {
    get {
      return countOfInfinity(self.z,self.w)
    }
  }
  
  @inlinable
  var containsInfinity: Bool {
    get {
      return self.infinityCount > 0
    }
  }
  
  @inlinable
  var componentInfinities: (Bool, Bool) {
    get {
      return (
        !self.z.isFinite,
        !self.w.isFinite
      )
    }
  }
  
  @inlinable
  var lexicographicIndexOfFirstInfinity: Int? {
    get {
      switch (self.z.isFinite,self.w.isFinite) {
      case (false,false):
        return nil
      case (true,false):
        return 0
      case (false,true):
        return 1
      case (true,true):
        return 0
      }
    }
  }
  
  @inlinable
  static func structuralComparison(
    _ lhs: MobiusTransformationMappedPair<Representation>,
    _ rhs: MobiusTransformationMappedPair<Representation>) -> ComparisonResult {
    return ComparisonResult.coalescing(
      Complex<Representation>.structuralComparison(
        lhs.z,
        rhs.z
      ),
      Complex<Representation>.structuralComparison(
        lhs.w,
        rhs.w
      )
    )
  }
  
}

extension MobiusTransformationMappedPair : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      return true
    }
  }
  
}

extension MobiusTransformationMappedPair : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: MobiusTransformationMappedPair<Representation>,
    rhs: MobiusTransformationMappedPair<Representation>) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard
      lhs.z == rhs.z,
      lhs.w == rhs.w else {
        return false
    }
    return true
  }
  
}

extension MobiusTransformationMappedPair : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.z.hash(into: &hasher)
    self.w.hash(into: &hasher)
  }
  
}

extension MobiusTransformationMappedPair : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      return "\(self.z.description) -> \(self.w.description)"
    }
  }
  
}

extension MobiusTransformationMappedPair : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      return "MobiusTransformationMappedPair<\(String(reflecting: Representation.self))>(z: \(self.z.debugDescription), w: \(self.w.debugDescription))"
    }
  }
  
}

extension MobiusTransformationMappedPair : Codable where Representation:Codable {
  
  
}
