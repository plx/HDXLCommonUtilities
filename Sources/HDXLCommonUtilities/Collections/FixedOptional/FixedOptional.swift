//
//  FixedOptional.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: FixedOptionalCollection - Typealiases
// -------------------------------------------------------------------------- //

/// Typealias for the default choice of arity-2 fixed collection implementation.
public typealias FixedOptional2Collection<T> = InlineFixedOptional2Collection<T>

/// Typealias for the default choice of arity-3 fixed collection implementation.
public typealias FixedOptional3Collection<T> = COWFixedOptional3Collection<T>

/// Typealias for the default choice of arity-4 fixed collection implementation.
public typealias FixedOptional4Collection<T> = COWFixedOptional4Collection<T>

/// Typealias for the default choice of arity-5 fixed collection implementation.
public typealias FixedOptional5Collection<T> = COWFixedOptional5Collection<T>

/// Typealias for the default choice of arity-6 fixed collection implementation.
public typealias FixedOptional6Collection<T> = COWFixedOptional6Collection<T>

/// Typealias for the default choice of arity-7 fixed collection implementation.
public typealias FixedOptional7Collection<T> = COWFixedOptional7Collection<T>

/// Typealias for the default choice of arity-8 fixed collection implementation.
public typealias FixedOptional8Collection<T> = COWFixedOptional8Collection<T>

/// Typealias for the default choice of arity-9 fixed collection implementation.
public typealias FixedOptional9Collection<T> = COWFixedOptional9Collection<T>

// -------------------------------------------------------------------------- //
// MARK: FixedOptionalCollection - Arity 2
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the default fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func FixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?) -> FixedOptional2Collection<T> {
    return FixedOptional2Collection<T>(
      a,
      b
    )
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptionalCollection - Arity 3
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the default fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
/// - parameter c: The third element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func FixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?) -> FixedOptional3Collection<T> {
    return FixedOptional3Collection<T>(
      a,
      b,
      c
    )
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptionalCollection - Arity 4
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the default fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
/// - parameter c: The third element in the collection.
/// - parameter d: The fourth element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func FixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?,
  _ d: T?) -> FixedOptional4Collection<T> {
    return FixedOptional4Collection<T>(
      a,
      b,
      c,
      d
    )
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptionalCollection - Arity 5
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the default fixed collection of this specific arity.
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
public func FixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?,
  _ d: T?,
  _ e: T?) -> FixedOptional5Collection<T> {
    return FixedOptional5Collection<T>(
      a,
      b,
      c,
      d,
      e
    )
}

// ------------------------------------------------------------------------ //
// MARK: FixedOptionalCollection - Arity 6
// ------------------------------------------------------------------------ //

/// Pseudo-constructor for the default fixed collection of this specific arity.
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
public func FixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?,
  _ d: T?,
  _ e: T?,
  _ f: T?) -> FixedOptional6Collection<T> {
    return FixedOptional6Collection<T>(
      a,
      b,
      c,
      d,
      e,
      f
    )
}

// -------------------------------------------------------------------------- //
// MARK: FixedOptionalCollection - Arity 7
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the default fixed collection of this specific arity.
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
public func FixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?,
  _ d: T?,
  _ e: T?,
  _ f: T?,
  _ g: T?) -> FixedOptional7Collection<T> {
    return FixedOptional7Collection<T>(
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
// MARK: FixedOptionalCollection - Arity 8
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the default fixed collection of this specific arity.
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
public func FixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?,
  _ d: T?,
  _ e: T?,
  _ f: T?,
  _ g: T?,
  _ h: T?) -> FixedOptional8Collection<T> {
    return FixedOptional8Collection<T>(
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
// MARK: FixedOptionalCollection - Arity 9
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the default fixed collection of this specific arity.
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
public func FixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?,
  _ d: T?,
  _ e: T?,
  _ f: T?,
  _ g: T?,
  _ h: T?,
  _ i: T?) -> FixedOptional9Collection<T> {
    return FixedOptional9Collection<T>(
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