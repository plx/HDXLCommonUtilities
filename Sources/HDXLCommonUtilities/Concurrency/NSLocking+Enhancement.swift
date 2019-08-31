//
//  NSLocking+Enhancement.swift
//

import Foundation

public extension NSLocking {

  /// Performs non-throwing `work` while holding the lock `self`.
  ///
  /// - note: *Indirectly* tested by use in the *Synchronized*-family types in `HDXLTestingUtilities`.
  ///
  @inlinable
  func perform<R>(work: () -> R) -> R {
    self.lock()
    let result = work()
    self.unlock()
    return result
  }

  /// Performs possibly-throwing `work` while holding the lock `self`.
  ///
  /// - note: *Still* can't use the pattern below to implement a `rethrows`-style method.
  /// - note: *Indirectly* tested by use in the *Synchronized*-family types in `HDXLTestingUtilities`.
  ///
  @inlinable
  func tryPerform<R>(work: () throws -> R) throws -> R {
    var result: R? = nil
    var error: Error? = nil
    self.lock()
    do {
      result = try work()
    }
    catch let e {
      error = e
    }
    self.unlock()
    if let e = error {
      throw e
    } else if let r = result {
      return r
    } else {
      fatalError("Reached end of `withLock(perform:)` w/`nil` `result` and `nil` `error`!")
    }
  }
  
}
