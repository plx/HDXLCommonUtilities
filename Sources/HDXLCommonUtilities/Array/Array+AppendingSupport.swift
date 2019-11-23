//
//  Array+AppendingSupport.swift
//

import Foundation

public extension Array {
  
  @inlinable
  func appending(_ value: Element) -> [Element] {
    var result = self
    result.append(value)
    return result
  }

  @inlinable
  func appending<S:Sequence>(contentsOf elements: S) -> [Element] where S.Element == Element {
    var result = self
    result.append(contentsOf: elements)
    return result
  }

}
