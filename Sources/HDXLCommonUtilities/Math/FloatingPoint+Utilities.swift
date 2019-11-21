//
//  FloatingPoint+Utilities.swift
//

import Foundation
import Numerics

public extension FloatingPoint {
  
  /// Defined *solely* for use with `Complex` wherein infinity, -infinity, and nan all get identified.
  @inlinable
  internal static func absoluteDistanceForComplex(
    from x: Self,
    to y: Self) -> Self {
    switch (x.isFinite,y.isFinite) {
    case (true, true):
      return y - x
    case (true, false):
      return .infinity
    case (false, true):
      return .infinity
    case (false, false):
      return 0
    }
  }

  
}
