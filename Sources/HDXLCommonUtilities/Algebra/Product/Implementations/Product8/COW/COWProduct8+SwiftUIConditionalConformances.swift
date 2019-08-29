//
//  COWProduct8+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: COWProduct8 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct8 : AdditiveArithmetic
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
  public static var zero: COWProduct8<A,B,C,D,E,F,G,H> {
    get {
      return COWProduct8<A,B,C,D,E,F,G,H>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  public static func +(
    lhs: COWProduct8<A,B,C,D,E,F,G,H>,
    rhs: COWProduct8<A,B,C,D,E,F,G,H>) -> COWProduct8<A,B,C,D,E,F,G,H> {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    return COWProduct8<A,B,C,D,E,F,G,H>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  public static func +=(
    lhs: inout COWProduct8<A,B,C,D,E,F,G,H>,
    rhs: COWProduct8<A,B,C,D,E,F,G,H>) {
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage += rhs.storage
    } else {
      lhs.storage = lhs.storage + rhs.storage
    }
  }
  
  @inlinable
  public static func -(
    lhs: COWProduct8<A,B,C,D,E,F,G,H>,
    rhs: COWProduct8<A,B,C,D,E,F,G,H>) -> COWProduct8<A,B,C,D,E,F,G,H> {
    return COWProduct8<A,B,C,D,E,F,G,H>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  public static func -=(
    lhs: inout COWProduct8<A,B,C,D,E,F,G,H>,
    rhs: COWProduct8<A,B,C,D,E,F,G,H>) {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage -= rhs.storage
    } else {
      lhs.storage = lhs.storage - rhs.storage
    }
  }

}
// -------------------------------------------------------------------------- //
// MARK: COWProduct8 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct8 : VectorArithmetic
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
// MARK: COWProduct8Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct8Storage : AdditiveArithmetic
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
  internal static var zero: COWProduct8Storage<A,B,C,D,E,F,G,H> {
    get {
      return COWProduct8Storage<A,B,C,D,E,F,G,H>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  internal static func +(
    lhs: COWProduct8Storage<A,B,C,D,E,F,G,H>,
    rhs: COWProduct8Storage<A,B,C,D,E,F,G,H>) -> COWProduct8Storage<A,B,C,D,E,F,G,H> {
    return COWProduct8Storage<A,B,C,D,E,F,G,H>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  internal static func +=(
    lhs: inout COWProduct8Storage<A,B,C,D,E,F,G,H>,
    rhs: COWProduct8Storage<A,B,C,D,E,F,G,H>) {
    lhs.storage += rhs.storage
  }
  
  @inlinable
  internal static func -(
    lhs: COWProduct8Storage<A,B,C,D,E,F,G,H>,
    rhs: COWProduct8Storage<A,B,C,D,E,F,G,H>) -> COWProduct8Storage<A,B,C,D,E,F,G,H> {
    return COWProduct8Storage<A,B,C,D,E,F,G,H>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  internal static func -=(
    lhs: inout COWProduct8Storage<A,B,C,D,E,F,G,H>,
    rhs: COWProduct8Storage<A,B,C,D,E,F,G,H>) {
    lhs.storage -= rhs.storage
  }
  

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct8Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct8Storage : VectorArithmetic
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

