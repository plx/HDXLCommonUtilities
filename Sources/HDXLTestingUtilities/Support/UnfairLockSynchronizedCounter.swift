//
//  UnfairLockSynchronizedCounter.swift
//

import Foundation
import HDXLCommonUtilities
import os

public final class UnfairLockSynchronizedCounter {
  
  @usableFromInline
  internal var synchronizationLock: os_unfair_lock = os_unfair_lock()
  
  @inlinable
  internal var lock: os_unfair_lock_t {
    get {
      return UnsafeMutablePointer<os_unfair_lock>(&self.synchronizationLock)
    }
  }
  
  @usableFromInline
  internal var _count: Int = 0
  
  public let identifier: String
  
  @inlinable
  required init(identifier: String) {
    self.identifier = identifier
  }
  
  @inlinable
  public var currentCount: Int {
    get {
      return self.lock.perform() {
        [unowned self]
        in
        return self._count
      }
    }
  }
  
  @inlinable
  public func incrementCount() {
    self.lock.perform() {
      [unowned self]
      in
      self._count += 1
    }
  }
  
}
