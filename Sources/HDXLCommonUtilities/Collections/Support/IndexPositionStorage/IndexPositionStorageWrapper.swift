//
//  IndexPositionStorageWrapper.swift
//

import Foundation

@usableFromInline
internal protocol IndexPositionStorageWrapper {
  
  associatedtype PositionRepresentation
  
  typealias Storage = IndexPositionStorage<PositionRepresentation>
  typealias EndReplacement = IndexPositionStorageEndReplacement<PositionRepresentation>
  typealias PositionMutationDetermination = IndexPositionStoragePositionMutationDetermination
  
  var storage: Storage { get set }
  
  mutating func unsafe_performMutation(
    sendingEndTo destinationForEnd: @autoclosure () -> EndReplacement,
    mutatingPositionWith positionMutation: (inout PositionRepresentation) -> IndexPositionStoragePositionMutationDetermination)

  mutating func unsafe_mandatoryPositionMutation(
    using mutation: (inout PositionRepresentation) -> PositionMutationDetermination)
  
  init(storage: Storage)
  
}

internal extension IndexPositionStorageWrapper {
  
  @inlinable
  init(position: PositionRepresentation) {
    self.init(
      storage: Storage.position(position)
    )
  }
  
  @inlinable
  static var endIndex: Self {
    get {
      return Self(
        storage: Storage.end
      )
    }
  }
  
}

internal extension IndexPositionStorageWrapper {
  
  @inlinable
  mutating func unsafe_performMutation(
    sendingEndTo destinationForEnd: @autoclosure () -> EndReplacement,
    mutatingPositionWith positionMutation: (inout PositionRepresentation) -> IndexPositionStoragePositionMutationDetermination) {
    self.storage.unsafe_performMutation(
      sendingEndTo: destinationForEnd(),
      mutatingPositionWith: positionMutation
    )
  }
  
  @inlinable
  mutating func unsafe_mandatoryPositionMutation(
    using mutation: (inout PositionRepresentation) -> PositionMutationDetermination) {
    self.storage.unsafe_mandatoryPositionMutation(
      using: mutation
    )
  }

}
