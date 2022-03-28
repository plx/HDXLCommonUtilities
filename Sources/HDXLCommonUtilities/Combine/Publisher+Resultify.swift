//
//  Publisher+Resultify.swift
//

import Foundation
import Combine

public extension Publisher {
  
  @inlinable
  func resultify() -> AnyPublisher<Result<Self.Output,Self.Failure>,Never> {
    return self
      .map() {
        (success: Output) -> Result<Self.Output,Self.Failure>
        in
        return .success(success)
      }
      .catch() {
        (failure: Failure) -> AnyPublisher<Result<Self.Output,Self.Failure>, Never>
        in
        return Just(
          .failure(failure)
        ).eraseToAnyPublisher()
      }.eraseToAnyPublisher()
  }
  
}
