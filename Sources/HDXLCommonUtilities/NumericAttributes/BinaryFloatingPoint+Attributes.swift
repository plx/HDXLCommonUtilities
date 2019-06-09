//
//  BinaryFloatingPoint+Attributes.swift
//

import Foundation

// ----------------------------------------------------------------------- //
// MARK: BinaryFloatingPoint - Non-Negative
// ----------------------------------------------------------------------- //

public extension BinaryFloatingPoint {
  
  /// Check if `self` is `>= 0.0`.
  @inlinable
  var isNonNegative: Bool {
    get {
      return self >= 0.0
    }
  }

  /// Check if `self` is finite *and* `>= 0.0`.
  @inlinable
  var isFiniteNonNegative: Bool {
    get {
      guard
        self.isFinite,
        self.isNonNegative else {
          return false
      }
      return true
    }
  }
  
}

// ----------------------------------------------------------------------- //
// MARK: BinaryFloatingPoint - Strictly Positive
// ----------------------------------------------------------------------- //

public extension BinaryFloatingPoint {

  /// Check if `self` is `> 0.0`.
  @inlinable
  var isStrictlyPositive: Bool {
    get {
      return self > 0.0
    }
  }

  /// Check if `self` is finite *and* `> 0.0`.
  @inlinable
  var isFiniteStrictlyPositive: Bool {
    get {
      guard
        self.isFinite,
        self.isStrictlyPositive else {
          return false
      }
      return true
    }
  }

}

// ----------------------------------------------------------------------- //
// MARK: BinaryFloatingPoint - Non-Positive
// ----------------------------------------------------------------------- //

public extension BinaryFloatingPoint {
  
  /// Check if `self` is`<= 0.0`.
  @inlinable
  var isNonPositive: Bool {
    get {
      return self <= 0.0
    }
  }
  
  /// Check if `self` is finite *and* `<= 0.0`.
  @inlinable
  var isFiniteNonPositive: Bool {
    get {
      guard
        self.isFinite,
        self.isNonPositive else {
          return false
      }
      return true
    }
  }
  
}

// ----------------------------------------------------------------------- //
// MARK: BinaryFloatingPoint - Strictly Negative
// ----------------------------------------------------------------------- //

public extension BinaryFloatingPoint {
  
  /// Check if `self` is`< 0.0`.
  @inlinable
  var isStrictlyNegative: Bool {
    get {
      return self < 0.0
    }
  }
  
  /// Check if `self` is finite *and* `< 0.0`.
  @inlinable
  var isFiniteStrictlyNegative: Bool {
    get {
      guard
        self.isFinite,
        self.isStrictlyNegative else {
          return false
      }
      return true
    }
  }
  
}
