//
//  Tasklet.swift
//

import Foundation

/// A `Tasklet` corresponds to a short, synchronous, "micro-operation": a single,
/// *synchronous* step within a longer pipeline. The motivation for the `Tasklet`
/// API is to make it easier to deal with file coordination, core data, and other
/// similar APIs: you need to perform your work while on a particular queue, often
/// only accessible indirectly (e.g. via a closure-accepting API); at the same time,
/// however, the *logic* could easily extracted for testing, and all that.
///
/// The natural way to do this is to factor the specific task into the "setup"
/// code that gets itself into the appropriate context to then call the "logic"
/// code; this `Tasklet` API exists to have a unified name/type/etc. for the "logic"
/// portion of that breakdown--and to have it be an abstraction, suitable for use
/// with generic infrastructure, helpers, and so on and so forth.
///
/// That all said, note that `Tasklet` is a bit like `Sequence` in that it doesn't
/// *guarantee* you *can* call the same concrete tasklet more than once; for most
/// tasklets I suspect you can, safely, but this isn't part of the API contract.
/// Code that *uses* tasklets must keep that in mind.
///
public protocol Tasklet {
  
  /// The *input* given to the task.
  associatedtype Input
  
  /// The *output* produced when the task executes successfully.
  associatedtype Output
  
  /// The *error* produced when task execution fails.
  associatedtype Failure: Error
  
  /// Shorthand for the return type of a `Tasklet`.
  typealias Outcome = Result<Output,Failure>
  
  /// Core, only API method: given `Input`, produce either `Output` or `Failure`.
  ///
  /// - note: Behavior when calling this multiple times is undefined: concrete types *can* be "re-callable" but unknown types *cannot* be *assumed* to be.
  func execute(upon input: Input) -> Outcome
  
}

public extension Tasklet {
  
  /// Convenience to execute `self` as returning `Output`, throwing error upon failure. 
  @inlinable
  func tryExecute(upon input: Input) throws -> Output {
    switch self.execute(upon: input) {
    case .success(let output):
      return output
    case .failure(let error):
      throw error
    }
  }
  
}
