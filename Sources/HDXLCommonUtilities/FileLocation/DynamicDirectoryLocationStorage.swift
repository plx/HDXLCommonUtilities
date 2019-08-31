//
//  DynamicDirectoryLocationStorage.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocationStorage - Definition
// -------------------------------------------------------------------------- //

/// Storage for the `DynamicDirectoryLocation` type.
@usableFromInline
internal final class DynamicDirectoryLocationStorage {

  // ------------------------------------------------------------------------ //
  // MARK: Stored Properties
  // ------------------------------------------------------------------------ //

  @usableFromInline
  internal var directoryOrigin: DirectoryOrigin {
    didSet {
      // nullification expected to trigger cascade nullifying `_directoryLocationURL`:
      self._directoryOriginURL.nullify(
        when: self.directoryOrigin != oldValue
      )
    }
  }
  
  @usableFromInline
  internal var containerPath: DirectoryPath {
    didSet {
      self._directoryLocationURL.nullify(
        when: self.directoryPath != oldValue
      )
    }
  }
  
  @usableFromInline
  internal var directoryPath: DirectoryPath {
    didSet {
      self._directoryLocationURL.nullify(
        when: self.directoryPath != oldValue
      )
    }
  }

  // ------------------------------------------------------------------------ //
  // MARK: Derived Property Management
  // ------------------------------------------------------------------------ //
  
  @inlinable
  internal func resetCachedProperties() {
    self._directoryOriginURL = nil
    self._directoryLocationURL = nil
  }
  
  @inlinable
  internal func resetDirectoryLocationURL() {
    self._directoryLocationURL = nil
  }

  // ------------------------------------------------------------------------ //
  // MARK: Derived Property Caches
  // ------------------------------------------------------------------------ //

  @usableFromInline
  internal var _directoryOriginURL: URL? = nil {
    didSet {
      self._directoryLocationURL.nullify(
        when: self._directoryLocationURL != oldValue
      )
    }
  }
  
  @usableFromInline
  internal var _directoryLocationURL: URL? = nil
  
  // ------------------------------------------------------------------------ //
  // MARK: Derived-Property Access
  // ------------------------------------------------------------------------ //

  @inlinable
  internal var directoryOriginURL: URL {
    get {
      return self._directoryOriginURL.obtainAssuredValue(
        fallingBackUpon: self.directoryOrigin.generateOriginURL()
      )
    }
  }
  
  
  @inlinable
  internal var directoryLocationURL: URL {
    get {
      return self._directoryLocationURL.obtainAssuredValue(
        fallingBackUpon: self.directoryOriginURL.appendingPathComponents(
          self.containerPath,
          self.directoryPath
        )
      )
    }
  }
  
  // ------------------------------------------------------------------------ //
  // MARK: Initialization
  // ------------------------------------------------------------------------ //
  
  @inlinable
  internal required init(
    directoryOrigin: DirectoryOrigin,
    containerPath: DirectoryPath,
    directoryPath: DirectoryPath) {
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.directoryOrigin = directoryOrigin
    self.containerPath = containerPath
    self.directoryPath = directoryPath
  }

  @inlinable
  internal convenience init(
    directoryOrigin: DirectoryOrigin,
    directoryPath: DirectoryPath) {
    // /////////////////////////////////////////////////////////////////////////
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.init(
      directoryOrigin: directoryOrigin,
      containerPath: DirectoryPath(),
      directoryPath: directoryPath
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocationStorage - With-Derivation
// -------------------------------------------------------------------------- //

internal extension DynamicDirectoryLocationStorage {

  /// This (a) copies the existing object, (b) copies over any *cached* derived
  /// properties, and then (c) applies the mutation.
  ///
  /// We do this, here, specifically to *preserve* any dynamically-generated URL
  /// from being *needlessly lost*.
  ///
  /// It probably will, anyways, but the theory is like if you have `location2 = location;`
  /// then `location.directoryPath = newPath`, you'd want the origin to stay the same
  /// *if possible*.
  ///
  /// I think. I'm actually not sure, but it sounds reasonable and we'll see how it goes.
  @inlinable
  func obtainMutatedClone(mutation: (DynamicDirectoryLocationStorage) -> Void) -> DynamicDirectoryLocationStorage {
    let clone = DynamicDirectoryLocationStorage(
      directoryOrigin: self.directoryOrigin,
      containerPath: self.containerPath,
      directoryPath: self.directoryPath
    )
    clone._directoryOriginURL = self._directoryOriginURL
    clone._directoryLocationURL = self._directoryLocationURL
    mutation(clone)
    return clone
  }
  
  @inlinable
  func with(
    directoryOrigin: DirectoryOrigin,
    ensureUniqueCopy: Bool = false) -> DynamicDirectoryLocationStorage {
    guard
      ensureUniqueCopy || directoryOrigin != self.directoryOrigin else {
        return self
    }
    return self.obtainMutatedClone() {
      $0.directoryOrigin = directoryOrigin
    }
  }

  @inlinable
  func with(
    containerPath: DirectoryPath,
    ensureUniqueCopy: Bool = false) -> DynamicDirectoryLocationStorage {
    guard
      ensureUniqueCopy || containerPath != self.containerPath else {
        return self
    }
    return self.obtainMutatedClone() {
      $0.containerPath = containerPath
    }
  }
  
  @inlinable
  func with(
    directoryPath: DirectoryPath,
    ensureUniqueCopy: Bool = false) -> DynamicDirectoryLocationStorage {
    guard
      ensureUniqueCopy || directoryPath != self.directoryPath else {
        return self
    }
    return self.obtainMutatedClone() {
      $0.directoryPath = directoryPath
    }
  }

}

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocationStorage - Validatable
// -------------------------------------------------------------------------- //

extension DynamicDirectoryLocationStorage : Validatable {
  
  @inlinable
  internal var isValid: Bool {
    get {
      guard
        self.directoryOrigin.isValid,
        self.containerPath.isValid,
        self.directoryPath.isValid else {
          return false
      }
      return true
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocationStorage - Equatable
// -------------------------------------------------------------------------- //

extension DynamicDirectoryLocationStorage : Equatable {
  
  @inlinable
  internal static func ==(
    lhs: DynamicDirectoryLocationStorage,
    rhs: DynamicDirectoryLocationStorage) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard lhs !== rhs else {
      return true
    }
    guard
      lhs.directoryOrigin == rhs.directoryOrigin,
      lhs.containerPath == rhs.containerPath,
      lhs.directoryPath == rhs.directoryPath else {
        return false
    }
    return true
  }

  @inlinable
  internal static func !=(
    lhs: DynamicDirectoryLocationStorage,
    rhs: DynamicDirectoryLocationStorage) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    guard lhs !== rhs else {
      return false
    }
    guard
      lhs.directoryOrigin == rhs.directoryOrigin,
      lhs.containerPath == rhs.containerPath,
      lhs.directoryPath == rhs.directoryPath else {
        return true
    }
    return false
  }

}

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocationStorage - Hashable
// -------------------------------------------------------------------------- //

extension DynamicDirectoryLocationStorage : Hashable {
  
  @inlinable
  internal func hash(into hasher: inout Hasher) {
    self.directoryOrigin.hash(into: &hasher)
    self.containerPath.hash(into: &hasher)
    self.directoryPath.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocationStorage - Codable
// -------------------------------------------------------------------------- //

extension DynamicDirectoryLocationStorage : Codable {
  
  /// - note: I *think* this is necessary b/c ehre we only serialize a subset of the defined properties.
  @usableFromInline
  internal enum CodingKeys: String, CodingKey {
    
    case directoryOrigin = "directoryOrigin"
    case containerPath = "containerPath"
    case directoryPath = "directoryPath"
    
    @inlinable
    internal var intValue: Int {
      get {
        switch self {
        case .directoryOrigin:
          return 0
        case .containerPath:
          return 1
        case .directoryPath:
          return 2
        }
      }
    }
    
    @inlinable
    internal init?(intValue: Int) {
      switch intValue {
      case 0:
        self = .directoryOrigin
      case 1:
        self = .containerPath
      case 2:
        self = .directoryPath
      default:
        return nil
      }
    }
    
  }
  
  @inlinable
  internal func encode(to encoder: Encoder) throws {
    var values = encoder.container(
      keyedBy: CodingKeys.self
    )
    try values.encode(
      self.directoryOrigin,
      forKey: .directoryOrigin
    )
    try values.encode(
      self.containerPath,
      forKey: .containerPath
    )
    try values.encode(
      self.directoryPath,
      forKey: .directoryPath
    )
  }
  
  @inlinable
  internal convenience init(from decoder: Decoder) throws {
    let values = try decoder.container(
      keyedBy: CodingKeys.self
    )
    self.init(
      directoryOrigin: try values.decode(
        DirectoryOrigin.self,
        forKey: .directoryOrigin
      ),
      containerPath: try values.decode(
        DirectoryPath.self,
        forKey: .containerPath
      ),
      directoryPath: try values.decode(
        DirectoryPath.self,
        forKey: .directoryPath
      )
    )
  }
  
}
