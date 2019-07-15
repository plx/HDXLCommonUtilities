//
//  Arity9+Splaying.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - Splaying
// -------------------------------------------------------------------------- //

public extension InlineProduct9 {
  
  /// Obtain a product of values by applying a product of functions to a common "source value".
  @inlinable
  init<T>(
    splaying value: T,
    using extractors: InlineProduct9<
    (T) -> A,
    (T) -> B,
    (T) -> C,
    (T) -> D,
    (T) -> E,
    (T) -> F,
    (T) -> G,
    (T) -> H,
    (T) -> I>) {
    self.init(
      extractors.a(value),
      extractors.b(value),
      extractors.c(value),
      extractors.d(value),
      extractors.e(value),
      extractors.f(value),
      extractors.g(value),
      extractors.h(value),
      extractors.i(value)
    )
  }

  /// Obtain a product of values by applying a product of functions to a common "source value".
  @inlinable
  init<T>(
    splaying value: T,
    using extractors: COWProduct9<
    (T) -> A,
    (T) -> B,
    (T) -> C,
    (T) -> D,
    (T) -> E,
    (T) -> F,
    (T) -> G,
    (T) -> H,
    (T) -> I>) {
    self.init(
      extractors.a(value),
      extractors.b(value),
      extractors.c(value),
      extractors.d(value),
      extractors.e(value),
      extractors.f(value),
      extractors.g(value),
      extractors.h(value),
      extractors.i(value)
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: COWProduct9 - Splaying
// -------------------------------------------------------------------------- //

public extension COWProduct9 {
  
  /// Obtain a product of values by applying a product of functions to a common "source value".
  @inlinable
  init<T>(
    splaying value: T,
    using extractors: InlineProduct9<
    (T) -> A,
    (T) -> B,
    (T) -> C,
    (T) -> D,
    (T) -> E,
    (T) -> F,
    (T) -> G,
    (T) -> H,
    (T) -> I>) {
    self.init(
      extractors.a(value),
      extractors.b(value),
      extractors.c(value),
      extractors.d(value),
      extractors.e(value),
      extractors.f(value),
      extractors.g(value),
      extractors.h(value),
      extractors.i(value)
    )
  }
  
  /// Obtain a product of values by applying a product of functions to a common "source value".
  @inlinable
  init<T>(
    splaying value: T,
    using extractors: COWProduct9<
    (T) -> A,
    (T) -> B,
    (T) -> C,
    (T) -> D,
    (T) -> E,
    (T) -> F,
    (T) -> G,
    (T) -> H,
    (T) -> I>) {
    self.init(
      extractors.a(value),
      extractors.b(value),
      extractors.c(value),
      extractors.d(value),
      extractors.e(value),
      extractors.f(value),
      extractors.g(value),
      extractors.h(value),
      extractors.i(value)
    )
  }
  
}
