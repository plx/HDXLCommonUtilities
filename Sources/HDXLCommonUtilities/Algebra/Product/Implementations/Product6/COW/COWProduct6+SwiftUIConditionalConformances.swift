//
//  COWProduct6+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: COWProduct6 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct6 : AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic,
  E:AdditiveArithmetic,
  F:AdditiveArithmetic {
  
  @inlinable
  public static var zero: COWProduct6<A,B,C,D,E,F> {
    get {
      return COWProduct6<A,B,C,D,E,F>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  public static func +(
    lhs: COWProduct6<A,B,C,D,E,F>,
    rhs: COWProduct6<A,B,C,D,E,F>) -> COWProduct6<A,B,C,D,E,F> {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    return COWProduct6<A,B,C,D,E,F>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  public static func +=(
    lhs: inout COWProduct6<A,B,C,D,E,F>,
    rhs: COWProduct6<A,B,C,D,E,F>) {
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage += rhs.storage
    } else {
      lhs.storage = lhs.storage + rhs.storage
    }
  }
  
  @inlinable
  public static func -(
    lhs: COWProduct6<A,B,C,D,E,F>,
    rhs: COWProduct6<A,B,C,D,E,F>) -> COWProduct6<A,B,C,D,E,F> {
    return COWProduct6<A,B,C,D,E,F>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  public static func -=(
    lhs: inout COWProduct6<A,B,C,D,E,F>,
    rhs: COWProduct6<A,B,C,D,E,F>) {
    // TODO: check if either is zero and avoid allocation when so? maybe not worth it
    if isKnownUniquelyReferenced(&lhs.storage) {
      lhs.storage -= rhs.storage
    } else {
      lhs.storage = lhs.storage - rhs.storage
    }
  }

}
// -------------------------------------------------------------------------- //
// MARK: COWProduct6 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct6 : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic,
  E:VectorArithmetic,
  F:VectorArithmetic {
  
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
// MARK: COWProduct6Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct6Storage : AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic,
  E:AdditiveArithmetic,
  F:AdditiveArithmetic {
  
  @inlinable
  internal static var zero: COWProduct6Storage<A,B,C,D,E,F> {
    get {
      return COWProduct6Storage<A,B,C,D,E,F>(
        storage: Storage.zero
      )
    }
  }
  
  @inlinable
  internal static func +(
    lhs: COWProduct6Storage<A,B,C,D,E,F>,
    rhs: COWProduct6Storage<A,B,C,D,E,F>) -> COWProduct6Storage<A,B,C,D,E,F> {
    return COWProduct6Storage<A,B,C,D,E,F>(
      storage: lhs.storage + rhs.storage
    )
  }
  
  @inlinable
  internal static func +=(
    lhs: inout COWProduct6Storage<A,B,C,D,E,F>,
    rhs: COWProduct6Storage<A,B,C,D,E,F>) {
    lhs.storage += rhs.storage
  }
  
  @inlinable
  internal static func -(
    lhs: COWProduct6Storage<A,B,C,D,E,F>,
    rhs: COWProduct6Storage<A,B,C,D,E,F>) -> COWProduct6Storage<A,B,C,D,E,F> {
    return COWProduct6Storage<A,B,C,D,E,F>(
      storage: lhs.storage - rhs.storage
    )
  }
  
  @inlinable
  internal static func -=(
    lhs: inout COWProduct6Storage<A,B,C,D,E,F>,
    rhs: COWProduct6Storage<A,B,C,D,E,F>) {
    lhs.storage -= rhs.storage
  }
  

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct6Storage - VectorArithmetic
// -------------------------------------------------------------------------- //

extension COWProduct6Storage : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic,
  E:VectorArithmetic,
  F:VectorArithmetic {
  
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

