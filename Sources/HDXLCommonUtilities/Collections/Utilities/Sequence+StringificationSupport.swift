//
//  Sequence+StringificationSupport.swift
//

import Foundation

public extension Sequence {
  
  @inlinable
  func enclosedTransformJoin(
    endcaps: SequenceEnclosureEndcaps,
    separator: String,
    transformation: (Element) -> String) -> String {
    let interior = self
      .lazy
      .map(transformation)
      .joined(separator: separator)
    return endcaps.string(
      enclosing: interior
    )
  }
  
  @inlinable
  func arrayLikeStringification(transformation: (Element) -> String) -> String {
    return self.enclosedTransformJoin(
      endcaps: .squareBrackets,
      separator: ", ",
      transformation: transformation
    )
  }
  
  @inlinable
  func arrayLikeElementDescriptions() -> String {
    return self.arrayLikeStringification() {
      return String(describing: $0)
    }
  }
  
  @inlinable
  func arrayLikeElementDebugDescriptions() -> String {
    return self.arrayLikeStringification() {
      return String(reflecting: $0)
    }
  }

}

public extension Sequence where Element == String {
  
  @inlinable
  func enclosedJoin(
    endcaps: SequenceEnclosureEndcaps,
    separator: String) -> String {
    return endcaps.string(
      enclosing: self.joined(
        separator: separator
      )
    )
  }
  
  @inlinable
  func toArrayLikeJoin() -> String {
    return self.enclosedJoin(
      endcaps: .squareBrackets,
      separator: ", "
    )
  }
  
  @inlinable
  func toTupleLikeJoin() -> String {
    return self.enclosedJoin(
      endcaps: .parentheses,
      separator: ", "
    )
  }
  
}
