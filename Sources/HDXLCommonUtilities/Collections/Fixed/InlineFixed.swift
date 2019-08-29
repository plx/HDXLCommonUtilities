//
//  InlineFixed.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: InlineFixedCollection - Arity 2
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the inline fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func InlineFixedCollection<T>(
  _ a: T,
  _ b: T) -> Fixed2Collection<UniformInlineProduct2<T>> {
    return Fixed2Collection<UniformInlineProduct2<T>>(
      a,
      b
    )
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedCollection - Arity 3
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the inline fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
/// - parameter c: The third element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func InlineFixedCollection<T>(
  _ a: T,
  _ b: T,
  _ c: T) -> Fixed3Collection<UniformInlineProduct3<T>> {
    return Fixed3Collection<UniformInlineProduct3<T>>(
      a,
      b,
      c
    )
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedCollection - Arity 4
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the inline fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
/// - parameter c: The third element in the collection.
/// - parameter d: The fourth element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func InlineFixedCollection<T>(
  _ a: T,
  _ b: T,
  _ c: T,
  _ d: T) -> Fixed4Collection<UniformInlineProduct4<T>> {
    return Fixed4Collection<UniformInlineProduct4<T>>(
      a,
      b,
      c,
      d
    )
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedCollection - Arity 5
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the inline fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
/// - parameter c: The third element in the collection.
/// - parameter d: The fourth element in the collection.
/// - parameter e: The fifth element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func InlineFixedCollection<T>(
  _ a: T,
  _ b: T,
  _ c: T,
  _ d: T,
  _ e: T) -> Fixed5Collection<UniformInlineProduct5<T>> {
    return Fixed5Collection<UniformInlineProduct5<T>>(
      a,
      b,
      c,
      d,
      e
    )
}

// ------------------------------------------------------------------------ //
// MARK: InlineFixedCollection - Arity 6
// ------------------------------------------------------------------------ //

/// Pseudo-constructor for the inline fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
/// - parameter c: The third element in the collection.
/// - parameter d: The fourth element in the collection.
/// - parameter e: The fifth element in the collection.
/// - parameter f: The sixth element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func InlineFixedCollection<T>(
  _ a: T,
  _ b: T,
  _ c: T,
  _ d: T,
  _ e: T,
  _ f: T) -> Fixed6Collection<UniformInlineProduct6<T>> {
    return Fixed6Collection<UniformInlineProduct6<T>>(
      a,
      b,
      c,
      d,
      e,
      f
    )
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedCollection - Arity 7
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the inline fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
/// - parameter c: The third element in the collection.
/// - parameter d: The fourth element in the collection.
/// - parameter e: The fifth element in the collection.
/// - parameter f: The sixth element in the collection.
/// - parameter g: The seventh element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func InlineFixedCollection<T>(
  _ a: T,
  _ b: T,
  _ c: T,
  _ d: T,
  _ e: T,
  _ f: T,
  _ g: T) -> Fixed7Collection<UniformInlineProduct7<T>> {
    return Fixed7Collection<UniformInlineProduct7<T>>(
      a,
      b,
      c,
      d,
      e,
      f,
      g
    )
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedCollection - Arity 8
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the inline fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
/// - parameter c: The third element in the collection.
/// - parameter d: The fourth element in the collection.
/// - parameter e: The fifth element in the collection.
/// - parameter f: The sixth element in the collection.
/// - parameter g: The seventh element in the collection.
/// - parameter h: The eigth element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func InlineFixedCollection<T>(
  _ a: T,
  _ b: T,
  _ c: T,
  _ d: T,
  _ e: T,
  _ f: T,
  _ g: T,
  _ h: T) -> Fixed8Collection<UniformInlineProduct8<T>> {
    return Fixed8Collection<UniformInlineProduct8<T>>(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h
    )
}

// -------------------------------------------------------------------------- //
// MARK: InlineFixedCollection - Arity 9
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the inline fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
/// - parameter c: The third element in the collection.
/// - parameter d: The fourth element in the collection.
/// - parameter e: The fifth element in the collection.
/// - parameter f: The sixth element in the collection.
/// - parameter g: The seventh element in the collection.
/// - parameter h: The eigth element in the collection.
/// - parameter i: The ninth element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func InlineFixedCollection<T>(
  _ a: T,
  _ b: T,
  _ c: T,
  _ d: T,
  _ e: T,
  _ f: T,
  _ g: T,
  _ h: T,
  _ i: T) -> Fixed9Collection<UniformInlineProduct9<T>> {
    return Fixed9Collection<UniformInlineProduct9<T>>(
      a,
      b,
      c,
      d,
      e,
      f,
      g,
      h,
      i
    )
}
