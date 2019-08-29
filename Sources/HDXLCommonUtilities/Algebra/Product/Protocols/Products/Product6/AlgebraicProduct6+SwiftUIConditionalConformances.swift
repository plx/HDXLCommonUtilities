//
//  AlgebraicProduct6+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct6 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct6
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic,
  E:AdditiveArithmetic,
  F:AdditiveArithmetic {
 
  @inlinable
  static var zero: Self {
    get {
      return Self(
        A.zero,
        B.zero,
        C.zero,
        D.zero,
        E.zero,
        F.zero
      )
    }
  }

  @inlinable
  static func +(
    lhs: Self,
    rhs: Self) -> Self {
    return Self(
      lhs.a + rhs.a,
      lhs.b + rhs.b,
      lhs.c + rhs.c,
      lhs.d + rhs.d,
      lhs.e + rhs.e,
      lhs.f + rhs.f
    )
  }
  
  @inlinable
  static func +=(
    lhs: inout Self,
    rhs: Self) {
    lhs.a += rhs.a
    lhs.b += rhs.b
    lhs.c += rhs.c
    lhs.d += rhs.d
    lhs.e += rhs.e
    lhs.f += rhs.f
  }
  
  @inlinable
  static func -(
    lhs: Self,
    rhs: Self) -> Self {
    return Self(
      lhs.a - rhs.a,
      lhs.b - rhs.b,
      lhs.c - rhs.c,
      lhs.d - rhs.d,
      lhs.e - rhs.e,
      lhs.f - rhs.f
    )
  }
  
  @inlinable
  static func -=(
    lhs: inout Self,
    rhs: Self) {
    lhs.a -= rhs.a
    lhs.b -= rhs.b
    lhs.c -= rhs.c
    lhs.d -= rhs.d
    lhs.e -= rhs.e
    lhs.f -= rhs.f
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct6 - VectorArithmetic
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct6
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic,
  E:VectorArithmetic,
  F:VectorArithmetic {
  
  @inlinable
  var magnitudeSquared: Double {
    get {
      return (
        self.a.magnitudeSquared
        +
        self.b.magnitudeSquared
        +
        self.c.magnitudeSquared
        +
        self.d.magnitudeSquared
        +
        self.e.magnitudeSquared
        +
        self.f.magnitudeSquared
      )
    }
  }
  
  @inlinable
  mutating func scale(by factor: Double) {
    self.a.scale(by: factor)
    self.b.scale(by: factor)
    self.c.scale(by: factor)
    self.d.scale(by: factor)
    self.e.scale(by: factor)
    self.f.scale(by: factor)
  }

}

