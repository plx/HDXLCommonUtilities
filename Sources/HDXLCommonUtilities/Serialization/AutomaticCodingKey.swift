//
//  AutomaticCodingKey.swift
//

import Foundation

public protocol AutomaticCodingKey : CodingKey, CaseIterable, RawRepresentable
  where
  RawValue:Hashable {
  
  static var integerValueLookup: [RawValue:Int] { get }
  
}

public extension AutomaticCodingKey {
  
  @inlinable
  static func prepareIntegerValueLookup() -> [RawValue:Int] {
    return [RawValue:Int](
      uniqueKeysWithValues: Self.allCases.enumerated().lazy.map() {
        ($1.rawValue,$0)
      }
    )
  }
  
  static var integerValueLookup: [RawValue:Int] {
    get {
      return self.prepareIntegerValueLookup()
    }
  }
  
}

public extension AutomaticCodingKey where RawValue == String {
  
  @inlinable
  var intValue: Int? {
    get {
      return Self.integerValueLookup[self.rawValue]
    }
  }
  
}
