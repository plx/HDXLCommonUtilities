//
//  NSExpression+Conveniences.swift
//

import Foundation

public extension NSExpression {
  
  @inlinable
  convenience init<S:Sequence>(forAggregateValues values: S) {
    self.init(
      forAggregate: values.map() {
        (value: S.Element) -> NSExpression
        in
        NSExpression(
          forConstantValue: value
        )
      }
    )
  }
  
}
