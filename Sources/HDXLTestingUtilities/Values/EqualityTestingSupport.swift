//
//  EqualityTestingSupport.swift
//

import Foundation
import XCTest

@inlinable @inline(__always)
public func HDXLAssertCoherentEquality<C:Collection>(forAscendingDistinctValues values: C)
  where C.Element: Equatable {
    for (lIndex,lValue) in values.enumerated() {
      for (rIndex,rValue) in values.enumerated() {
        XCTAssertEqual(
          (lIndex == rIndex),
          (lValue == rValue),
          "Found incoherent ==, \(lValue) == \(rValue) *should* => \(lIndex == rIndex), but *instead* => \(lValue == rValue)!"
        )
        XCTAssertEqual(
          (lIndex != rIndex),
          (lValue != rValue),
          "Found incoherent !=, \(lValue) != \(rValue) *should* => \(lIndex != rIndex), but *instead* => \(lValue != rValue)!"
        )
        XCTAssertNotEqual(
          (lValue == rValue),
          (lValue != rValue),
          "Found incoherent ==, != pair: `lValue == rValue` == `lValue != rValue` == \(lValue == rValue), which should never happen!"
        )
      }
    }
}
