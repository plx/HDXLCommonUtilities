//
//  NSFileCoordinator+DeletionConveniences.swift
//

import Foundation

public extension NSFileCoordinator {
  
  /// Synchronously deletes a single file under file coordination.
  @inlinable
  func synchronouslyCoordinateDeletion(
    ofItemAt deletionTargetURL: URL,
    fileManager: FileManager = .default) throws -> Bool {
    return try self.synchronouslyCoordinate(
      writingItemAt: deletionTargetURL,
      options: .forDeleting) {
        (accessURL: URL) throws -> Bool
        in
        try fileManager.removeItem(at: deletionTargetURL)
        // - TODO: confirm this works (if it throws we never return!)
        return true
    }
  }
  
}
