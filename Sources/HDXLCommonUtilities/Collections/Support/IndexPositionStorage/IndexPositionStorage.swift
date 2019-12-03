//
//  IndexPositionStorage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: IndexPositionStorage - Definition
// -------------------------------------------------------------------------- //

/// Internal-use-only enumeration providing a shared implementation of the typical
/// "subscriptable *position* vs non-subscriptable *endIndex*" pattern. It includes
/// baseline implementations of `Validatable`, `Equatable` and `Comparable`, s.t.:
///
/// - `isValid` checks if the individual components are valid
/// - `==` is true *iff* all components are equal (assuming same-case, of course)
/// - `<` uses lexicographic sort on positions, and treats all positions as `<` the end
///
/// The above are reasonably-useful baselines, but many specific indices will want
/// to extend-or-streamline some of the above logic. As such customizations are
/// *typically* only interested in the `.position(_)` cases, I've included an API
/// accepting closures that provide customized logic for that specific case.
///
/// To understand what I mean, when this is used to store the index of an adjacent-n-tuple
/// collection, we can get away with `==` and `<` only-ever examining the first component,
/// b/c the first component determines the rest.
///
/// Note that in a richer language we could just, you know, store *only* that one
/// component when the adjacent n-tuples are sourced from a `RandomAccessCollection`,
/// but Swift isn't *that* granular (at least at this time).
@usableFromInline
internal enum IndexPositionStorage<PositionRepresentation> {
  
  // ------------------------------------------------------------------------ //
  // MARK: Cases
  // ------------------------------------------------------------------------ //
  
  case position(PositionRepresentation)
  case end

}

// -------------------------------------------------------------------------- //
// MARK: IndexPositionStorage - Support
// -------------------------------------------------------------------------- //

internal extension IndexPositionStorage {
  
  @inlinable
  var isEnd: Bool {
    get {
      switch self {
      case .position(_):
        return false
      case .end:
        return true
      }
    }
  }

  @inlinable
  var isPosition: Bool {
    get {
      switch self {
      case .position(_):
        return true
      case .end:
        return false
      }
    }
  }
  
  @inlinable
  var position: PositionRepresentation? {
    get {
      switch self {
      case .position(let position):
        return position
      case .end:
        return nil
      }
    }
  }

  @inlinable
  var indexPositionStorageType: IndexPositionStorageType {
    get {
      switch self {
      case .position(_):
        return .position
      case .end:
        return .end
      }
    }
  }
      
}

// -------------------------------------------------------------------------- //
// MARK: IndexPositionStorage - Customization Support
// -------------------------------------------------------------------------- //

internal extension IndexPositionStorage {
  
  /// Internal customization point to add extended validation to `.position(_)` case.
  /// Meant for use by index types wrapping this value.
  ///
  /// - parameter predicate: An extended-validation predicate to evaluate-against the position, when this is one.
  ///
  /// - returns: `true` iff both (a) `self.isValid` and also (b) self's `.position(_)` payload satisfies `predicate`
  ///
  @inlinable
  func customizedValidation(using predicate: (PositionRepresentation) -> Bool) -> Bool {
    guard self.isValid else {
      return false
    }
    switch self {
    case .position(let position):
      return predicate(position)
    case .end:
      return true
    }
  }
  
  /// Internal customization point to override the equality-checking logic for
  /// just the "`(.position(let l), .position(let r))` case.
  ///
  /// Meant for use by index types wrapping this value.
  ///
  /// - parameter predicate: A predicate to determine whether or not the to treat two `PositionRepresentation` values as equal.
  ///
  /// - returns: `true` iff `self` and `other` have the same case and, further, if they have equal payloads as-per `predicate` (when applicable).
  ///
  @inlinable
  func customizedEquivalence(
    to other: Self,
    using predicate: (PositionRepresentation,PositionRepresentation) -> Bool) -> Bool {
    switch (self,other) {
    case (.position(let this), .position(let that)):
      return predicate(this,that)
    case (.position(_),.end):
      return false
    case (.end, .position(_)):
      return false
    case (.end, .end):
      return true
    }
  }
  
  /// Internal customization point to override the order-determining logic for
  /// just the "`(.position(let l), .position(let r))` case.
  ///
  /// Meant for use by index types wrapping this value.
  ///
  /// - parameter comparator: A comparator providing the ordering relationship between two `PositionRepresentation`.
  ///
  /// - returns: A comparison result, wherein `.end` is after all `.position`s and `comparator` is used to determine the ordering for pairs of positions.
  ///
  @inlinable
  func customizedComparison(
    to other: Self,
    using comparator: (PositionRepresentation,PositionRepresentation) -> ComparisonResult) -> ComparisonResult {
    switch (self,other) {
    case (.position(let this), .position(let that)):
      return comparator(this,that)
    case (.position(_),.end):
      return .orderedAscending
    case (.end, .position(_)):
      return .orderedDescending
    case (.end, .end):
      return .orderedSame
    }
  }
  
  /// Admittedly-awkward internal API aiming for copy-free, in-place mutation.
  ///
  /// The idea, here, is for use with something like `formIndex(before:)`, wherein
  /// the *logic* of *that method* should be:
  ///
  /// - for `.position(_)`, we mutate the position in-place and-then:
  ///   - accept the in-place mutation result
  ///   - become the `endIndex` (won't happen for `formIndex(before:)`, but might elsehwere)
  ///    - crash out due to misnavigation (e.g. b/c we overshot the boundaries)
  /// - for .end, we simply
  @inlinable
  mutating func unsafe_performMutation(
    sendingEndTo destinationForEnd: @autoclosure () -> IndexPositionStorageEndReplacement<PositionRepresentation>,
    mutatingPositionWith positionMutation: (inout PositionRepresentation) -> IndexPositionStoragePositionMutationDetermination) {
    if var position = self.unsafe_temporarilyBecomeEnd() {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(self.isEnd)
      // ///////////////////////////////////////////////////////////////////////
      switch positionMutation(&position) {
      case .success:
        self = .position(position)
      case .becomeEnd:
        self = .end
      case .failure:
        preconditionFailure("Mutation-failure in `unsafe_performMutation(sendingEndTo:mutatingPositionWith:)`!")
      }
    } else {
      switch destinationForEnd() {
      case .position(let position):
        self = .position(position)
      case .end:
        self = .end
      case .misnavigation:
        preconditionFailure("Failed to get replacement for `.end` in `unsafe_performMutation(sendingEndTo:mutatingPositionWith:)`!")
      }
    }
  }
  
  @inlinable
  mutating func unsafe_mandatoryPositionMutation(using mutation: (inout PositionRepresentation) -> IndexPositionStoragePositionMutationDetermination) {
    if var position = self.unsafe_temporarilyBecomeEnd() {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(self.isEnd)
      // ///////////////////////////////////////////////////////////////////////
      switch mutation(&position) {
      case .success:
        self = .position(position)
      case .becomeEnd:
        self = .end
      case .failure:
        preconditionFailure("Mutation-failure in `unsafe_mandatoryPositionMutation(using:)`!")
      }
    } else {
      preconditionFailure("Called `unsafe_mandatoryPositionMutation(using:)` on `.end`!")
    }
  }
  
  @inlinable
  mutating func unsafe_temporarilyBecomeEnd() -> PositionRepresentation? {
    switch self {
    case .position(let position):
      self = .end
      return position
    case .end:
      return nil
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexPositionStorage - Validatable
// -------------------------------------------------------------------------- //

extension IndexPositionStorage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      switch self {
      case .position(let position):
        return isValidOrIndifferent(position)
      case .end:
        return true
      }
    }
  }
    
}

// -------------------------------------------------------------------------- //
// MARK: IndexPositionStorage - Equatable
// -------------------------------------------------------------------------- //

extension IndexPositionStorage : Equatable where PositionRepresentation:Equatable {
  
  @inlinable
  internal static func ==(
    lhs: IndexPositionStorage<PositionRepresentation>,
    rhs: IndexPositionStorage<PositionRepresentation>) -> Bool {
    switch (lhs,rhs) {
    case (.position(let l), .position(let r)):
      return l == r
    case (.position(_), .end):
      return false
    case (.end, .position(_)):
      return false
    case (.end, .end):
      return true
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: IndexPositionStorage - Comparable
// -------------------------------------------------------------------------- //

extension IndexPositionStorage : Comparable where PositionRepresentation:Comparable {
  
  @inlinable
  internal static func <(
    lhs: IndexPositionStorage<PositionRepresentation>,
    rhs: IndexPositionStorage<PositionRepresentation>) -> Bool {
    switch (lhs,rhs) {
    case (.position(let l), .position(let r)):
      return l < r
    case (.position(_), .end):
      return true
    case (.end, .position(_)):
      return false
    case (.end, .end):
      return false
    }
  }

  @inlinable
  internal static func >(
    lhs: IndexPositionStorage<PositionRepresentation>,
    rhs: IndexPositionStorage<PositionRepresentation>) -> Bool {
    switch (lhs,rhs) {
    case (.position(let l), .position(let r)):
      return l > r
    case (.position(_), .end):
      return false
    case (.end, .position(_)):
      return true
    case (.end, .end):
      return false
    }
  }

  @inlinable
  internal static func <=(
    lhs: IndexPositionStorage<PositionRepresentation>,
    rhs: IndexPositionStorage<PositionRepresentation>) -> Bool {
    switch (lhs,rhs) {
    case (.position(let l), .position(let r)):
      return l <= r
    case (.position(_), .end):
      return true
    case (.end, .position(_)):
      return false
    case (.end, .end):
      return true
    }
  }

  @inlinable
  internal static func >=(
    lhs: IndexPositionStorage<PositionRepresentation>,
    rhs: IndexPositionStorage<PositionRepresentation>) -> Bool {
    switch (lhs,rhs) {
    case (.position(let l), .position(let r)):
      return l >= r
    case (.position(_), .end):
      return false
    case (.end, .position(_)):
      return true
    case (.end, .end):
      return true
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: IndexPositionStorage - Hashable
// -------------------------------------------------------------------------- //

extension IndexPositionStorage : Hashable where PositionRepresentation:Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.indexPositionStorageType.hash(into: &hasher)
    switch self {
    case .position(let position):
      position.hash(into: &hasher)
    case .end:
      ();
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexPositionStorage - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension IndexPositionStorage : CustomStringConvertible {
  
  @inlinable
  internal var description: String {
    get {
      switch self {
      case .position(let position):
        return ".position(\(String(describing: position)))"
      case .end:
        return ".end"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexPositionStorage - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension IndexPositionStorage : CustomDebugStringConvertible {
  
  @inlinable
  internal var debugDescription: String {
    get {
      switch self {
      case .position(let position):
        return "IndexPositionStorage<\(String(reflecting: PositionRepresentation.self))>.position(\(String(reflecting: position)))"
      case .end:
        return "IndexPositionStorage<\(String(reflecting: PositionRepresentation.self))>.end"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: IndexPositionStorage - Codable
// -------------------------------------------------------------------------- //

extension IndexPositionStorage : Codable where PositionRepresentation:Codable {
  
  @usableFromInline
  internal typealias CodingKeys = IndexPositionStorageCodingKeys
  
  @inlinable
  internal func encode(to encoder: Encoder) throws {
    var container = encoder.container(
      keyedBy: CodingKeys.self
    )
    try container.encode(
      self.indexPositionStorageType,
      forKey: .type
    )
    switch self {
    case .position(let position):
      try container.encode(
        position,
        forKey: .position
      )
    case .end:
      ();
    }
  }
  
  @inlinable
  internal init(from decoder: Decoder) throws {
    let container = try decoder.container(
      keyedBy: CodingKeys.self
    )
    let type = try container.decode(
      IndexPositionStorageType.self,
      forKey: .type
    )
    switch type {
    case .position:
      self = .position(
        try container.decode(
          PositionRepresentation.self,
          forKey: .position
        )
      )
    case .end:
      self = .end
    }
  }

}

extension IndexPositionStorage : CaseIterable where PositionRepresentation:CaseIterable {
  
  @usableFromInline
  internal typealias AllCases = [IndexPositionStorage<PositionRepresentation>]
  
  // TODO: changeme to `some Collection` and use `Chain2` or similar to avoid allocation
  @inlinable
  internal static var allCases: [IndexPositionStorage<PositionRepresentation>] {
    get {
      var cases: [IndexPositionStorage<PositionRepresentation>] = PositionRepresentation.allCases.map({
        .position($0)
      })
      cases.append(.end)
      return cases
    }
  }
  
}
