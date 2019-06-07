//
//  FileCoordinationError.swift
//  
//

import Foundation

public enum FileCoordinationError : Error {
  
  case coordinationError(NSError)
  case transactionError(Error)
  
}
