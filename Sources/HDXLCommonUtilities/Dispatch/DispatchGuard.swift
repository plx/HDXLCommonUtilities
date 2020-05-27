//
//  DispatchGuard.swift
//

import Foundation
import Dispatch

// ------------------------------------------------------------------- //
// MARK: DispatchGuard - Definition
// ------------------------------------------------------------------- //

/// Wrapper type that (a) hides a queue and (b) re-exposes it as a pair
/// of diodes--one async, one sync. The concept, here, is to try and get
/// the type-checker to help enforce certain patterns (like "queue foo should
/// never perform synchronous dispatch to queue bar").
///
/// Not all queue uses fit that mold, but when you *do* have a pattern like that
/// it seems helpful to get help from the compiler.
///
/// - note: I consider these types experimental: they work, but their actual utility remains a bit TBD.
/// - note: I don't *like* the `*Diode` name, but haven't found a better name.
///
@frozen
public struct DispatchGuard {
  
  @usableFromInline
  internal let queue: DispatchQueue
  
  @inlinable
  public init(queue: DispatchQueue) {
    self.queue = queue
  }
  
}

// ------------------------------------------------------------------- //
// MARK: DispatchGuard - Diodes
// ------------------------------------------------------------------- //

public extension DispatchGuard {
  
  @inlinable
  func asyncDiode() -> AsyncDispatchDiode {
    return AsyncDispatchDiode(queue: self.queue)
  }
  
  @inlinable
  func syncDiode() -> SyncDispatchDiode {
    return SyncDispatchDiode(queue: self.queue)
  }
    
}

// ------------------------------------------------------------------- //
// MARK: DispatchGuard - Core API
// ------------------------------------------------------------------- //

public extension DispatchGuard {
  
  @inlinable
  var label: String {
    get {
      return self.queue.label
    }
  }
  
  @inlinable
  var qos: DispatchQoS {
    get {
      return self.queue.qos
    }
  }
  
  @inlinable
  func getSpecific<T>(key: DispatchSpecificKey<T>) -> T? {
    return self.queue.getSpecific(key: key)
  }
  
  @inlinable
  func setSpecific<T>(
    key: DispatchSpecificKey<T>,
    value: T?) {
    self.queue.setSpecific(
      key: key,
      value: value
    )
  }

}

// ------------------------------------------------------------------- //
// MARK: DispatchGuard - CustomStringConvertible
// ------------------------------------------------------------------- //

extension DispatchGuard : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "dispatch-guard for queue \(self.queue.description))"
    }
  }
  
}

// ------------------------------------------------------------------- //
// MARK: DispatchGuard - CustomDebugStringConvertible
// ------------------------------------------------------------------- //

extension DispatchGuard : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "DispatchGuard(queue: \(self.queue.debugDescription))"
    }
  }
  
}
