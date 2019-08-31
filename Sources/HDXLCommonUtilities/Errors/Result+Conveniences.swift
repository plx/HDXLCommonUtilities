//
//  Result+Conveniences.swift
//

import Foundation

public extension Result {

  /// Convenience to either (a) get the success-case value or (b) *throw* a
  /// *transformation* of the failure-case's error. More-concise than the `getOrWrapError`
  /// method, but in my experience the inferencer can have issues with this form.
  ///
  /// - parameter wrapper: A closure "promoting" `Failure` to the desired (wrapper) `Error`-type `E`.
  ///
  /// - returns: A the value in the success branch; *throws* the wrapped error if we're actually the failure branch.
  ///
  @inlinable
  func getOrWrap<E:Error>(
    using wrapper: (Failure) -> E) throws -> Success {
    switch self {
    case .success(let success):
      return success
    case .failure(let failure):
      throw wrapper(failure)
    }
  }

  /// Convenience to either (a) get the success-case value or (b) *throw* a
  /// *transformation* of the failure-case's error. Analogous to `getOrWrap` but
  /// (a) easier on the inferencer and (b) more self-documenting.
  ///
  /// - parameter type: The `Error`-type to-which the failure branch should be promoted.
  /// - parameter wrapper: A closure "promoting" `Failure` to the desired (wrapper) `Error`-type `E`.
  ///
  /// - returns: A the value in the success branch; *throws* the wrapped error if we're actually the failure branch.
  ///
  @inlinable
  func getOrWrapError<E:Error>(
    in error: E.Type,
    using wrapper: (Failure) -> E) throws -> Success {
    switch self {
    case .success(let success):
      return success
    case .failure(let failure):
      throw wrapper(failure)
    }
  }

  /// Returns `self` with a change in error representation (but with success
  /// values passed through without modification).
  ///
  /// The original motivation has to do with tasklets (and similar step-by-step
  /// workflows), wherein each step (a) vends a step-specific error on failure,
  /// but then (b) such "detail errors" are then wrapped into a summary error.
  ///
  /// - parameter type: The `Error`-type to-which the failure branch should be promoted.
  /// - parameter wrapper: A closure "promoting" `Failure` to the desired (wrapper) `Error`-type `E`.
  ///
  /// - returns: A result derived from `self` by transformign the failure case as per request.
  ///
  /// - note: Passing in the `type` like this helps with inference but is *mostly* about making the code self-documenting.
  /// - note: I really want to use `as` instead of `using` but don't want to deal with using `` and with bad syntax highlighting in simpler editors.
  ///
  @inlinable
  func withErrorPromoted<E:Error>(
    to type: E.Type,
    using wrapper: (Failure) -> E) -> Result<Success,E> {
    switch self {
    case .success(let success):
      return .success(success)
    case .failure(let failure):
      return .failure(wrapper(failure))
    }
  }
  
}
