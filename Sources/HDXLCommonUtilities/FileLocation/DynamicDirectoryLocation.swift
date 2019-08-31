//
//  DynamicDirectoryLocation.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocation - Definition
// -------------------------------------------------------------------------- //

/// A "dynamic directory location" allows for specification of a directory in a
/// predictably-determined location that may not, itself, be predictable. It aims
/// to be a simple way of abstracting the common patterns I specifically use when
/// placing application-support items into the filesystem, and thus has some quirks.
///
/// Conceptually it breaks the "directory location" into three independent pieces:
///
/// - the *origin*, referring to the *start* of the path
/// - the *container path*, referring to the *middle* of the path
/// - the *directory path*, referring to the *end* of the path
///
/// ...with the intent being as-follows:
///
/// - the *origin* is something like the root of an application security group, or the application-support directory, and so on
/// - the *container path* is a path *from* that origin *to* the "general vicinity"
/// - the *directory path* is the final, item-specific path
///
/// Concretely, then, the trio might look like this:
///
/// - *origin*: root to container directory for *some* application security group
/// - *container path*: `/data/synchronized/`
/// - *directory path*: `/primary/`
///
/// ...wherein, say, `/data/synchronized/` holds many other related directories
/// and thus is split off separately; it might also be the case that for testing
/// we want to *rebase* the location to start at some randomly-generated temporary
/// directory, and this lets us do that without a lot of error-prone URL mangling.
///
/// Note: `DynamicDirectoryLocation` mostly has value semantics, with one caveat:
/// it "freezes" the dynamic directory location on first access, and then tries to
/// preserve that location when it can (e.g. if you mutate the origin it resets,
/// but it preserves the cached origin if you only mutate the container or directory
/// paths...that kind of thing).
///
/// If this proves more trouble than its worth I'll change the implementation.
///
public struct DynamicDirectoryLocation {
  
  // ------------------------------------------------------------------------ //
  // MARK: Backing Storage
  // ------------------------------------------------------------------------ //
  
  /// Type of the private backing storage.
  @usableFromInline
  internal typealias Storage = DynamicDirectoryLocationStorage
  
  /// Private backing storage.
  @usableFromInline
  internal var storage: Storage

  // ------------------------------------------------------------------------ //
  // MARK: Initialization
  // ------------------------------------------------------------------------ //

  /// Private initializer directly from backing storage.
  @inlinable
  internal init(storage: Storage) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(storage.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.storage = storage
  }

  /// "Designated initializer" requiring all three components.
  ///
  /// - parameter directoryOrigin: Used to specify the *initial segment* of the path.
  /// - parameter containerPath: Used to specify some *intermediate segment* the path.
  /// - parameter directoryPath: The *terminal segment* of the path.
  ///
  /// - returns: A suitably-configured `DynamicDirectoryLocation`.
  ///
  /// - note: See the type-level documentation and property-level documentation for more context on these parameters.
  ///
  @inlinable
  public init(
    directoryOrigin: DirectoryOrigin,
    containerPath: DirectoryPath,
    directoryPath: DirectoryPath) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(directoryOrigin.isValid)
    pedantic_assert(containerPath.isValid)
    pedantic_assert(directoryPath.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.init(
      storage: Storage(
        directoryOrigin: directoryOrigin,
        containerPath: containerPath,
        directoryPath: directoryPath
      )
    )
  }

  /// "Designated initializer" omitting the `containerPath`.
  ///
  /// - parameter directoryOrigin: Used to specify the *initial segment* of the path.
  /// - parameter directoryPath: The *terminal segment* of the path.
  ///
  /// - returns: A suitably-configured `DynamicDirectoryLocation`.
  ///
  /// - note: This exists for those cases in which you don't make use of the `containerPath` functionality.
  ///
  @inlinable
  public init(
    directoryOrigin: DirectoryOrigin,
    directoryPath: DirectoryPath) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(directoryOrigin.isValid)
    pedantic_assert(directoryPath.isValid)
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.init(
      storage: Storage(
        directoryOrigin: directoryOrigin,
        directoryPath: directoryPath
      )
    )
  }

}

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocation - Property Exposure
// -------------------------------------------------------------------------- //

public extension DynamicDirectoryLocation {
  
  /// Retrieves the location of the directory (as a file `URL`).
  ///
  /// - note: Will be stable up to the next mutation; after that, no guarantees.
  ///
  @inlinable
  var directoryLocationURL: URL {
    get {
      return self.storage.directoryLocationURL
    }
  }

  /// Used to specify the *start* of the URL.
  ///
  /// Broken out separately to let us "plug in" an application security group
  /// or temporary directory or fixed location for *start* of the URL, letting
  /// the other two components take on usefully-*relative* semantics.
  @inlinable
  var directoryOrigin: DirectoryOrigin {
    get {
      return self.storage.directoryOrigin
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(newValue.isValid)
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid)}
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      defer { pedantic_assert(self.directoryOrigin == newValue) }
      // ///////////////////////////////////////////////////////////////////////
      if !isKnownUniquelyReferenced(&self.storage) {
        self.storage = self.storage.with(
          directoryOrigin: newValue,
          ensureUniqueCopy: true
        )
      } else {
        self.storage.directoryOrigin = newValue
      }
    }
  }

  /// Used to specify a fixed *intermediate* section of a dynamic directory path.
  ///
  /// This is something I specifically need but don't see others necessarily needing.
  ///
  @inlinable
  var containerPath: DirectoryPath {
    get {
      return self.storage.containerPath
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(newValue.isValid)
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid)}
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      defer { pedantic_assert(self.containerPath == newValue) }
      // ///////////////////////////////////////////////////////////////////////
      if !isKnownUniquelyReferenced(&self.storage) {
        self.storage = self.storage.with(
          containerPath: newValue,
          ensureUniqueCopy: true
        )
      } else {
        self.storage.containerPath = newValue
      }
    }
  }

  /// Used to specify a the *final* section of a dynamic directory path.
  @inlinable
  var directoryPath: DirectoryPath {
    get {
      return self.storage.directoryPath
    }
    set {
      // ///////////////////////////////////////////////////////////////////////
      pedantic_assert(newValue.isValid)
      pedantic_assert(self.isValid)
      defer { pedantic_assert(self.isValid)}
      defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
      defer { pedantic_assert(self.directoryPath == newValue) }
      // ///////////////////////////////////////////////////////////////////////
      if !isKnownUniquelyReferenced(&self.storage) {
        self.storage = self.storage.with(
          directoryPath: newValue,
          ensureUniqueCopy: true
        )
      } else {
        self.storage.directoryPath = newValue
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocation - Validatable
// -------------------------------------------------------------------------- //

extension DynamicDirectoryLocation : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.isValid
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocation - Equatable
// -------------------------------------------------------------------------- //

extension DynamicDirectoryLocation : Equatable {
  
  @inlinable
  public static func ==(
    lhs: DynamicDirectoryLocation,
    rhs: DynamicDirectoryLocation) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }
  
  @inlinable
  public static func !=(
    lhs: DynamicDirectoryLocation,
    rhs: DynamicDirectoryLocation) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }
}

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocation - Hashable
// -------------------------------------------------------------------------- //

extension DynamicDirectoryLocation : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocation - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension DynamicDirectoryLocation : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "\(String(describing: self.directoryOrigin)) => \(String(describing: self.containerPath)) => \(String(describing: self.directoryPath))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocation - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension DynamicDirectoryLocation : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      return "DynamicDirectoryLocation(directoryOrigin: \(String(reflecting: self.directoryOrigin)), containerPath: \(String(reflecting: self.containerPath)), directoryPath: \(String(reflecting: self.directoryPath)))"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DynamicDirectoryLocation - Codable
// -------------------------------------------------------------------------- //

extension DynamicDirectoryLocation : Codable {
  
  // synthesized ok
  
}
