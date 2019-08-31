//
//  URL+DirectoryPath.swift
//

import Foundation

public extension URL {
  
  /// Appends the supplied directory path to `self`.
  ///
  /// - parameter directoryPath: The first directory path to append to `self`.
  ///
  @inlinable
  mutating func appendPathComponents(_ directoryPath: DirectoryPath) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(directoryPath.isValid)
    pedantic_assert(self.isFileURL)
    pedantic_assert(self.hasDirectoryPath)
    // /////////////////////////////////////////////////////////////////////////
    for component in directoryPath.storage {
      self.appendPathComponent(component)
    }
  }

  /// Appends the supplied directory paths to `self`.
  ///
  /// - parameter directoryPath1: The first directory path to append to `self` (added *first*).
  /// - parameter directoryPath2: The second directory path to append to `self` (added *second*).
  ///
  /// - note: Special case for two successive `DirectoryPath` arguments b/c that's within the internals of `DynamicDirectoryLocation`.
  ///
  @inlinable
  mutating func appendPathComponents(
    _ directoryPath1: DirectoryPath,
    _ directoryPath2: DirectoryPath) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(directoryPath1.isValid)
    pedantic_assert(directoryPath2.isValid)
    pedantic_assert(self.isFileURL)
    pedantic_assert(self.hasDirectoryPath)
    // /////////////////////////////////////////////////////////////////////////
    for component in ChainCollection(directoryPath1.storage, directoryPath2.storage) {
      self.appendPathComponent(component)
    }
  }

  /// Appends the `DirectoryPaths` in `directoryPaths` to `self`.
  ///
  /// - parameter directoryPaths: The paths to append to `self`
  ///
  @inlinable
  mutating func appendPathComponents<S>(
    _ directoryPaths: S)
    where
    S:Sequence,
    S.Element == DirectoryPath {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.isFileURL)
    pedantic_assert(self.hasDirectoryPath)
    // /////////////////////////////////////////////////////////////////////////
    for directoryPath in directoryPaths {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(directoryPath.isValid)
      // ///////////////////////////////////////////////////////////////////////
      self.appendPathComponents(directoryPath)
    }
  }

  /// Appends the supplied directory path to `self`.
  ///
  /// - parameter directoryPath: The first directory path to append to `self`.
  ///
  /// - returns: `self` with the components of the arguments appended to its path.
  ///
  @inlinable
  func appendingPathComponents(_ directoryPath: DirectoryPath) -> URL {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(directoryPath.isValid)
    pedantic_assert(self.isFileURL)
    pedantic_assert(self.hasDirectoryPath)
    // /////////////////////////////////////////////////////////////////////////
    var result = self
    result.appendPathComponents(directoryPath)
    return result
  }

  /// Appends the supplied directory paths to `self`.
  ///
  /// - parameter directoryPath1: The first directory path to append to `self`.
  /// - parameter directoryPath2: The second directory path to append to `self`.
  ///
  /// - returns: `self` with the components of the arguments appended to its path.
  ///
  /// - note: Special case for two successive `DirectoryPath` arguments b/c that's within the internals of `DynamicDirectoryLocation`.
  ///
  @inlinable
  func appendingPathComponents(
    _ directoryPath1: DirectoryPath,
    _ directoryPath2: DirectoryPath) -> URL {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(directoryPath1.isValid)
    pedantic_assert(directoryPath2.isValid)
    pedantic_assert(self.isFileURL)
    pedantic_assert(self.hasDirectoryPath)
    // /////////////////////////////////////////////////////////////////////////
    var result = self
    result.appendPathComponents(
      directoryPath1,
      directoryPath2
    )
    return result
  }

  /// Returns the result of appending all `DirectPath`s in `directoryPaths` to `self`.
  @inlinable
  func appendingPathComponents<S>(_ directoryPaths: S) -> URL
    where
    S:Sequence,
    S.Element == DirectoryPath {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(self.isFileURL)
      pedantic_assert(self.hasDirectoryPath)
      // ///////////////////////////////////////////////////////////////////////
      var result = self
      result.appendPathComponents(directoryPaths)
      return result
  }

}
