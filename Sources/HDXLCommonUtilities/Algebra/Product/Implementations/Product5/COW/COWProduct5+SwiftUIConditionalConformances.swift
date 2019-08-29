//
//  COWProduct5+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: COWProduct5 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct5 : AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic,
  E:AdditiveArithmetic {
  
  @inlinable
  public static var zero: COWProduct5<A,B,C,D,E> {
    get {
      return COWProduct5<A,B,C,D,E>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  public static func +(
    lhs: COWProduct5<A,B,C,D,E>,
    rhs: COWProduct5<A,B,C,D,E>) -> COWProduct5<A,B,C,D,E> {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    return COWProduct5<A,B,C,D,E>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  public static func +=(
    lhs: inout COWProduct5<A,B,C,D,E>,
    rhs: COWProduct5<A,B,C,D,E>) {
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage += rhs.storage
    } else {
      lhs.storage = lhs.storage + rhs.storage
    }
  }
  
  @inlinable
  public static func -(
    lhs: COWProduct5<A,B,C,D,E>,
    rhs: COWProduct5<A,B,C,D,E>) -> COWProduct5<A,B,C,D,E> {
    return COWProduct5<A,B,C,D,E>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  public static func -=(
    lhs: inout COWProduct5<A,B,C,D,E>,
    rhs: COWProduct5<A,B,C,D,E>) {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage -= rhs.storage
    } else {
      lhs.storage = lhs.storage - rhs.storage
    }
  }

}
// -------------------------------------------------------------------------- //
// MARK: COWProduct5 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct5 : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic,
  E:VectorArithmetic {
  
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
// MARK: COWProduct5Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct5Storage : AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic,
  E:AdditiveArithmetic {
  
  @inlinable
  internal static var zero: COWProduct5Storage<A,B,C,D,E> {
    get {
      return COWProduct5Storage<A,B,C,D,E>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  internal static func +(
    lhs: COWProduct5Storage<A,B,C,D,E>,
    rhs: COWProduct5Storage<A,B,C,D,E>) -> COWProduct5Storage<A,B,C,D,E> {
    return COWProduct5Storage<A,B,C,D,E>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  internal static func +=(
    lhs: inout COWProduct5Storage<A,B,C,D,E>,
    rhs: COWProduct5Storage<A,B,C,D,E>) {
    lhs.storage += rhs.storage
  }
  
  @inlinable
  internal static func -(
    lhs: COWProduct5Storage<A,B,C,D,E>,
    rhs: COWProduct5Storage<A,B,C,D,E>) -> COWProduct5Storage<A,B,C,D,E> {
    return COWProduct5Storage<A,B,C,D,E>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  internal static func -=(
    lhs: inout COWProduct5Storage<A,B,C,D,E>,
    rhs: COWProduct5Storage<A,B,C,D,E>) {
    lhs.storage -= rhs.storage
  }
  

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct5Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct5Storage : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic,
  E:VectorArithmetic {
  
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

