//
//  COWFixedOptional.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptionalCollection - Arity 2
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the COW fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func COWFixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?) -> COWFixedOptional2Collection<T> {
    return COWFixedOptional2Collection<T>(
      a,
      b
    )
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptionalCollection - Arity 3
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the COW fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
/// - parameter c: The third element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func COWFixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?) -> COWFixedOptional3Collection<T> {
    return COWFixedOptional3Collection<T>(
      a,
      b,
      c
    )
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptionalCollection - Arity 4
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the COW fixed collection of this specific arity.
///
/// - parameter a: The first element in the collection.
/// - parameter b: The second element in the collection.
/// - parameter c: The third element in the collection.
/// - parameter d: The fourth element in the collection.
///
/// - returns: A fixed-size collection containing `a`, then `b`, and so on.
///
@inlinable
public func COWFixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?,
  _ d: T?) -> COWFixedOptional4Collection<T> {
    return COWFixedOptional4Collection<T>(
      a,
      b,
      c,
      d
    )
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptionalCollection - Arity 5
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the COW fixed collection of this specific arity.
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
public func COWFixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?,
  _ d: T?,
  _ e: T?) -> COWFixedOptional5Collection<T> {
    return COWFixedOptional5Collection<T>(
      a,
      b,
      c,
      d,
      e
    )
}

// ------------------------------------------------------------------------ //
// MARK: COWFixedOptionalCollection - Arity 6
// ------------------------------------------------------------------------ //

/// Pseudo-constructor for the COW fixed collection of this specific arity.
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
public func COWFixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?,
  _ d: T?,
  _ e: T?,
  _ f: T?) -> COWFixedOptional6Collection<T> {
    return COWFixedOptional6Collection<T>(
      a,
      b,
      c,
      d,
      e,
      f
    )
}

// -------------------------------------------------------------------------- //
// MARK: COWFixedOptionalCollection - Arity 7
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the COW fixed collection of this specific arity.
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
public func COWFixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?,
  _ d: T?,
  _ e: T?,
  _ f: T?,
  _ g: T?) -> COWFixedOptional7Collection<T> {
    return COWFixedOptional7Collection<T>(
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
// MARK: COWFixedOptionalCollection - Arity 8
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the COW fixed collection of this specific arity.
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
public func COWFixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?,
  _ d: T?,
  _ e: T?,
  _ f: T?,
  _ g: T?,
  _ h: T?) -> COWFixedOptional8Collection<T> {
    return COWFixedOptional8Collection<T>(
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
// MARK: COWFixedOptionalCollection - Arity 9
// -------------------------------------------------------------------------- //

/// Pseudo-constructor for the COW fixed collection of this specific arity.
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
public func COWFixedOptionalCollection<T>(
  _ a: T?,
  _ b: T?,
  _ c: T?,
  _ d: T?,
  _ e: T?,
  _ f: T?,
  _ g: T?,
  _ h: T?,
  _ i: T?) -> COWFixedOptional9Collection<T> {
    return COWFixedOptional9Collection<T>(
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