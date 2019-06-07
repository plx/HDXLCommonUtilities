//
//  NSFileCoordinator+Convenience.swift
//

import Foundation

public extension NSFileCoordinator {
  
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
