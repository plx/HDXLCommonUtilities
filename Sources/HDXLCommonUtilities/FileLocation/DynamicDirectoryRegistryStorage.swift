//
//  DynamicDirectoryRegistryStorage.swift
//

import Foundation
import os.log

@usableFromInline
internal final class DynamicDirectoryRegistryStorage {
  
  @usableFromInline
  internal typealias Identifier = String
  
  @usableFromInline
  internal var standardDynamicDirectoryLocation: DynamicDirectoryLocation
  
  @usableFromInline
  internal var customDynamicDirectoryLocations: [Identifier:DynamicDirectoryLocation]
  
  @inlinable
  internal init(
    standardDynamicDirectoryLocation: DynamicDirectoryLocation,
    customDynamicDirectoryLocations: [Identifier:DynamicDirectoryLocation]) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(standardDynamicDirectoryLocation.isValid)
    pedantic_assert(customDynamicDirectoryLocations.allValuesAreValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.standardDynamicDirectoryLocation = standardDynamicDirectoryLocation
    self.customDynamicDirectoryLocations = customDynamicDirectoryLocations
  }
    
}

internal extension DynamicDirectoryRegistryStorage {
  
  @inlinable
  func register(
    location: DynamicDirectoryLocation,
    forIdentifier identifier: Identifier) {
    self.customDynamicDirectoryLocations[identifier] = location
  }
  
  @inlinable
  func location(forIdentifier identifier: Identifier?) -> DynamicDirectoryLocation {
    guard let identifier = identifier else {
      return self.standardDynamicDirectoryLocation
    }
    return self.customDynamicDirectoryLocations[identifier] ?? self.standardDynamicDirectoryLocation
  }
  
  @inlinable
  func dynamicDirectoryLocationURL(forIdentifier identifier: Identifier?) -> URL {
    return self.location(forIdentifier: identifier).directoryLocationURL
  }
  
  @inlinable
  func ensure(
    customizedDynamicDirectoryLocations: [Identifier:DynamicDirectoryLocation]) {
    for (identifier,location) in customizedDynamicDirectoryLocations {
      if let existingLocation = self.customDynamicDirectoryLocations[identifier] {
        precondition(location == existingLocation)
      } else {
        self.customDynamicDirectoryLocations[identifier] = location
      }
    }
  }
  
}

extension DynamicDirectoryRegistryStorage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      guard
        self.standardDynamicDirectoryLocation.isValid,
        self.customDynamicDirectoryLocations.allValuesAreValid else {
          return false
      }
      return true
    }
  }
  
}
