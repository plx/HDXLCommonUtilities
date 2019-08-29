//
//  AlgebraicProduct.swift
//

import Foundation

public protocol AlgebraicProduct {
  
  static var arity: Int { get }
  
  associatedtype ArityPosition: Comparable, Hashable, CaseIterable // TODO: `ArityPositionProtocol`
  
}

internal extension AlgebraicProduct {
  
  /// Exists to (a) validate the protocols during testing and (b) to document
  /// that this equality *should always hold* (e.g. that that's the intent).
  @inlinable
  static var hasConsistentArities: Bool {
    get {
      return self.arity == ArityPosition.allCases.count
    }
  }
  
}
