//
//  Complex+Support.swift
//

import Foundation
import Numerics

@usableFromInline
internal func canonicalizing<R:Real>(_ work: () throws -> Complex<R>) rethrows -> Complex<R> {
  let result = try work()
  return result.canonicalized
}


@inlinable
internal func firstFiniteValue<R:Real>(
  _ a: Complex<R>,
  _ b: Complex<R>) -> Complex<R>? {
  if a.isFinite {
    return a
  } else if b.isFinite {
    return b
  } else {
    return nil
  }
}

@inlinable
internal func countOfInfinity<R:Real>(
  _ a: Complex<R>) -> Int {
  return countOfFalse(
    a.isFinite
  )
}

@inlinable
internal func countOfInfinity<R:Real>(
  _ a: Complex<R>,
  _ b: Complex<R>) -> Int {
  return countOfFalse(
    a.isFinite,
    b.isFinite
  )
}

@inlinable
internal func countOfInfinity<R:Real>(
  _ a: Complex<R>,
  _ b: Complex<R>,
  _ c: Complex<R>) -> Int {
  return countOfFalse(
    a.isFinite,
    b.isFinite,
    c.isFinite
  )
}

@inlinable
internal func countOfInfinity<R:Real>(
  _ a: Complex<R>,
  _ b: Complex<R>,
  _ c: Complex<R>,
  _ d: Complex<R>) -> Int {
  return countOfFalse(
    a.isFinite,
    b.isFinite,
    c.isFinite,
    d.isFinite
  )
}


internal extension Complex {
  
  @inlinable
  mutating func formFiniteProduct(with other: Complex<RealType>) {
    // /////////////////////////////////////////////////////////////////////////
    // TODO: consider demoting to `pedantic_assert`
    precondition(self.isFinite)
    precondition(other.isFinite)
    // /////////////////////////////////////////////////////////////////////////
    self *= other
  }
  
  @inlinable
  static func structuralComparison(
    _ lhs: Complex<RealType>,
    _ rhs: Complex<RealType>) -> ComparisonResult {
    switch (lhs.isFinite, rhs.isFinite) {
    case (true, true):
      return ComparisonResult.coalescing(
        lhs.magnitude <=> rhs.magnitude,
        lhs.real <=> rhs.real,
        lhs.imaginary <=> rhs.imaginary
      )
    case (false,true):
      return .orderedDescending
    case (true,false):
      return .orderedAscending
    case (false,false):
      return .orderedSame
    }
  }
    
  @inlinable
  static func infinityNormDistance(
    from z: Complex<RealType>,
    to w: Complex<RealType>) -> RealType {
    // note: b/c `Complex` (a) can be the point at infinity and (b) has multiple
    // valid representations of that point, it follows that (c) we *must* first
    // handle infinity-or-not at the `Complex` level.
    //
    // For example, (0,infinity) and (infinity,0) are both the point at infinity
    // and thus should have infinity-norm distance 0. If we did this naively and
    // componentwise, however, we'd mistakenly wind up with them distance-infinity
    // from each other.
    switch (z.isFinite,w.isFinite) {
    case (false, false):
      return 0
    case (false, true):
      return .infinity
    case (true, false):
      return .infinity
    case (true, true):
      return max(
        RealType.absoluteDistanceForComplex(
          from: z.real,
          to: w.real
        ),
        RealType.absoluteDistanceForComplex(
          from: z.imaginary,
          to: w.imaginary
        )
      )
    }
  }
  
  @inlinable
  func hasInfinityNormDistance(
    strictlyLessThan epsilon: RealType,
    to other: Complex<RealType>) -> Bool {
    return Complex<RealType>.infinityNormDistance(
      from: self,
      to: other
    ) < epsilon
  }

  @inlinable
  func hasInfinityNormDistance(
    greaterThan epsilon: RealType,
    to other: Complex<RealType>) -> Bool {
    return epsilon < Complex<RealType>.infinityNormDistance(
      from: self,
      to: other
    )
  }

  @usableFromInline
  enum Characterization {
    case zero
    case infinity
    case finiteNonZero(RealType,RealType)
  }

  @usableFromInline
  enum CharacterizationType {
    case zero
    case infinity
    case finiteNonZero
  }
  
  @inlinable
  var isOnRiemannSphere: Bool {
    get {
      // note: all combos of `infinity` and `nan` are equally the point at infinity
      return true
    }
  }

  @inlinable
  var isFiniteNonZero: Bool {
    get {
      guard
        self.isFinite,
        self.isNonZero else {
          return false
      }
      return true
    }
  }
  
  @inlinable
  var isNonZero: Bool {
    get {
      return !self.isZero
    }
  }
  
  @inlinable
  var isOne: Bool {
    get {
      return self == .one
    }
  }
  
  @inlinable
  mutating func negate() {
    self = -self
  }
  
  @inlinable
  var characterizationType: CharacterizationType {
    get {
      guard self.isNonZero else {
        return .zero
      }
      guard self.isFinite else {
        return .infinity
      }
      return .finiteNonZero
    }
  }
  
  @inlinable
  mutating func formCanonicalization() {
    switch self.characterizationType {
    case .zero:
      self = Self.zero
    case .infinity:
      self = Self.infinity
    case .finiteNonZero:
      self *= 1
    }
  }
  
}

