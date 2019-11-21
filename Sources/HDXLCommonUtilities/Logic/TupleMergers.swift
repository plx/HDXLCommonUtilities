//
//  TupleMergers.swift
//

import Foundation

@inlinable
public func merge<T>(
  value: T,
  into tuple: (T,T),
  using comparator: (T,T) -> ComparisonResult) -> (T,T,T) {
  precondition(comparator(tuple.0,tuple.1).impliesLessThanOrEqual)
  switch comparator(value,tuple.1) {
  case .orderedAscending:
    switch comparator(value,tuple.0) {
    case .orderedAscending:
      return (value,tuple.0,tuple.1)
    case .orderedSame:
      return (value,tuple.0,tuple.1)
    case .orderedDescending:
      return (tuple.0,value,tuple.1)
    }
  case .orderedSame:
    return (tuple.0,tuple.1,value)
  case .orderedDescending:
    return (tuple.0,tuple.1,value)
  }
}
