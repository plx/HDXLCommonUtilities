//
//  AlgebraicProduct8+SumInteroperation.swift
//

import Foundation

public extension AlgebraicProduct8 {
  
  /// Shorthand for the type of a homogeneous-value extractor.
  typealias HomogeneousValueExtractor<T> = Sum8<
    (A) -> T,
    (B) -> T,
    (C) -> T,
    (D) -> T,
    (E) -> T,
    (F) -> T,
    (G) -> T,
    (H) -> T
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
    case .d(let d):
      return d(self.d)
    case .e(let e):
      return e(self.e)
    case .f(let f):
      return f(self.f)
    case .g(let g):
      return g(self.g)
    case .h(let h):
      return h(self.h)
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
    case .d(let d):
      self.d = d
    case .e(let e):
      self.e = e
    case .f(let f):
      self.f = f
    case .g(let g):
      self.g = g
    case .h(let h):
      self.h = h
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
    case .d(let d):
      return self.with(d: d)
    case .e(let e):
      return self.with(e: e)
    case .f(let f):
      return self.with(f: f)
    case .g(let g):
      return self.with(g: g)
    case .h(let h):
      return self.with(h: h)
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
    case .d:
      return .d(self.d)
    case .e:
      return .e(self.e)
    case .f:
      return .f(self.f)
    case .g:
      return .g(self.g)
    case .h:
      return .h(self.h)
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
    case 3:
      return .d(self.d)
    case 4:
      return .e(self.e)
    case 5:
      return .f(self.f)
    case 6:
      return .g(self.g)
    case 7:
      return .h(self.h)
    default:
      preconditionFailure("Attempted to get the heterogeneous value at invalid index \(index) (on: \(String(reflecting: self))!")
    }
  }

}
