//
//  Sequence+AlgebraicProductToTuple.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: Arity-2 Tuple Conversion
// -------------------------------------------------------------------------- //

public extension Sequence where Element:AlgebraicProduct2 {
    
  /// Obtains a view of `self` presenting the elements as tuples (instead of as "algebraic products").
  ///
  /// - note: Exists for cases in-which you want to do `for (foo,bar,baz) in ...` for collections providing algebraic-product values.
  ///
  /// - todo: Switch to `some Collection` once we can adequately-constrain it with a `where` clause.
  ///
  @inlinable
  func asTuples() -> OnDemandDirectMap<Self,Element.EquivalentTuple> {
    return self.directlyMappedOnDemand() {
      $0.equivalentTupleValue
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity-3 Tuple Conversion
// -------------------------------------------------------------------------- //

public extension Sequence where Element:AlgebraicProduct3 {
    
  /// Obtains a view of `self` presenting the elements as tuples (instead of as "algebraic products").
  ///
  /// - note: Exists for cases in-which you want to do `for (foo,bar,baz) in ...` for collections providing algebraic-product values.
  ///
  /// - todo: Switch to `some Collection` once we can adequately-constrain it with a `where` clause.
  ///
  @inlinable
  func asTuples() -> OnDemandDirectMap<Self,Element.EquivalentTuple> {
    return self.directlyMappedOnDemand() {
      $0.equivalentTupleValue
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity-4 Tuple Conversion
// -------------------------------------------------------------------------- //

public extension Sequence where Element:AlgebraicProduct4 {
    
  /// Obtains a view of `self` presenting the elements as tuples (instead of as "algebraic products").
  ///
  /// - note: Exists for cases in-which you want to do `for (foo,bar,baz) in ...` for collections providing algebraic-product values.
  ///
  /// - todo: Switch to `some Collection` once we can adequately-constrain it with a `where` clause.
  ///
  @inlinable
  func asTuples() -> OnDemandDirectMap<Self,Element.EquivalentTuple> {
    return self.directlyMappedOnDemand() {
      $0.equivalentTupleValue
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity-5 Tuple Conversion
// -------------------------------------------------------------------------- //

public extension Sequence where Element:AlgebraicProduct5 {
    
  /// Obtains a view of `self` presenting the elements as tuples (instead of as "algebraic products").
  ///
  /// - note: Exists for cases in-which you want to do `for (foo,bar,baz) in ...` for collections providing algebraic-product values.
  ///
  /// - todo: Switch to `some Collection` once we can adequately-constrain it with a `where` clause.
  ///
  @inlinable
  func asTuples() -> OnDemandDirectMap<Self,Element.EquivalentTuple> {
    return self.directlyMappedOnDemand() {
      $0.equivalentTupleValue
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity-6 Tuple Conversion
// -------------------------------------------------------------------------- //

public extension Sequence where Element:AlgebraicProduct6 {
    
  /// Obtains a view of `self` presenting the elements as tuples (instead of as "algebraic products").
  ///
  /// - note: Exists for cases in-which you want to do `for (foo,bar,baz) in ...` for collections providing algebraic-product values.
  ///
  /// - todo: Switch to `some Collection` once we can adequately-constrain it with a `where` clause.
  ///
  @inlinable
  func asTuples() -> OnDemandDirectMap<Self,Element.EquivalentTuple> {
    return self.directlyMappedOnDemand() {
      $0.equivalentTupleValue
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity-7 Tuple Conversion
// -------------------------------------------------------------------------- //

public extension Sequence where Element:AlgebraicProduct7 {
    
  /// Obtains a view of `self` presenting the elements as tuples (instead of as "algebraic products").
  ///
  /// - note: Exists for cases in-which you want to do `for (foo,bar,baz) in ...` for collections providing algebraic-product values.
  ///
  /// - todo: Switch to `some Collection` once we can adequately-constrain it with a `where` clause.
  ///
  @inlinable
  func asTuples() -> OnDemandDirectMap<Self,Element.EquivalentTuple> {
    return self.directlyMappedOnDemand() {
      $0.equivalentTupleValue
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity-8 Tuple Conversion
// -------------------------------------------------------------------------- //

public extension Sequence where Element:AlgebraicProduct8 {
    
  /// Obtains a view of `self` presenting the elements as tuples (instead of as "algebraic products").
  ///
  /// - note: Exists for cases in-which you want to do `for (foo,bar,baz) in ...` for collections providing algebraic-product values.
  ///
  /// - todo: Switch to `some Collection` once we can adequately-constrain it with a `where` clause.
  ///
  @inlinable
  func asTuples() -> OnDemandDirectMap<Self,Element.EquivalentTuple> {
    return self.directlyMappedOnDemand() {
      $0.equivalentTupleValue
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: Arity-9 Tuple Conversion
// -------------------------------------------------------------------------- //

public extension Sequence where Element:AlgebraicProduct9 {
    
  /// Obtains a view of `self` presenting the elements as tuples (instead of as "algebraic products").
  ///
  /// - note: Exists for cases in-which you want to do `for (foo,bar,baz) in ...` for collections providing algebraic-product values.
  ///
  /// - todo: Switch to `some Collection` once we can adequately-constrain it with a `where` clause.
  ///
  @inlinable
  func asTuples() -> OnDemandDirectMap<Self,Element.EquivalentTuple> {
    return self.directlyMappedOnDemand() {
      $0.equivalentTupleValue
    }
  }
  
}
