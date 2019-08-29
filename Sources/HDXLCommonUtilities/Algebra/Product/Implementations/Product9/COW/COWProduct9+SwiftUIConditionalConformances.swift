//
//  COWProduct9+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct9 : AdditiveArithmetic
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
  public static var zero: COWProduct9<A,B,C,D,E,F,G,H,I> {
    get {
      return COWProduct9<A,B,C,D,E,F,G,H,I>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  public static func +(
    lhs: COWProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9<A,B,C,D,E,F,G,H,I>) -> COWProduct9<A,B,C,D,E,F,G,H,I> {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    return COWProduct9<A,B,C,D,E,F,G,H,I>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  public static func +=(
    lhs: inout COWProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9<A,B,C,D,E,F,G,H,I>) {
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage += rhs.storage
    } else {
      lhs.storage = lhs.storage + rhs.storage
    }
  }
  
  @inlinable
  public static func -(
    lhs: COWProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9<A,B,C,D,E,F,G,H,I>) -> COWProduct9<A,B,C,D,E,F,G,H,I> {
    return COWProduct9<A,B,C,D,E,F,G,H,I>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  public static func -=(
    lhs: inout COWProduct9<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9<A,B,C,D,E,F,G,H,I>) {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage -= rhs.storage
    } else {
      lhs.storage = lhs.storage - rhs.storage
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct9 : VectorArithmetic
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
      return self.storage.magnitudeSquared
    }
  }
  
  @inlinable
  public mutating func scale(by factor: Double) {
    if isKnownUniquelyReferenced(&self.storage) {
      self.storage.scale(by: factor)
    } else {
      self.storage = self.storage.obtainMutatedClone() {
        $0.scale(by: factor)
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct9Storage : AdditiveArithmetic
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
  internal static var zero: COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    get {
      return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  internal static func +(
    lhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>) -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  internal static func +=(
    lhs: inout COWProduct9Storage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>) {
    lhs.storage += rhs.storage
  }
  
  @inlinable
  internal static func -(
    lhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>) -> COWProduct9Storage<A,B,C,D,E,F,G,H,I> {
    return COWProduct9Storage<A,B,C,D,E,F,G,H,I>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  internal static func -=(
    lhs: inout COWProduct9Storage<A,B,C,D,E,F,G,H,I>,
    rhs: COWProduct9Storage<A,B,C,D,E,F,G,H,I>) {
    lhs.storage -= rhs.storage
  }
  

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct9Storage : VectorArithmetic
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
  internal var magnitudeSquared: Double {
    get {
      return self.storage.magnitudeSquared
    }
  }
  
  @inlinable
  internal func scale(by factor: Double) {
    self.storage.scale(by: factor)
  }
  
}

