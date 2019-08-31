//
//  FileManager+DirectorySearchParameters.swift
//

import Foundation

public extension FileManager {

  /// Retrieves the directory for `parameters`, without attempting to create it if necessary.
  ///
  /// - note: The `appropriateFor:` argument is very, very niche and thus I don't include it in this API.
  ///
  @inlinable
  func existingDirectoryURL(
    forSearchParameters parameters: DirectorySearchParameters) throws -> URL {
    return try self.directoryURL(
      forSearchParameters: parameters,
      createIfNecessary: false
    )
  }

  /// Retrieves the directory for `parameters`, attempting to create it if necessary.
  ///
  /// - note: The `appropriateFor:` argument is very, very niche and thus I don't include it in this API.
  ///
  @inlinable
  func ensuredDirectoryURL(
    forSearchParameters parameters: DirectorySearchParameters) throws -> URL {
    return try self.directoryURL(
      forSearchParameters: parameters,
      createIfNecessary: true
    )
  }

  /// Retrieves the directory for `parameters` using the indicated creation preference.
  ///
  /// - note: The `appropriateFor:` argument is very, very niche and thus I don't include it in this API.
  ///
  @inlinable
  func directoryURL(
    forSearchParameters parameters: DirectorySearchParameters,
    createIfNecessary create: Bool) throws -> URL {
    return try self.url(
      for: parameters.directory,
      in: parameters.mask,
      appropriateFor: nil,
      create: create
    )
  }
  
}
