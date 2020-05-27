//
//  DispatchDiode.swift
//

import Foundation
import Dispatch

// -------------------------------------------------------------------------- //
// MARK: SyncDispatchDiode - Definition
// -------------------------------------------------------------------------- //

/// Wrapper around `DispatchQueue` presenting *only* the *synchronous* API.
///
/// The intent is to get the compiler to help enforce sync-only dispatch.
/// You don't always want/need that, but sometimes you do.
///
/// - note: The dispatch API is undocumented b/c it's copy-and-pasted from the underlying queue API (albeit with conveniences added for dispatch barriers).
/// - seealso: `AsyncDispatchDiode` for the *asynchronous equivalent.
///
@frozen
public struct SyncDispatchDiode {
  
  @usableFromInline
  internal var queue: DispatchQueue
  
  @inlinable
  internal init(queue: DispatchQueue) {
    self.queue = queue
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: SyncDispatchDiode - Definition
// -------------------------------------------------------------------------- //

public extension SyncDispatchDiode {
  
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

  @inlinable
  func sync(execute work: () -> Void) {
    dispatchPrecondition(condition: .notOnQueue(self.queue))
    self.queue.sync(execute: work)
  }

  @inlinable
  func sync(execute item: DispatchWorkItem) {
    dispatchPrecondition(condition: .notOnQueue(self.queue))
    self.queue.sync(execute: item)
  }

  @inlinable
  func sync<R>(execute work: () throws -> R) rethrows -> R {
    dispatchPrecondition(condition: .notOnQueue(self.queue))
    return try self.queue.sync(execute: work)
  }
  
  @inlinable
  func sync<R>(
    flags: DispatchWorkItemFlags,
    execute work: () throws -> R ) rethrows -> R {
    dispatchPrecondition(condition: .notOnQueue(self.queue))
    return try self.queue.sync(
      flags: flags,
      execute: work
    )
  }

  @inlinable
  func barrierSync(execute work: () -> Void) {
    dispatchPrecondition(condition: .notOnQueue(self.queue))
    self.queue.sync(
      flags: .barrier,
      execute: work
    )
  }

  @inlinable
  func barrierSync<R>(execute work: () throws -> R) rethrows -> R {
    dispatchPrecondition(condition: .notOnQueue(self.queue))
    return try self.queue.sync(
      flags: .barrier,
      execute: work
    )
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SyncDispatchDiode - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension SyncDispatchDiode : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "sync-only dispatch diode for: \(self.queue.description)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SyncDispatchDiode - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension SyncDispatchDiode : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "SyncDispatchDiode(queue: \(self.queue.debugDescription))"
    }
  }
  
}
