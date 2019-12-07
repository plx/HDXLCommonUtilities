//
//  os_unfair_lock+Enhancement.swift
//

import Foundation
import os

public extension os_unfair_lock {
  
  /// Performs non-throwing `work` while holding the lock `self`.
  ///
  /// - todo: Consider renaming -> `sync(work:)`.
  ///
  @inlinable @inline(__always)
  mutating func perform<R>(work: () throws -> R) rethrows -> R {
    #if HEAVY_DEBUG
    os_unfair_lock_assert_not_owner(&self)
    #endif
    os_unfair_lock_lock(&self)
    defer {
      os_unfair_lock_unlock(&self)
      #if HEAVY_DEBUG
      os_unfair_lock_assert_not_owner(&self)
      #endif
    }
    #if HEAVY_DEBUG
    os_unfair_lock_assert_owner(&self)
    #endif
    return try work()
  }
  
}

