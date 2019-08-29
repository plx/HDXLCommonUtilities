//
//  COWProduct2+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: COWProduct2 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct2 : AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic {
  
  @inlinable
  public static var zero: COWProduct2<A,B> {
    get {
      return COWProduct2<A,B>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  public static func +(
    lhs: COWProduct2<A,B>,
    rhs: COWProduct2<A,B>) -> COWProduct2<A,B> {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    return COWProduct2<A,B>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  public static func +=(
    lhs: inout COWProduct2<A,B>,
    rhs: COWProduct2<A,B>) {
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage += rhs.storage
    } else {
      lhs.storage = lhs.storage + rhs.storage
    }
  }
  
  @inlinable
  public static func -(
    lhs: COWProduct2<A,B>,
    rhs: COWProduct2<A,B>) -> COWProduct2<A,B> {
    return COWProduct2<A,B>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  public static func -=(
    lhs: inout COWProduct2<A,B>,
    rhs: COWProduct2<A,B>) {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage -= rhs.storage
    } else {
      lhs.storage = lhs.storage - rhs.storage
    }
  }

}
// -------------------------------------------------------------------------- //
// MARK: COWProduct2 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct2 : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic {
  
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
// MARK: COWProduct2Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct2Storage : AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic {
  
  @inlinable
  internal static var zero: COWProduct2Storage<A,B> {
    get {
      return COWProduct2Storage<A,B>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  internal static func +(
    lhs: COWProduct2Storage<A,B>,
    rhs: COWProduct2Storage<A,B>) -> COWProduct2Storage<A,B> {
    return COWProduct2Storage<A,B>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  internal static func +=(
    lhs: inout COWProduct2Storage<A,B>,
    rhs: COWProduct2Storage<A,B>) {
    lhs.storage += rhs.storage
  }
  
  @inlinable
  internal static func -(
    lhs: COWProduct2Storage<A,B>,
    rhs: COWProduct2Storage<A,B>) -> COWProduct2Storage<A,B> {
    return COWProduct2Storage<A,B>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  internal static func -=(
    lhs: inout COWProduct2Storage<A,B>,
    rhs: COWProduct2Storage<A,B>) {
    lhs.storage -= rhs.storage
  }
  

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct2Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct2Storage : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic {
  
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

