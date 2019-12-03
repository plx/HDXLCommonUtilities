//
//  Array+AppendingSupport.swift
//

import Foundation

public extension Array {
  
  /// Returns the result of appending `value` to `self`.
  ///
  /// - note: I could *swear* this was in the standard library; if it is, it seems gone now.
  ///
  @inlinable
  func appending(_ value: Element) -> [Element] {
    var result = self
    result.append(value)
    return result
  }

  /// Returns the result of appending each value in `values` to `self`.
  ///
  /// - note: I could *swear* this was in the standard library; if it is, it seems gone now.
  ///
  @inlinable
  func appending<S:Sequence>(contentsOf elements: S) -> [Element] where S.Element == Element {
    var result = self
    result.append(contentsOf: elements)
    return result
  }

}
