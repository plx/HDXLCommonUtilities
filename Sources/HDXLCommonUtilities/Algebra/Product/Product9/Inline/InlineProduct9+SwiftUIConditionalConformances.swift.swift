//
//  InlineProduct9+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct9: AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic,
  E:AdditiveArithmetic,
  F:AdditiveArithmetic,
  G:AdditiveArithmetic,
  H:AdditiveArithmetic,
  I:AdditiveArithmetic {
 
  @inlinable
  public static var zero: InlineProduct9<A,B,C,D,E,F,G,H,I> {
    get {
      return InlineProduct9<A,B,C,D,E,F,G,H,I>(
        A.zero,
        B.zero,
        C.zero,
        D.zero,
        E.zero,
        F.zero,
        G.zero,
        H.zero,
        I.zero
      )
    }
  }

  @inlinable
  public static func +(
    lhs: InlineProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9<A,B,C,D,E,F,G,H,I>) -> InlineProduct9<A,B,C,D,E,F,G,H,I> {
    return InlineProduct9<A,B,C,D,E,F,G,H,I>(
      lhs.a + rhs.a,
      lhs.b + rhs.b,
      lhs.c + rhs.c,
      lhs.d + rhs.d,
      lhs.e + rhs.e,
      lhs.f + rhs.f,
      lhs.g + rhs.g,
      lhs.h + rhs.h,
      lhs.i + rhs.i
    )
  }
  
  @inlinable
  public static func +=(
    lhs: inout InlineProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9<A,B,C,D,E,F,G,H,I>) {
    lhs.a += rhs.a
    lhs.b += rhs.b
    lhs.c += rhs.c
    lhs.d += rhs.d
    lhs.e += rhs.e
    lhs.f += rhs.f
    lhs.g += rhs.g
    lhs.h += rhs.h
    lhs.i += rhs.i
  }
  
  @inlinable
  public static func -(
    lhs: InlineProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9<A,B,C,D,E,F,G,H,I>) -> InlineProduct9<A,B,C,D,E,F,G,H,I> {
    return InlineProduct9<A,B,C,D,E,F,G,H,I>(
      lhs.a - rhs.a,
      lhs.b - rhs.b,
      lhs.c - rhs.c,
      lhs.d - rhs.d,
      lhs.e - rhs.e,
      lhs.f - rhs.f,
      lhs.g - rhs.g,
      lhs.h - rhs.h,
      lhs.i - rhs.i
    )
  }
  
  @inlinable
  public static func -=(
    lhs: inout InlineProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: InlineProduct9<A,B,C,D,E,F,G,H,I>) {
    lhs.a -= rhs.a
    lhs.b -= rhs.b
    lhs.c -= rhs.c
    lhs.d -= rhs.d
    lhs.e -= rhs.e
    lhs.f -= rhs.f
    lhs.g -= rhs.g
    lhs.h -= rhs.h
    lhs.i -= rhs.i
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct9 : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic,
  E:VectorArithmetic,
  F:VectorArithmetic,
  G:VectorArithmetic,
  H:VectorArithmetic,
  I:VectorArithmetic {
  
  @inlinable
  public var magnitudeSquared: Double {
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
        +
        self.i.magnitudeSquared
      )
    }
  }
  
  @inlinable
  public mutating func scale(by factor: Double) {
    self.a.scale(by: factor)
    self.b.scale(by: factor)
    self.c.scale(by: factor)
    self.d.scale(by: factor)
    self.e.scale(by: factor)
    self.f.scale(by: factor)
    self.g.scale(by: factor)
    self.h.scale(by: factor)
    self.i.scale(by: factor)
  }

}

