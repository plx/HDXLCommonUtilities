//
//  AdjacentCollectionConveniences.swift
//

import Foundation

public extension Collection {
  
  // ------------------------------------------------------------------------ //
  // MARK: Standard Representations - Definitions
  // ------------------------------------------------------------------------ //
  
  /// Standard representation for the arity-2 adjacent-tuples collection.
  typealias Adjacent2Tuples = Adjacent2Collection<
    Self,
    StandardUniformPositionRepresentation2<Self>,
    StandardUniformElementRepresentation2<Self>>
  
  /// Standard representation for the arity-3 adjacent-tuples collection.
  typealias Adjacent3Tuples = Adjacent3Collection<
    Self,
    StandardUniformPositionRepresentation3<Self>,
    StandardUniformElementRepresentation3<Self>>
  
  /// Standard representation for the arity-4 adjacent-tuples collection.
  typealias Adjacent4Tuples = Adjacent4Collection<
    Self,
    StandardUniformPositionRepresentation4<Self>,
    StandardUniformElementRepresentation4<Self>>
  
  /// Standard representation for the arity-5 adjacent-tuples collection.
  typealias Adjacent5Tuples = Adjacent5Collection<
    Self,
    StandardUniformPositionRepresentation5<Self>,
    StandardUniformElementRepresentation5<Self>>
  
  /// Standard representation for the arity-6 adjacent-tuples collection.
  typealias Adjacent6Tuples = Adjacent6Collection<
    Self,
    StandardUniformPositionRepresentation6<Self>,
    StandardUniformElementRepresentation6<Self>>
  
  /// Standard representation for the arity-7 adjacent-tuples collection.
  typealias Adjacent7Tuples = Adjacent7Collection<
    Self,
    StandardUniformPositionRepresentation7<Self>,
    StandardUniformElementRepresentation7<Self>>
  
  /// Standard representation for the arity-8 adjacent-tuples collection.
  typealias Adjacent8Tuples = Adjacent8Collection<
    Self,
    StandardUniformPositionRepresentation8<Self>,
    StandardUniformElementRepresentation8<Self>>
  
  /// Standard representation for the arity-9 adjacent-tuples collection.
  typealias Adjacent9Tuples = Adjacent9Collection<
    Self,
    StandardUniformPositionRepresentation9<Self>,
    StandardUniformElementRepresentation9<Self>
  >

  // ------------------------------------------------------------------------ //
  // MARK: Standard Representations - Access
  // ------------------------------------------------------------------------ //

  /// Access `self` as the collection of its adjacent 2-tuples.
  ///
  /// - note: Uses the default representation selected for the arity-2 choice.
  ///
  @inlinable
  var adjacent2Tuples: Adjacent2Tuples {
    get {
      return Adjacent2Tuples(source: self)
    }
  }

  /// Access `self` as the collection of its adjacent 3-tuples.
  ///
  /// - note: Uses the default representation selected for the arity-3 choice.
  ///
  @inlinable
  var adjacent3Tuples: Adjacent3Tuples {
    get {
      return Adjacent3Tuples(source: self)
    }
  }

  /// Access `self` as the collection of its adjacent 4-tuples.
  ///
  /// - note: Uses the default representation selected for the arity-4 choice.
  ///
  @inlinable
  var adjacent4Tuples: Adjacent4Tuples {
    get {
      return Adjacent4Tuples(source: self)
    }
  }

  /// Access `self` as the collection of its adjacent 5-tuples.
  ///
  /// - note: Uses the default representation selected for the arity-5 choice.
  ///
  @inlinable
  var adjacent5Tuples: Adjacent5Tuples {
    get {
      return Adjacent5Tuples(source: self)
    }
  }

  /// Access `self` as the collection of its adjacent 6-tuples.
  ///
  /// - note: Uses the default representation selected for the arity-6 choice.
  ///
  @inlinable
  var adjacent6Tuples: Adjacent6Tuples {
    get {
      return Adjacent6Tuples(source: self)
    }
  }

  /// Access `self` as the collection of its adjacent 7-tuples.
  ///
  /// - note: Uses the default representation selected for the arity-7 choice.
  ///
  @inlinable
  var adjacent7Tuples: Adjacent7Tuples {
    get {
      return Adjacent7Tuples(source: self)
    }
  }

  /// Access `self` as the collection of its adjacent 8-tuples.
  ///
  /// - note: Uses the default representation selected for the arity-8 choice.
  ///
  @inlinable
  var adjacent8Tuples: Adjacent8Tuples {
    get {
      return Adjacent8Tuples(source: self)
    }
  }

  /// Access `self` as the collection of its adjacent 9-tuples.
  ///
  /// - note: Uses the default representation selected for the arity-9 choice.
  ///
  @inlinable
  var adjacent9Tuples: Adjacent9Tuples {
    get {
      return Adjacent9Tuples(source: self)
    }
  }

  // ------------------------------------------------------------------------ //
  // MARK: Custom Representations - Access
  // ------------------------------------------------------------------------ //

  /// Obtain an adjacent 2-tuple collection using a specific choice of representation.
  ///
  /// - parameter positionRepresentation: The representation to use for the positions (e.g. indices).
  /// - parameter elementRepresentation: The representation to use for the elements (e.g. vended values).
  ///
  /// - returns: A collection of adjacent 2-tuples, using the requested component representations.
  ///
  /// - note: *Generally* too verbose for use at call sites; suggest wrapping in purpose-indicating convenience methods whenever used.
  /// - todo: Change to a `some Collection` representation once capability exists.
  ///
  @inlinable
  func adjacent2TupleCollection<PositionRepresentation,ElementRepresentation>(
    positionRepresentation: PositionRepresentation.Type,
    elementRepresentation: ElementRepresentation.Type) -> Adjacent2Collection<Self,PositionRepresentation,ElementRepresentation>
    where
    PositionRepresentation:AlgebraicProduct2,
    PositionRepresentation.A == Index,
    ElementRepresentation:AlgebraicProduct2,
    ElementRepresentation.A == Element {
      return Adjacent2Collection<Self,PositionRepresentation,ElementRepresentation>(
        source: self
      )
  }

  /// Obtain an adjacent 3-tuple collection using a specific choice of representation.
  ///
  /// - parameter positionRepresentation: The representation to use for the positions (e.g. indices).
  /// - parameter elementRepresentation: The representation to use for the elements (e.g. vended values).
  ///
  /// - returns: A collection of adjacent 3-tuples, using the requested component representations.
  ///
  /// - note: *Generally* too verbose for use at call sites; suggest wrapping in purpose-indicating convenience methods whenever used.
  /// - todo: Change to a `some Collection` representation once capability exists.
  ///
  @inlinable
  func adjacent3TupleCollection<PositionRepresentation,ElementRepresentation>(
    positionRepresentation: PositionRepresentation.Type,
    elementRepresentation: ElementRepresentation.Type) -> Adjacent3Collection<Self,PositionRepresentation,ElementRepresentation>
    where
    PositionRepresentation:AlgebraicProduct3,
    PositionRepresentation.A == Index,
    ElementRepresentation:AlgebraicProduct3,
    ElementRepresentation.A == Element {
      return Adjacent3Collection<Self,PositionRepresentation,ElementRepresentation>(
        source: self
      )
  }

  /// Obtain an adjacent 4-tuple collection using a specific choice of representation.
  ///
  /// - parameter positionRepresentation: The representation to use for the positions (e.g. indices).
  /// - parameter elementRepresentation: The representation to use for the elements (e.g. vended values).
  ///
  /// - returns: A collection of adjacent 4-tuples, using the requested component representations.
  ///
  /// - note: *Generally* too verbose for use at call sites; suggest wrapping in purpose-indicating convenience methods whenever used.
  /// - todo: Change to a `some Collection` representation once capability exists.
  ///
  @inlinable
  func adjacent4TupleCollection<PositionRepresentation,ElementRepresentation>(
    positionRepresentation: PositionRepresentation.Type,
    elementRepresentation: ElementRepresentation.Type) -> Adjacent4Collection<Self,PositionRepresentation,ElementRepresentation>
    where
    PositionRepresentation:AlgebraicProduct4,
    PositionRepresentation.A == Index,
    ElementRepresentation:AlgebraicProduct4,
    ElementRepresentation.A == Element {
      return Adjacent4Collection<Self,PositionRepresentation,ElementRepresentation>(
        source: self
      )
  }

  /// Obtain an adjacent 5-tuple collection using a specific choice of representation.
  ///
  /// - parameter positionRepresentation: The representation to use for the positions (e.g. indices).
  /// - parameter elementRepresentation: The representation to use for the elements (e.g. vended values).
  ///
  /// - returns: A collection of adjacent 5-tuples, using the requested component representations.
  ///
  /// - note: *Generally* too verbose for use at call sites; suggest wrapping in purpose-indicating convenience methods whenever used.
  /// - todo: Change to a `some Collection` representation once capability exists.
  ///
  @inlinable
  func adjacent5TupleCollection<PositionRepresentation,ElementRepresentation>(
    positionRepresentation: PositionRepresentation.Type,
    elementRepresentation: ElementRepresentation.Type) -> Adjacent5Collection<Self,PositionRepresentation,ElementRepresentation>
    where
    PositionRepresentation:AlgebraicProduct5,
    PositionRepresentation.A == Index,
    ElementRepresentation:AlgebraicProduct5,
    ElementRepresentation.A == Element {
      return Adjacent5Collection<Self,PositionRepresentation,ElementRepresentation>(
        source: self
      )
  }

  /// Obtain an adjacent 6-tuple collection using a specific choice of representation.
  ///
  /// - parameter positionRepresentation: The representation to use for the positions (e.g. indices).
  /// - parameter elementRepresentation: The representation to use for the elements (e.g. vended values).
  ///
  /// - returns: A collection of adjacent 6-tuples, using the requested component representations.
  ///
  /// - note: *Generally* too verbose for use at call sites; suggest wrapping in purpose-indicating convenience methods whenever used.
  /// - todo: Change to a `some Collection` representation once capability exists.
  ///
  @inlinable
  func adjacent6TupleCollection<PositionRepresentation,ElementRepresentation>(
    positionRepresentation: PositionRepresentation.Type,
    elementRepresentation: ElementRepresentation.Type) -> Adjacent6Collection<Self,PositionRepresentation,ElementRepresentation>
    where
    PositionRepresentation:AlgebraicProduct6,
    PositionRepresentation.A == Index,
    ElementRepresentation:AlgebraicProduct6,
    ElementRepresentation.A == Element {
      return Adjacent6Collection<Self,PositionRepresentation,ElementRepresentation>(
        source: self
      )
  }

  /// Obtain an adjacent 7-tuple collection using a specific choice of representation.
  ///
  /// - parameter positionRepresentation: The representation to use for the positions (e.g. indices).
  /// - parameter elementRepresentation: The representation to use for the elements (e.g. vended values).
  ///
  /// - returns: A collection of adjacent 7-tuples, using the requested component representations.
  ///
  /// - note: *Generally* too verbose for use at call sites; suggest wrapping in purpose-indicating convenience methods whenever used.
  /// - todo: Change to a `some Collection` representation once capability exists.
  ///
  @inlinable
  func adjacent7TupleCollection<PositionRepresentation,ElementRepresentation>(
    positionRepresentation: PositionRepresentation.Type,
    elementRepresentation: ElementRepresentation.Type) -> Adjacent7Collection<Self,PositionRepresentation,ElementRepresentation>
    where
    PositionRepresentation:AlgebraicProduct7,
    PositionRepresentation.A == Index,
    ElementRepresentation:AlgebraicProduct7,
    ElementRepresentation.A == Element {
      return Adjacent7Collection<Self,PositionRepresentation,ElementRepresentation>(
        source: self
      )
  }

  /// Obtain an adjacent 8-tuple collection using a specific choice of representation.
  ///
  /// - parameter positionRepresentation: The representation to use for the positions (e.g. indices).
  /// - parameter elementRepresentation: The representation to use for the elements (e.g. vended values).
  ///
  /// - returns: A collection of adjacent 8-tuples, using the requested component representations.
  ///
  /// - note: *Generally* too verbose for use at call sites; suggest wrapping in purpose-indicating convenience methods whenever used.
  /// - todo: Change to a `some Collection` representation once capability exists.
  ///
  @inlinable
  func adjacent8TupleCollection<PositionRepresentation,ElementRepresentation>(
    positionRepresentation: PositionRepresentation.Type,
    elementRepresentation: ElementRepresentation.Type) -> Adjacent8Collection<Self,PositionRepresentation,ElementRepresentation>
    where
    PositionRepresentation:AlgebraicProduct8,
    PositionRepresentation.A == Index,
    ElementRepresentation:AlgebraicProduct8,
    ElementRepresentation.A == Element {
      return Adjacent8Collection<Self,PositionRepresentation,ElementRepresentation>(
        source: self
      )
  }

  /// Obtain an adjacent 9-tuple collection using a specific choice of representation.
  ///
  /// - parameter positionRepresentation: The representation to use for the positions (e.g. indices).
  /// - parameter elementRepresentation: The representation to use for the elements (e.g. vended values).
  ///
  /// - returns: A collection of adjacent 9-tuples, using the requested component representations.
  ///
  /// - note: *Generally* too verbose for use at call sites; suggest wrapping in purpose-indicating convenience methods whenever used.
  /// - todo: Change to a `some Collection` representation once capability exists.
  ///
  @inlinable
  func adjacent9TupleCollection<PositionRepresentation,ElementRepresentation>(
    positionRepresentation: PositionRepresentation.Type,
    elementRepresentation: ElementRepresentation.Type) -> Adjacent9Collection<Self,PositionRepresentation,ElementRepresentation>
    where
    PositionRepresentation:AlgebraicProduct9,
    PositionRepresentation.A == Index,
    ElementRepresentation:AlgebraicProduct9,
    ElementRepresentation.A == Element {
      return Adjacent9Collection<Self,PositionRepresentation,ElementRepresentation>(
        source: self
      )
  }


}
