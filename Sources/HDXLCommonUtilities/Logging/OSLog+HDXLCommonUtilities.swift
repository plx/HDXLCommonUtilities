//
//  OSLog+HDXLCommonUtilities.swift
//

import Foundation
import os.log

public extension OSLog {
  
  @usableFromInline
  internal static let commonUtilitiesSubsystem: String = "com.hdxlproject.hdxlcommonutilities"
  
  @inlinable
  internal convenience init(forPackageCategory category: String) {
    self.init(
      subsystem: OSLog.commonUtilitiesSubsystem,
      category: category
    )
  }
  
  static let filesystem: OSLog = OSLog(forPackageCategory: "filesystem")
  
}
