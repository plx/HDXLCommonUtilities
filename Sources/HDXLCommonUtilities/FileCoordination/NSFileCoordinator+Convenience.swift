//
//  NSFileCoordinator+Convenience.swift
//

import Foundation

public extension NSFileCoordinator {
  
  /// Generic, Swifty-er wrapper around `NSFileCoordinator.coordinate(readingItemAt:options:byAccessor:)`.
  ///
  /// For specific uses you may find specialized wrappers around this method more suitable.
  ///
  /// - parameter url: The URL of the item to read
  /// - parameter options: Options to express the reading intent.
  /// - parameter reader: The closure within-which you gain coordinated access to the item at `url`, if you do.
  ///
  /// - returns: The value returned from your closure, on success; throws an error on failure.
  ///
  /// - throws: a `FileCoordinationError` if either (a) the coordinator throws an error or (b) your closure encounters an error.
  ///
  /// - warning: This *is* a synchronous method and it will block the calling thread until complete.
  ///
  /// - todo: Consider capturing the callsite and accepting an optional `OSLog` (into which events get automatically-logged).
  ///
  @inlinable
  func synchronouslyCoordinate<R>(
    readingItemAt url: URL,
    options: NSFileCoordinator.ReadingOptions = [],
    byAccessor reader: (URL) throws -> R) throws -> R {
    var coordinationError: NSError? = nil
    var transactionError: Error? = nil
    var result: R? = nil
    self.coordinate(
      readingItemAt: url,
      options: options,
      error: &coordinationError) {
        (accessURL: URL) -> Void
        in
        do {
          result = try reader(accessURL)
        }
        catch let e {
          transactionError = e
        }
    }
    return try reportCoordinationResult(
      coordinationError: coordinationError,
      transactionError: transactionError,
      transactionResult: result
    )
  }

  /// Generic, Swifty-er wrapper around `NSFileCoordinator.coordinate(writingItemAt:options:byAccessor:)`.
  ///
  /// For specific uses you may find specialized wrappers around this method more suitable.
  ///
  /// - parameter url: The URL of the item to write
  /// - parameter options: Options to express the writing intent.
  /// - parameter reader: The closure within-which you gain coordinated access to the item at `url`, if you do.
  ///
  /// - returns: The value returned from your closure, on success; throws an error on failure.
  ///
  /// - throws: a `FileCoordinationError` if either (a) the coordinator throws an error or (b) your closure encounters an error.
  ///
  /// - warning: This *is* a synchronous method and it will block the calling thread until complete.
  /// - warning: Per docs, `NSFileCoordinator.WritingOptions` are mutually-exclusive; prefer the special-purpose wrappers to calling this method directly.
  ///
  /// - todo: Consider capturing the callsite and accepting an optional `OSLog` (into which events get automatically-logged).
  ///
  @inlinable
  func synchronouslyCoordinate<R>(
    writingItemAt url: URL,
    options: NSFileCoordinator.WritingOptions = [],
    byAccessor writer: (URL) throws -> R) throws -> R {
    var coordinationError: NSError? = nil
    var transactionError: Error? = nil
    var result: R? = nil
    self.coordinate(
      writingItemAt: url,
      options: options,
      error: &coordinationError) {
        (accessURL: URL) -> Void
        in
        do {
          result = try writer(accessURL)
        }
        catch let e {
          transactionError = e
        }
    }
    return try reportCoordinationResult(
      coordinationError: coordinationError,
      transactionError: transactionError,
      transactionResult: result
    )
  }

  /// Generic, Swifty-er wrapper around `NSFileCoordinator.coordinate(readingItemAt:options:writingItemAt:options:byAccessor:)`.
  ///
  /// For specific uses you may find specialized wrappers around this method more suitable.
  ///
  /// - parameter readingURL: The URL of the item to read
  /// - parameter readingOptions: Options to express the reading intent.
  /// - parameter writingURL: The URL of the item to write
  /// - parameter writingOptions: Options to express the writing intent.
  /// - parameter reader: The closure within-which you gain coordinated access to the requested items, if you do.
  ///
  /// - returns: The value returned from your closure, on success; throws an error on failure.
  ///
  /// - throws: a `FileCoordinationError` if either (a) the coordinator throws an error or (b) your closure encounters an error.
  ///
  /// - warning: This *is* a synchronous method and it will block the calling thread until complete.
  /// - warning: Per docs, `NSFileCoordinator.WritingOptions` are mutually-exclusive; be careful!
  ///
  /// - todo: Consider capturing the callsite and accepting an optional `OSLog` (into which events get automatically-logged).
  ///
  @inlinable
  func synchronouslyCoordinate<R>(
    readingItemAt readingURL: URL,
    options readingOptions: NSFileCoordinator.ReadingOptions = [],
    writingItemAt writingURL: URL,
    options writingOptions: NSFileCoordinator.WritingOptions = [],
    byAccessor readerWriter: (URL,URL) throws -> R) throws -> R {
    var coordinationError: NSError? = nil
    var transactionError: Error? = nil
    var result: R? = nil
    self.coordinate(
      readingItemAt: readingURL,
      options: readingOptions,
      writingItemAt: writingURL,
      options: writingOptions,
      error: &coordinationError) {
        (readingAccessURL: URL, writingAccessURL: URL) -> Void
        in
        do {
          result = try readerWriter(readingAccessURL,writingAccessURL)
        }
        catch let e {
          transactionError = e
        }
    }
    return try reportCoordinationResult(
      coordinationError: coordinationError,
      transactionError: transactionError,
      transactionResult: result
    )
  }

  /// Generic, Swifty-er wrapper around `NSFileCoordinator.coordinate(writingItemAt:options:writingItemAt:options:byAccessor:)`.
  ///
  /// For specific uses you may find specialized wrappers around this method more suitable.
  ///
  /// - parameter writingURL1: The URL of the first item to write.
  /// - parameter options1: Options to express the writing intent for the first item.
  /// - parameter writingURL2: The URL of the second item to write
  /// - parameter options2: Options to express the writing intent for the second item.
  /// - parameter reader: The closure within-which you gain coordinated access to the requested items, if you do.
  ///
  /// - returns: The value returned from your closure, on success; throws an error on failure.
  ///
  /// - throws: a `FileCoordinationError` if either (a) the coordinator throws an error or (b) your closure encounters an error.
  ///
  /// - warning: This *is* a synchronous method and it will block the calling thread until complete.
  /// - warning: Per docs, `NSFileCoordinator.WritingOptions` are mutually-exclusive; be careful!
  ///
  /// - todo: Consider capturing the callsite and accepting an optional `OSLog` (into which events get automatically-logged).
  ///
  @inlinable
  func synchronouslyCoordinate<R>(
    writingItemAt writingURL1: URL,
    options options1: NSFileCoordinator.WritingOptions = [],
    writingItemAt writingURL2: URL,
    options options2: NSFileCoordinator.WritingOptions = [],
    byAccessor writer: (URL,URL) throws -> R) throws -> R {
    var coordinationError: NSError? = nil
    var transactionError: Error? = nil
    var result: R? = nil
    self.coordinate(
      writingItemAt: writingURL1,
      options: options1,
      writingItemAt: writingURL2,
      options: options2,
      error: &coordinationError) {
        (writingAccessURL1: URL, writingAccessURL2: URL) -> Void
        in
        do {
          result = try writer(writingAccessURL1,writingAccessURL2)
        }
        catch let e {
          transactionError = e
        }
    }
    return try reportCoordinationResult(
      coordinationError: coordinationError,
      transactionError: transactionError,
      transactionResult: result
    )
  }
  
}

/// Internal utility for condensing the local variables involved in our coordination wrappers down to either a
/// success or an error.
///
@usableFromInline
internal func reportCoordinationResult<R>(
  coordinationError: NSError?,
  transactionError: Error?,
  transactionResult: R?,
  file: StaticString = #file,
  line: UInt = #line,
  function: StaticString = #function) throws -> R {
  if let coordinationError = coordinationError {
    throw FileCoordinationError.coordinationError(coordinationError)
  } else if let transactionError = transactionError {
    throw FileCoordinationError.transactionError(transactionError)
  } else if let transactionResult = transactionResult {
    return transactionResult
  } else {
    preconditionFailure(
      """
      Got unanticipated all-nil parameters passed-to `reportCoordinationResult<\(String(reflecting: R.self))>` from file \(file), line \(line); in \(function).
      """
    )
  }
}
