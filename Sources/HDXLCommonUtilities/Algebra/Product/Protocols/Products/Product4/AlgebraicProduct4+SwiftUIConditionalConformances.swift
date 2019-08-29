//
//  AlgebraicProduct4+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct4 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct4
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic {
 
  @inlinable
  static var zero: Self {
    get {
      return Self(
        A.zero,
        B.zero,
        C.zero,
        D.zero
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
      lhs.d + rhs.d
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
  }
  
  @inlinable
  static func -(
    lhs: Self,
    rhs: Self) -> Self {
    return Self(
      lhs.a - rhs.a,
      lhs.b - rhs.b,
      lhs.c - rhs.c,
      lhs.d - rhs.d
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
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: AlgebraicProduct4 - VectorArithmetic
// -------------------------------------------------------------------------- //

public extension AlgebraicProduct4
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic {
  
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
      )
    }
  }
  
  @inlinable
  mutating func scale(by factor: Double) {
    self.a.scale(by: factor)
    self.b.scale(by: factor)
    self.c.scale(by: factor)
    self.d.scale(by: factor)
  }

}

