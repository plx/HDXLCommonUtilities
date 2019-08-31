//
//  DispatchSynchronizedCounter.swift
//

import Foundation
import HDXLCommonUtilities
import Dispatch

public final class DispatchSynchronizedCounter {
  
  @usableFromInline
  internal let synchronizationQueue: DispatchQueue
  
  @usableFromInline
  internal var _count: Int = 0
  
  public let identifier: String
  
  @inlinable
  required init(identifier: String) {
    self.identifier = identifier
    self.synchronizationQueue = DispatchQueue(
      label: "com.hdxlproject.hdxltestingutilities.DispatchSynchronizedCounter('\(identifier)')",
      qos: .unspecified,
      attributes: .concurrent,
      autoreleaseFrequency: .inherit,
      target: nil
    )
  }
  
  @inlinable
  public var currentCount: Int {
    get {
      dispatchPrecondition(condition: .notOnQueue(self.synchronizationQueue))
      return self.synchronizationQueue.sync() {
        [unowned self]
        in
        return self._count
      }
    }
  }
  
  @inlinable
  public func incrementCount() {
    self.synchronizationQueue.async(flags: .barrier) {      
      [unowned self]
      in
      self._count += 1
    }
  }
  
}
