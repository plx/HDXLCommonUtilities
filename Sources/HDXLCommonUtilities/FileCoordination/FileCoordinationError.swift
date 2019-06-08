//
//  FileCoordinationError.swift
//  
//

import Foundation

/// Special-purpose error for distinguishing between file-coordination errors and occurring during the coordinated work.
public enum FileCoordinationError : Error {
  
  /// Case for errors reported-by `NSFileCoordinator`, itself.
  ///
  /// - todo: Consider weakening to `Error`
  ///
  case coordinationError(NSError)
  
  /// Case for errors occurring during the coordinated work.
  case transactionError(Error)
  
}
