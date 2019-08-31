//
//  DynamicDirectoryRegistry.swift
//

import Foundation
import os.log

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryRegistry - Definition
// -------------------------------------------------------------------------- //

/// Object used to as a workaround for certain deficiencies in Apple APIs.
/// Motivated by `CoreData` design issues, but moved into common utilities in case
/// it proves more-widely useful.
///
/// Note that this is still a somewhat niche-purpose concept and it may only
/// make sense to you if you've hit the issues that motivated it.
public final class DynamicDirectoryRegistry {
  
  @usableFromInline
  internal let accessLog: OSLog
  
  @usableFromInline
  internal let accessLogLevel: OSLogType
  
  @usableFromInline
  internal lazy final var shouldLogAccess: Bool = self.accessLog.isEnabled(type: self.accessLogLevel)
  
  @usableFromInline
  internal let synchronizationQueue: DispatchQueue
  
  @usableFromInline
  internal typealias RegistryStorage = DynamicDirectoryRegistryStorage
  
  @usableFromInline
  internal var registries: [ObjectIdentifier:RegistryStorage]
  
  // TODO: process-level overrides, I think? Those go into `HDXLCommonUtilities`, though
  @inlinable
  internal required init(
    accessLog: OSLog = .filesystem,
    accessLogLevel: OSLogType = .debug) {
    self.accessLog = accessLog
    self.accessLogLevel = accessLogLevel
    self.synchronizationQueue = DispatchQueue(label: "DynamicDirectoryRegistry")
    self.registries = [:]
  }
  
  public static let `default`: DynamicDirectoryRegistry = DynamicDirectoryRegistry()
  
}

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryRegistry - Support
// -------------------------------------------------------------------------- //

public extension DynamicDirectoryRegistry {
  
  @inlinable
  func dynamicDirectoryLocationURL(
    type: AnyObject.Type,
    identifier: String? = nil,
    file: StaticString = #file,
    line: UInt = #line,
    method: StaticString = #function) -> URL? {
    dispatchPrecondition(condition: .notOnQueue(self.synchronizationQueue))
    let typeID = ObjectIdentifier(type)
    let result = self.synchronizationQueue.sync() {
      self.onqueue_dynamicDirectoryLocationURL(
        typeID: typeID,
        identifier: identifier
      )
    }
    if self.shouldLogAccess {
      os_log(
        "dynamicDirectoryLocationURL(type: %{public}@, identifier: %{public}@) => %{public}@, from %{public}@ in %{public}@ at line %{public}llu",
        log: self.accessLog,
        type: self.accessLogLevel,
        String(reflecting: type),
        (identifier ?? "`nil`"),
        (result?.absoluteString ?? "`nil`"),
        "\(method)",
        "\(file)",
        line
      )
    }
    return result
  }
  
  @inlinable
  internal func onqueue_dynamicDirectoryLocationURL(
    typeID: ObjectIdentifier,
    identifier: String?) -> URL? {
    dispatchPrecondition(condition: .onQueue(self.synchronizationQueue))
    guard let registry = self.registries[typeID] else {
      return nil
    }
    return registry.dynamicDirectoryLocationURL(
      forIdentifier: identifier
    )
  }
  
  @inlinable
  func registerDynamicDirectoryLocation(
    dynamicDirectoryLocation: DynamicDirectoryLocation,
    forType type: AnyObject.Type,
    customizedLocations: [String:DynamicDirectoryLocation]? = nil,
    file: StaticString = #file,
    line: UInt = #line,
    method: StaticString = #function) {
    dispatchPrecondition(condition: .notOnQueue(self.synchronizationQueue))
    let typeID = ObjectIdentifier(type)
    if self.shouldLogAccess {
      os_log(
        "registerDynamicDirectoryLocation(dynamicDirectoryLocation: %{public}@, forType: %{public}@, customizedLocations: %{public}@) from %{public}@ in %{public}@ at line %{public}llu",
        log: self.accessLog,
        type: self.accessLogLevel,
        dynamicDirectoryLocation.debugDescription,
        String(reflecting: type),
        (customizedLocations?.debugDescription ?? "`nil`"),
        "\(method)",
        "\(file)",
        line
      )
    }
    self.synchronizationQueue.async {
      self.onqueue_registerDynamicDirectoryLocation(
        dynamicDirectoryLocation: dynamicDirectoryLocation,
        forTypeID: typeID,
        customizedLocations: customizedLocations
      )
    }
  }

  @inlinable
  internal func onqueue_registerDynamicDirectoryLocation(
    dynamicDirectoryLocation: DynamicDirectoryLocation,
    forTypeID typeID: ObjectIdentifier,
    customizedLocations: [String:DynamicDirectoryLocation]? = nil) {
    dispatchPrecondition(condition: .onQueue(self.synchronizationQueue))
    self.registries[typeID] = RegistryStorage(
      standardDynamicDirectoryLocation: dynamicDirectoryLocation,
      customDynamicDirectoryLocations: customizedLocations ?? [:]
    )
  }

  @inlinable
  func ensureRegistration(
    dynamicDirectoryLocation: DynamicDirectoryLocation,
    forType type: AnyObject.Type,
    customizedLocations: [String:DynamicDirectoryLocation]? = nil,
    file: StaticString = #file,
    line: UInt = #line,
    method: StaticString = #function) {
    dispatchPrecondition(condition: .notOnQueue(self.synchronizationQueue))
    let typeID = ObjectIdentifier(type)
    if self.shouldLogAccess {
      os_log(
        "ensureRegistration(dynamicDirectoryLocation: %{public}@, forType: %{public}@, customizedLocations: %{public}@) from %{public}@ in %{public}@ at line %{public}llu",
        log: self.accessLog,
        type: self.accessLogLevel,
        dynamicDirectoryLocation.debugDescription,
        String(reflecting: type),
        (customizedLocations?.debugDescription ?? "`nil`"),
        "\(method)",
        "\(file)",
        line
      )
    }
    self.synchronizationQueue.async {
      self.onqueue_ensureRegistration(
        dynamicDirectoryLocation: dynamicDirectoryLocation,
        forTypeID: typeID,
        customizedLocations: customizedLocations
      )
    }
  }

  @inlinable
  internal func onqueue_ensureRegistration(
    dynamicDirectoryLocation: DynamicDirectoryLocation,
    forTypeID typeID: ObjectIdentifier,
    customizedLocations: [String:DynamicDirectoryLocation]? = nil) {
    dispatchPrecondition(condition: .onQueue(self.synchronizationQueue))
    if let existingRegistration = self.registries[typeID] {
      precondition(existingRegistration.standardDynamicDirectoryLocation == dynamicDirectoryLocation)
      if let locations = customizedLocations {
        existingRegistration.ensure(
          customizedDynamicDirectoryLocations: locations
        )
      }
    } else {
      self.registries[typeID] = RegistryStorage(
        standardDynamicDirectoryLocation: dynamicDirectoryLocation,
        customDynamicDirectoryLocations: customizedLocations ?? [:]
      )
    }
  }

}
