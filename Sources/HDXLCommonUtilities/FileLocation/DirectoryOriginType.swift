//
//  DirectoryOriginType.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: DirectoryOriginType - Definition
// -------------------------------------------------------------------------- //

/// "Case enumeration" for `DirectoryOrigin`.
public enum DirectoryOriginType : Int {
  
  /// Case for when the base URL should be an explicitly-supplied directory.
  case explicit
  
  /// Case for when the base URL should be obtained via `FileManager`'s directory-search functionality.
  case search
  
  /// Case for when the base URL should be the (root of) a presumably-shared `appGroup`.
  case appGroup
  
  /// Case for when the base URL should be a (dynamically-generated) temporary directory.
  case temporary

}

// -------------------------------------------------------------------------- //
// MARK: DirectoryOriginType - Equatable
// -------------------------------------------------------------------------- //

extension DirectoryOriginType : Equatable {
  
  @inlinable
  public static func ==(
    lhs: DirectoryOriginType,
    rhs: DirectoryOriginType) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

}

// -------------------------------------------------------------------------- //
// MARK: DirectoryOriginType - Hashable
// -------------------------------------------------------------------------- //

extension DirectoryOriginType : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DirectoryOriginType - Codable
// -------------------------------------------------------------------------- //

extension DirectoryOriginType : Codable {
  
  // synthesized ok
  
}
