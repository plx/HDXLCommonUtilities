//
//  AlgebraicProduct3+SumInteroperation.swift
//

import Foundation

public extension AlgebraicProduct3 {
  
  /// Shorthand for the type of a homogeneous-value extractor.
  typealias HomogeneousValueExtractor<T> = Sum3<
    (A) -> T,
    (B) -> T,
    (C) -> T
  >

  /// Returns a value of type `T` from `self` using the supplied extractor
  /// applied to its corresponding component (e.g. `.b(mappingFromBToT)` will
  /// return `mappingFromBToT(self.b)`).
  @inlinable
  func extractHomogeneizedValue<T>(
    ofType type: T.Type,
    using extractor: HomogeneousValueExtractor<T>) -> T {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(extractor.isValid)
    pedantic_assert(self.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch extractor {
    case .a(let a):
      return a(self.a)
    case .b(let b):
      return b(self.b)
    case .c(let c):
      return c(self.c)
    }
  }

  /// Updates `self` by replacing the indicated `component`.
  ///
  /// In other words, `self.formReplacement(ofComponent: .b(newBValue))` will
  /// modify `self` in-place by setting `self.b = newBValue`, leaving all other
  /// components unchanged.
  ///
  @inlinable
  mutating func formReplacement(ofComponent component: AssociatedSum) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(component.isValid)
    pedantic_assert(self.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    switch component {
    case .a(let a):
      self.a = a
    case .b(let b):
      self.b = b
    case .c(let c):
      self.c = c
    }
  }

  /// Returns `self` with the indicated `component` replaced.
  ///
  /// In other words, `self.replacing(component: .b(newBValue))` will return
  /// `self` with `.b` set to `newBValue` and all other components left as-is.
  ///
  @inlinable
  func replacing(component: AssociatedSum) -> Self {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(component.isValid)
    pedantic_assert(self.isValid)
    // /////////////////////////////////////////////////////////////////////////
    switch component {
    case .a(let a):
      return self.with(a: a)
    case .b(let b):
      return self.with(b: b)
    case .c(let c):
      return self.with(c: c)
    }
  }

  /// Retrieves value at `position`, represented as the `AssociatedSum`.
  @inlinable
  func heterogeneousValue(at position: ArityPosition) -> AssociatedSum {
    switch position {
    case .a:
      return .a(self.a)
    case .b:
      return .b(self.b)
    case .c:
      return .c(self.c)
    }
  }
  
  /// Retrieves value at `position`, represented as the `AssociatedSum`.
  @inlinable
  func heterogeneousValue(at index: Int) -> AssociatedSum {
    switch index {
    case 0:
      return .a(self.a)
    case 1:
      return .b(self.b)
    case 2:
      return .c(self.c)
    default:
      preconditionFailure("Attempted to get the heterogeneous value at invalid index \(index) (on: \(String(reflecting: self))!")
    }
  }

}
