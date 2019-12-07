//
//  NSLocking+Enhancement.swift
//

import Foundation

public extension NSLocking {

  /// Performs non-throwing `work` while holding the lock `self`.
  ///
  /// - note: *Indirectly* tested by use in the *Synchronized*-family types in `HDXLTestingUtilities`.
  ///
  @inlinable @inline(__always)
  func perform<R>(work: () throws -> R) rethrows -> R {
    self.lock()
    defer { self.unlock() }
    return try work()
  }
  
}
