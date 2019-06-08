//
//  ResettableValueSource.swift
//  

import Foundation

/// Protocol for value-sources for which it makes sense to proactively ask them to "reset". For example, a
/// lazily-evaluated image-loader that can be asked to throw away its images due to memory pressure.
public protocol ResettableValueSource : ValueSource {
  
  /// Call to reset the source; exact semantics will be specific to the underlying type.
  func resetValue()
  
}
