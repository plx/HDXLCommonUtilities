//
//  COWProduct4+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: COWProduct4 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct4 : AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic {
  
  @inlinable
  public static var zero: COWProduct4<A,B,C,D> {
    get {
      return COWProduct4<A,B,C,D>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  public static func +(
    lhs: COWProduct4<A,B,C,D>,
    rhs: COWProduct4<A,B,C,D>) -> COWProduct4<A,B,C,D> {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    return COWProduct4<A,B,C,D>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  public static func +=(
    lhs: inout COWProduct4<A,B,C,D>,
    rhs: COWProduct4<A,B,C,D>) {
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage += rhs.storage
    } else {
      lhs.storage = lhs.storage + rhs.storage
    }
  }
  
  @inlinable
  public static func -(
    lhs: COWProduct4<A,B,C,D>,
    rhs: COWProduct4<A,B,C,D>) -> COWProduct4<A,B,C,D> {
    return COWProduct4<A,B,C,D>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  public static func -=(
    lhs: inout COWProduct4<A,B,C,D>,
    rhs: COWProduct4<A,B,C,D>) {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage -= rhs.storage
    } else {
      lhs.storage = lhs.storage - rhs.storage
    }
  }

}
// -------------------------------------------------------------------------- //
// MARK: COWProduct4 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct4 : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic {
  
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
// MARK: COWProduct4Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct4Storage : AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic {
  
  @inlinable
  internal static var zero: COWProduct4Storage<A,B,C,D> {
    get {
      return COWProduct4Storage<A,B,C,D>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  internal static func +(
    lhs: COWProduct4Storage<A,B,C,D>,
    rhs: COWProduct4Storage<A,B,C,D>) -> COWProduct4Storage<A,B,C,D> {
    return COWProduct4Storage<A,B,C,D>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  internal static func +=(
    lhs: inout COWProduct4Storage<A,B,C,D>,
    rhs: COWProduct4Storage<A,B,C,D>) {
    lhs.storage += rhs.storage
  }
  
  @inlinable
  internal static func -(
    lhs: COWProduct4Storage<A,B,C,D>,
    rhs: COWProduct4Storage<A,B,C,D>) -> COWProduct4Storage<A,B,C,D> {
    return COWProduct4Storage<A,B,C,D>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  internal static func -=(
    lhs: inout COWProduct4Storage<A,B,C,D>,
    rhs: COWProduct4Storage<A,B,C,D>) {
    lhs.storage -= rhs.storage
  }
  

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct4Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct4Storage : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic {
  
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

