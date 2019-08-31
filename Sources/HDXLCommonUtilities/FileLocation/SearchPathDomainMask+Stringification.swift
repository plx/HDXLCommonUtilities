//
//  SearchPathDomainMask+Stringification.swift
//

import Foundation

public extension FileManager.SearchPathDomainMask {
  
  /// Returns what `description` *should* return, if it were defined on this type.
  ///
  /// - note: We can't safely have `FileManager.SearchPathDomainMask` conform to `CustomStringConvertible` (etc.) b/c we can't safely add protocol conformances in cases for which we neither (a) control the type nor (b) own the protocol.
  @inlinable
  var readableStringification: String {
    get {
      guard !self.isEmpty else {
        return "[]"
      }
      var components: [String] = []
      if self.contains(.userDomainMask) {
        components.append(".userDomainMask")
      }
      if self.contains(.localDomainMask) {
        components.append(".localDomainMask")
      }
      if self.contains(.networkDomainMask) {
        components.append(".networkDomainMask")
      }
      if self.contains(.systemDomainMask) {
        components.append(".systemDomainMask")
      }
      return components.toArrayLikeJoin()
    }
  }

  /// Returns what `description` *should* return, if it were defined on this type.
  ///
  /// - note: We can't safely have `FileManager.SearchPathDomainMask` conform to `CustomDebugStringConvertible` (etc.) b/c we can't safely add protocol conformances in cases for which we neither (a) control the type nor (b) own the protocol.
  @inlinable
  var debugStringification: String {
    get {
      return "FileManager.SearchPathDomainMask(rawValue: \(self.rawValue)) (aka: \(self.readableStringification))"
    }
  }

}
