//
//  XCTestCase+Utilities.swift
//

import Foundation
import XCTest

public extension XCTestCase {
  
  @nonobjc
  @inlinable
  func haltingOnFirstError(_ activity: () -> Void) {
    let previous = self.continueAfterFailure
    defer { self.continueAfterFailure = previous }
    self.continueAfterFailure = false
    activity()
  }
  
}
