//
//  os_unfair_lock+Enhancement.swift
//

import Foundation
import os

public extension os_unfair_lock_t {

  /// Performs non-throwing `work` while holding the lock `self`.
  @inlinable
  func perform<R>(work: () -> R) -> R {
    os_unfair_lock_lock(self)
    let result = work()
    os_unfair_lock_unlock(self)
    return result
  }

  /// Performs possibly-throwing `work` while holding the lock `self`.
  ///
  /// - note: *Still* can't use the pattern below to implement a `rethrows`-style method.
  ///
  @inlinable
  func tryPerform<R>(work: () throws -> R) throws -> R {
    var result: R? = nil
    var error: Error? = nil
    os_unfair_lock_lock(self)
    do {
      result = try work()
    }
    catch let e {
      error = e
    }
    os_unfair_lock_unlock(self)
    if let e = error {
      throw e
    } else if let r = result {
      return r
    } else {
      fatalError("Reached end of `withLock(perform:)` w/`nil` `result` and `nil` `error`!")
    }
  }

  
}
