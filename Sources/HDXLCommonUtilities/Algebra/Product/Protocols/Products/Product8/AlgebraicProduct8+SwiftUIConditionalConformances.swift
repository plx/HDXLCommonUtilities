//
//  AlgebraicProduct8+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI
// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct8 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct8
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic,
  E:AdditiveArithmetic,
  F:AdditiveArithmetic,
  G:AdditiveArithmetic,
  H:AdditiveArithmetic {
 
  @inlinable
  static var zero: Self {
    get {
      return Self(
        A.zero,
        B.zero,
        C.zero,
        D.zero,
        E.zero,
        F.zero,
        G.zero,
        H.zero
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
      lhs.f + rhs.f,
      lhs.g + rhs.g,
      lhs.h + rhs.h
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
    lhs.g += rhs.g
    lhs.h += rhs.h
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
      lhs.f - rhs.f,
      lhs.g - rhs.g,
      lhs.h - rhs.h
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
    lhs.g -= rhs.g
    lhs.h -= rhs.h
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct8 - VectorArithmetic
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct8
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic,
  E:VectorArithmetic,
  F:VectorArithmetic,
  G:VectorArithmetic,
  H:VectorArithmetic {
  
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
        +
        self.g.magnitudeSquared
        +
        self.h.magnitudeSquared
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
    self.g.scale(by: factor)
    self.h.scale(by: factor)
  }

}

