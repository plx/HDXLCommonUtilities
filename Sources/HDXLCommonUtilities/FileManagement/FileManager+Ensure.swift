//
//  FileManager+Ensure.swift
//

import Foundation

public extension FileManager {

  /// This ensures that the directory at `url` exists, creating it if necessary; throws an error on failure.
  ///
  /// - parameter url: The URL of the directory you wish to ensure exists.
  ///
  /// - warning: This obviously won't guard against subsequent directory removal.
  ///
  /// - precondition: `url.isFileURL` must be `true`
  /// - precondition: `url.hasDirectoryPath` must be `true`
  ///
  @inlinable
  func ensureDirectoryExists(at url: URL) throws {
    precondition(url.isFileURL)
    precondition(url.hasDirectoryPath)
    // NOTE: [*supposedly* `withIntermediateDirectories: true` means that
    // this method treats "directory already exists" as success](https://developer.apple.com/documentation/foundation/nsfilemanager/1415371-createdirectoryaturl)
    try self.createDirectory(
      at: url,
      withIntermediateDirectories: true,
      attributes: nil
    )
  }

}
