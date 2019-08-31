//
//  String+DirectoryPath.swift
//

import Foundation

internal extension String {
  
  /// `true` iff this represents a *valid* directory path.
  ///
  /// - note: Kept `internal` because this is not necessarily the correct criteria--it's just the criteria for my intended uses.
  @inlinable
  var isValidDirectoryPathComponent: Bool {
    get {
      guard
        !self.isEmpty,
        self.unicodeScalars.allSatisfy({
          CharacterSet.urlPathAllowed.contains($0)
        }) else {
        return false
      }
      return true
    }
  }
  
}
