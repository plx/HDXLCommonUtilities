//
//  FileManager+FileStatus.swift
//

import Foundation

public extension FileManager {
  
  /// Examine the status of the indicated `path`.
  ///
  /// - parameter path: A string containing the file path you want to investigate.
  ///
  /// - returns: Whether `path` is a file, directory, or absent.
  ///
  @inlinable
  func fileStatus(atPath path: String) -> FileStatus {
    var isDirectory: ObjCBool = false
    let exists = self.fileExists(
      atPath: path,
      isDirectory: &isDirectory
    )
    guard exists else {
      return .doesNotExist
    }
    switch isDirectory.boolValue {
    case true:
      return .existsAsDirectory
    case false:
      return .existsAsFile
    }
  }
  
  /// Examine the status of the indicated `fileURL`.
  ///
  /// - parameter fileURL: The URL of the path you want to investigate.
  ///
  /// - returns: Whether `path` is a file, directory, or absent.
  ///
  /// - precondition: `fileURL.isFileURL` must be `true`.
  ///
  @inlinable
  func fileStatus(at fileURL: URL) -> FileStatus {
    precondition(fileURL.isFileURL)
    return self.fileStatus(atPath: fileURL.path)
  }
  
}
