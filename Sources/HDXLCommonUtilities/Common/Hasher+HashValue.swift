//
//  Hasher+HashValue.swift
//

import Foundation

public extension Hasher {
  
  /// Utility to create, populate, and finalize a `Hasher` in a single-shot.
  ///
  /// Motivated in some (rare) cases where we can't override the `hash(into:)`
  /// method--either at all, or safely--and thus must rely upon the 
  @inlinable
  static func obtainHashValue(using mutation: (inout Hasher) -> Void) -> Int {
    var hasher = Hasher()
    mutation(&hasher)
    return hasher.finalize()
  }

}

