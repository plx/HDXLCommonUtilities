//
//  IndexPositionStorageEndReplacement.swift
//

import Foundation

@usableFromInline
internal enum IndexPositionStorageEndReplacement<T> {
  
  case position(T)
  case end
  case misnavigation
  
}
