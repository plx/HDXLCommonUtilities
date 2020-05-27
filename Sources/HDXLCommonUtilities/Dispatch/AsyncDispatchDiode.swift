//
//  AsyncDispatchDiode.swift
//

import Foundation
import Dispatch

// -------------------------------------------------------------------------- //
// MARK: AsyncDispatchDiode - Definition
// -------------------------------------------------------------------------- //

/// Wrapper around `DispatchQueue` presenting *only* the *asynchronous* API.
///
/// The intent is to get the compiler to help enforce async-only dispatch.
/// You don't always want/need that, but sometimes you do.
///
/// - note: The dispatch API is undocumented b/c it's copy-and-pasted from the underlying queue API (albeit with conveniences added for dispatch barriers). 
/// - seealso: `SyncDispatchDiode` for the *synchronous equivalent.
///
@frozen
public struct AsyncDispatchDiode {
  
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

public extension AsyncDispatchDiode {
  
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
  func async(execute work: @escaping () -> Void) {
    self.queue.async(execute: work)
  }
  
  @inlinable
  func async(execute item: DispatchWorkItem) {
    self.queue.async(execute: item)
  }
  
  @inlinable
  func async(group: DispatchGroup, execute item: DispatchWorkItem) {
    self.queue.async(
      group: group,
      execute: item
    )
  }
  
  @inlinable
  func barrierAsync(execute work: @escaping () -> Void) {
    self.queue.async(
      group: nil,
      flags: .barrier,
      execute: work
    )
  }

  @inlinable
  func async(
    group: DispatchGroup? = nil,
    qos: DispatchQoS = .unspecified,
    flags: DispatchWorkItemFlags = [],
    execute work: @escaping @convention(block) () -> Void) {
    self.queue.async(
      group: group,
      qos: qos,
      flags: flags,
      execute: work
    )
  }
  
  @inlinable
  func asyncAfter(
    deadline: DispatchTime,
    qos: DispatchQoS = .unspecified,
    flags: DispatchWorkItemFlags = [],
    execute work: @escaping @convention(block) () -> Void) {
    self.queue.asyncAfter(
      deadline: deadline,
      qos: qos,
      flags: flags,
      execute: work
    )
  }

  @inlinable
  func asyncAfter(
    wallDeadline: DispatchWallTime,
    qos: DispatchQoS = .unspecified,
    flags: DispatchWorkItemFlags = [],
    execute work: @escaping @convention(block) () -> Void) {
    self.queue.asyncAfter(
      wallDeadline: wallDeadline,
      qos: qos,
      flags: flags,
      execute: work
    )
  }
  
  @inlinable
  func asyncAfter(
    deadline: DispatchTime,
    execute: DispatchWorkItem) {
    self.queue.asyncAfter(
      deadline: deadline,
      execute: execute
    )
  }

  @inlinable
  func asyncAfter(
    wallDeadline: DispatchWallTime,
    execute: DispatchWorkItem) {
    self.queue.asyncAfter(
      wallDeadline: wallDeadline,
      execute: execute
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: AsyncDispatchDiode - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension AsyncDispatchDiode : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "async-only dispatch diode for: \(self.queue.description)"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: SyncDispatchDiode - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension AsyncDispatchDiode : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "AsyncDispatchDiode(queue: \(self.queue.debugDescription))"
    }
  }
  
}
