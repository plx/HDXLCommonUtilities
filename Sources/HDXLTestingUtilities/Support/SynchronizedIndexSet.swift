//
//  SynchronizedIndexSet.swift
//

import Foundation
import HDXLCommonUtilities
import os

public final class SynchronizedIndexSet {
  
  @usableFromInline
  internal var synchronizationLock: os_unfair_lock = os_unfair_lock()
  
  @inlinable
  internal var lock: os_unfair_lock_t {
    get {
      return UnsafeMutablePointer<os_unfair_lock>(&self.synchronizationLock)
    }
  }
  
  @usableFromInline
  internal var _indexSet: IndexSet = IndexSet()
  
  public let identifier: String
  
  @inlinable
  required init(identifier: String) {
    self.identifier = identifier
  }
  
  @inlinable
  public var currentIndexSet: IndexSet {
    get {
      return self.lock.perform() {
        [unowned self]
        () -> IndexSet
        in
        return self._indexSet
        // ^ maybe dangerous for concurrent read/write, but
        // fine for a lifecycle like:
        //
        // 1. birth
        // 2. concurrent, write-only updating
        // 3. serial, read-only verification
        //
        // ...which is why this is in `HDXLTestingUtilities` and not `HDXLCommonUtilities`.
      }
    }
  }
  
  @inlinable
  public func insert(index: Int) {
    self.lock.perform() {
      [unowned self]
      () -> Void
      in
      let _ = self._indexSet.insert(index)
    }
  }

  @inlinable
  public func insert(integersIn indices: Range<Int>) {
    self.lock.perform() {
      [unowned self]
      () -> Void
      in
      let _ = self._indexSet.insert(integersIn: indices)
    }
  }
  
}
