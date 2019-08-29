//
//  Sum2+ProductInteroperation.swift
//

import Foundation

public extension Sum2 {

  /// Given a value of one-of-n possible types and a mapping from each possible
  /// type to some specific type `T`, we can apply the matching mapping to the
  /// value we have and arrive at a value of type `T`.
  @inlinable
  func produceValue<T,Producer>(
    using producer: Producer) -> T
    where
    Producer:AlgebraicProduct2,
    Producer.A == (A) -> T,
    Producer.B == (B) -> T {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(producer))
      pedantic_assert(self.isValid)
      // ///////////////////////////////////////////////////////////////////////
      switch self {
      case .a(let a):
        return producer.a(a)
      case .b(let b):
        return producer.b(b)
      }
  }

  /// Componentwise-maps one sum type to another using the mappings in `mapping`.
  @inlinable
  func mapped<AA,BB,Mapping>(
    using mapping: Mapping) -> Sum2<AA,BB>
    where
    Mapping:AlgebraicProduct2,
    Mapping.A == (A) -> AA,
    Mapping.B == (B) -> BB {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(isValidOrIndifferent(mapping))
      pedantic_assert(self.isValid)
      // ///////////////////////////////////////////////////////////////////////
      switch self {
      case .a(let a):
        return .a(mapping.a(a))
      case .b(let b):
        return .b(mapping.b(b))
      }
  }

  
}
