//
//  COWProduct7+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: COWProduct7 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct7 : AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic,
  E:AdditiveArithmetic,
  F:AdditiveArithmetic,
  G:AdditiveArithmetic {
  
  @inlinable
  public static var zero: COWProduct7<A,B,C,D,E,F,G> {
    get {
      return COWProduct7<A,B,C,D,E,F,G>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  public static func +(
    lhs: COWProduct7<A,B,C,D,E,F,G>,
    rhs: COWProduct7<A,B,C,D,E,F,G>) -> COWProduct7<A,B,C,D,E,F,G> {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    return COWProduct7<A,B,C,D,E,F,G>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  public static func +=(
    lhs: inout COWProduct7<A,B,C,D,E,F,G>,
    rhs: COWProduct7<A,B,C,D,E,F,G>) {
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage += rhs.storage
    } else {
      lhs.storage = lhs.storage + rhs.storage
    }
  }
  
  @inlinable
  public static func -(
    lhs: COWProduct7<A,B,C,D,E,F,G>,
    rhs: COWProduct7<A,B,C,D,E,F,G>) -> COWProduct7<A,B,C,D,E,F,G> {
    return COWProduct7<A,B,C,D,E,F,G>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  public static func -=(
    lhs: inout COWProduct7<A,B,C,D,E,F,G>,
    rhs: COWProduct7<A,B,C,D,E,F,G>) {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage -= rhs.storage
    } else {
      lhs.storage = lhs.storage - rhs.storage
    }
  }

}
// -------------------------------------------------------------------------- //
// MARK: COWProduct7 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct7 : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic,
  E:VectorArithmetic,
  F:VectorArithmetic,
  G:VectorArithmetic {
  
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
// MARK: COWProduct7Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct7Storage : AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic,
  E:AdditiveArithmetic,
  F:AdditiveArithmetic,
  G:AdditiveArithmetic {
  
  @inlinable
  internal static var zero: COWProduct7Storage<A,B,C,D,E,F,G> {
    get {
      return COWProduct7Storage<A,B,C,D,E,F,G>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  internal static func +(
    lhs: COWProduct7Storage<A,B,C,D,E,F,G>,
    rhs: COWProduct7Storage<A,B,C,D,E,F,G>) -> COWProduct7Storage<A,B,C,D,E,F,G> {
    return COWProduct7Storage<A,B,C,D,E,F,G>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  internal static func +=(
    lhs: inout COWProduct7Storage<A,B,C,D,E,F,G>,
    rhs: COWProduct7Storage<A,B,C,D,E,F,G>) {
    lhs.storage += rhs.storage
  }
  
  @inlinable
  internal static func -(
    lhs: COWProduct7Storage<A,B,C,D,E,F,G>,
    rhs: COWProduct7Storage<A,B,C,D,E,F,G>) -> COWProduct7Storage<A,B,C,D,E,F,G> {
    return COWProduct7Storage<A,B,C,D,E,F,G>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  internal static func -=(
    lhs: inout COWProduct7Storage<A,B,C,D,E,F,G>,
    rhs: COWProduct7Storage<A,B,C,D,E,F,G>) {
    lhs.storage -= rhs.storage
  }
  

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct7Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct7Storage : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic,
  E:VectorArithmetic,
  F:VectorArithmetic,
  G:VectorArithmetic {
  
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

