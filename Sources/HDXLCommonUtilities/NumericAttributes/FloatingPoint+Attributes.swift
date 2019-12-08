//
//  FloatingPoint+Attributes.swift
//

import Foundation

// ----------------------------------------------------------------------- //
// MARK: FloatingPoint - Non-Zero
// ----------------------------------------------------------------------- //

public extension FloatingPoint {
  
  /// Check if `self` is `!= 0.0`
  @inlinable
  var isNonZero: Bool {
    get {
      return !self.isZero
    }
  }
  
  /// Check if `self` is finite and `!= 0.0`
  @inlinable
  var isFiniteNonZero: Bool {
    get {
      guard
        self.isFinite,
        self.isNonZero else {
          return false
      }
      return true
    }
  }
  
}

// ----------------------------------------------------------------------- //
// MARK: FloatingPoint - Non-Negative
// ----------------------------------------------------------------------- //

public extension FloatingPoint {
  
  /// Check if `self` is `>= 0.0`.
  @inlinable
  var isNonNegative: Bool {
    get {
      return self >= 0
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
// MARK: FloatingPoint - Strictly Positive
// ----------------------------------------------------------------------- //

public extension FloatingPoint {

  /// Check if `self` is `> 0.0`.
  @inlinable
  var isStrictlyPositive: Bool {
    get {
      return self > 0
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
// MARK: FloatingPoint - Non-Positive
// ----------------------------------------------------------------------- //

public extension FloatingPoint {
  
  /// Check if `self` is`<= 0.0`.
  @inlinable
  var isNonPositive: Bool {
    get {
      return self <= 0
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
// MARK: FloatingPoint - Strictly Negative
// ----------------------------------------------------------------------- //

public extension FloatingPoint {
  
  /// Check if `self` is`< 0.0`.
  @inlinable
  var isStrictlyNegative: Bool {
    get {
      return self < 0
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

// ----------------------------------------------------------------------- //
// MARK: FloatingPoint - Unit Interval
// ----------------------------------------------------------------------- //

public extension FloatingPoint {
  
  @inlinable
  var isWithinUnitInterval: Bool {
    get {
      return 0 <= self && self <= 1
    }
  }
  
  @inlinable
  var isStrictlyWithinUnitInterval: Bool {
    get {
      return 0 < self && self < 1
    }
  }
  
  @inlinable
  var clippedToUnitInterval: Self {
    get {
      guard 0 <= self else {
        return 0
      }
      guard self <= 1 else {
        return 1
      }
      return self
    }
  }
  
  @inlinable
  var clampedToUnitInterval: Self {
    get {
      return self.clippedToUnitInterval
    }
  }
  
}

// ----------------------------------------------------------------------- //
// MARK: FloatingPoint - Symmetric Unit Interval
// ----------------------------------------------------------------------- //

public extension FloatingPoint {
  
  @inlinable
  var isWithinSymmetricUnitInterval: Bool {
    get {
      return -1 <= self && self <= 1
    }
  }
  
  @inlinable
  var isStrictlyWithinSymmetricUnitInterval: Bool {
    get {
      return -1 < self && self < 1
    }
  }
  
  @inlinable
  var clippedToSymmetricUnitInterval: Self {
    get {
      guard -1 <= self else {
        return -1
      }
      guard self <= 1 else {
        return 1
      }
      return self
    }
  }
  
  @inlinable
  var clampedToSymmetricUnitInterval: Self {
    get {
      return self.clippedToSymmetricUnitInterval
    }
  }
  
}

// ----------------------------------------------------------------------- //
// MARK: FloatingPoint - Positive Unit Interval
// ----------------------------------------------------------------------- //

public extension FloatingPoint {
  
  @inlinable
  var isWithinPositiveUnitInterval: Bool {
    get {
      return 0 <= self && self <= 1
    }
  }
  
  @inlinable
  var isStrictlyWithinPositiveUnitInterval: Bool {
    get {
      return 0 < self && self < 1
    }
  }
  
  @inlinable
  var clippedToPositiveUnitInterval: Self {
    get {
      guard 0 <= self else {
        return 0
      }
      guard self <= 1 else {
        return 1
      }
      return self
    }
  }
  
  @inlinable
  var clampedToPositiveUnitInterval: Self {
    get {
      return self.clippedToPositiveUnitInterval
    }
  }
  
}

// ----------------------------------------------------------------------- //
// MARK: FloatingPoint - Negative Unit Interval
// ----------------------------------------------------------------------- //

public extension FloatingPoint {
  
  @inlinable
  var isWithinNegativeUnitInterval: Bool {
    get {
      return -1 <= self && self <= 0
    }
  }
  
  @inlinable
  var isStrictlyWithinNegativeUnitInterval: Bool {
    get {
      return -1 < self && self < 0
    }
  }
  
  @inlinable
  var clippedToNegativeUnitInterval: Self {
    get {
      guard -1 <= self else {
        return -1
      }
      guard self <= 0 else {
        return 0
      }
      return self
    }
  }
  
  @inlinable
  var clampedToNegativeUnitInterval: Self {
    get {
      return self.clippedToNegativeUnitInterval
    }
  }
  
}
