//
//  IndexPositionStorageMovementAttemptDestination.swift
//

import Foundation

@usableFromInline
internal enum IndexPositionStorageMovementAttemptDestination<T> {
  
  case success(T)
  case becameEnd
  case misnavigation
  
}
