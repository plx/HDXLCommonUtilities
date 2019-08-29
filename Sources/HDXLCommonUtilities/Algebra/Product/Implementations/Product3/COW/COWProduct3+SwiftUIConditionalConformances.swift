//
//  COWProduct3+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: COWProduct3 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct3 : AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic {
  
  @inlinable
  public static var zero: COWProduct3<A,B,C> {
    get {
      return COWProduct3<A,B,C>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  public static func +(
    lhs: COWProduct3<A,B,C>,
    rhs: COWProduct3<A,B,C>) -> COWProduct3<A,B,C> {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    return COWProduct3<A,B,C>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  public static func +=(
    lhs: inout COWProduct3<A,B,C>,
    rhs: COWProduct3<A,B,C>) {
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage += rhs.storage
    } else {
      lhs.storage = lhs.storage + rhs.storage
    }
  }
  
  @inlinable
  public static func -(
    lhs: COWProduct3<A,B,C>,
    rhs: COWProduct3<A,B,C>) -> COWProduct3<A,B,C> {
    return COWProduct3<A,B,C>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  public static func -=(
    lhs: inout COWProduct3<A,B,C>,
    rhs: COWProduct3<A,B,C>) {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage -= rhs.storage
    } else {
      lhs.storage = lhs.storage - rhs.storage
    }
  }

}
// -------------------------------------------------------------------------- //
// MARK: COWProduct3 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct3 : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic {
  
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
// MARK: COWProduct3Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct3Storage : AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic {
  
  @inlinable
  internal static var zero: COWProduct3Storage<A,B,C> {
    get {
      return COWProduct3Storage<A,B,C>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  internal static func +(
    lhs: COWProduct3Storage<A,B,C>,
    rhs: COWProduct3Storage<A,B,C>) -> COWProduct3Storage<A,B,C> {
    return COWProduct3Storage<A,B,C>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  internal static func +=(
    lhs: inout COWProduct3Storage<A,B,C>,
    rhs: COWProduct3Storage<A,B,C>) {
    lhs.storage += rhs.storage
  }
  
  @inlinable
  internal static func -(
    lhs: COWProduct3Storage<A,B,C>,
    rhs: COWProduct3Storage<A,B,C>) -> COWProduct3Storage<A,B,C> {
    return COWProduct3Storage<A,B,C>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  internal static func -=(
    lhs: inout COWProduct3Storage<A,B,C>,
    rhs: COWProduct3Storage<A,B,C>) {
    lhs.storage -= rhs.storage
  }
  

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct3Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct3Storage : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic {
  
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

