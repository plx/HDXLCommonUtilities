//
//  OrderingTestingSupport.swift
//

import Foundation
import XCTest

@inlinable
public func HDXLAssertCoherentOrdering<C:Collection>(forAscendingDistinctValues values: C)
  where C.Element: Comparable {
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
        XCTAssertEqual(
          (lIndex < rIndex),
          (lValue < rValue),
          "Found incoherent <, \(lValue) < \(rValue) *should* => \(lIndex < rIndex), but *instead* => \(lValue < rValue)!"
        )
        XCTAssertEqual(
          (lIndex <= rIndex),
          (lValue <= rValue),
          "Found incoherent <=, \(lValue) <= \(rValue) *should* => \(lIndex <= rIndex), but *instead* => \(lValue <= rValue)!"
        )
        XCTAssertEqual(
          (lIndex > rIndex),
          (lValue > rValue),
          "Found incoherent >, \(lValue) > \(rValue) *should* => \(lIndex > rIndex), but *instead* => \(lValue >= rValue)!"
        )
        XCTAssertEqual(
          (lIndex <= rIndex),
          (lValue <= rValue),
          "Found incoherent >=, \(lValue) >= \(rValue) *should* => \(lIndex >= rIndex), but *instead* => \(lValue >= rValue)!"
        )
        XCTAssertEqual(
          (lValue > rValue),
          (rValue < lValue),
          "Found <, > asymmetry: should have `lValue > rValue == `rValue > lValue`, but got lValue > rValue` => \(lValue > rValue) and `rValue < lValue` => \(rValue < lValue)!"
        )
        XCTAssertEqual(
          (lValue >= rValue),
          (rValue <= lValue),
          "Found <=, >= asymmetry: should have `lValue >= rValue == `rValue >= lValue`, but got lValue >= rValue` => \(lValue > rValue) and `rValue <= lValue` => \(rValue < lValue)!"
        )
      }
    }
}
