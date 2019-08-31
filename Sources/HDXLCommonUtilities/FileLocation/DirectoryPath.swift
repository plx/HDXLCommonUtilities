//
//  DirectoryPath.swift
//  

import Foundation

// -------------------------------------------------------------------------- //
// MARK: DirectoryPath - Definition
// -------------------------------------------------------------------------- //

/// Type specifically represesenting a *directory-path* as a sequence of individual
/// path components: `/Users/whoever/Documents` would thus become `[Users, whoever, documents]`
/// when represented as a `DirectoryPath`; the point of the type is essentially
/// to *certify* that its contents are valid.
///
/// This is a utility type that exists to support the `DynamicDirectoryLocation` system
/// and not intended for widespread use; it's public only b/c of the need to expose
/// it within the `DynamicDirectoryLocation` API.
public struct DirectoryPath {
  
  /// Underlying storage: array-of-strings.
  @usableFromInline
  internal var storage: [String]
  
  /// Read-only public access to the contained components.
  @inlinable
  public var pathComponents: [String] {
    get {
      return self.storage
    }
  }
  
  /// Construct the `DirectoryPath`.
  @inlinable
  public init() {
    self.init(
      pathComponents: []
    )
  }
  
  /// Construct the `DirectoryPath`.
  @inlinable
  public init(pathComponents: [String]) {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(pathComponents.allSatisfy({$0.isValidDirectoryPathComponent}))
    defer { pedantic_assert(self.isValid) }
    // /////////////////////////////////////////////////////////////////////////
    self.storage = pathComponents
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DirectoryPath - Validatable
// -------------------------------------------------------------------------- //

extension DirectoryPath : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      return self.storage.allSatisfy({$0.isValidDirectoryPathComponent})
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DirectoryPath - Equatable
// -------------------------------------------------------------------------- //

extension DirectoryPath : Equatable {
  
  @inlinable
  public static func ==(
    lhs: DirectoryPath,
    rhs: DirectoryPath) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage == rhs.storage
  }

  @inlinable
  public static func !=(
    lhs: DirectoryPath,
    rhs: DirectoryPath) -> Bool {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(lhs.isValid)
    pedantic_assert(rhs.isValid)
    // /////////////////////////////////////////////////////////////////////////
    return lhs.storage != rhs.storage
  }

}

// -------------------------------------------------------------------------- //
// MARK: DirectoryPath - Hashable
// -------------------------------------------------------------------------- //

extension DirectoryPath : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.storage.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DirectoryPath - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension DirectoryPath : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      return "[ \(self.storage.joined(separator: ", ")) ]"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DirectoryPath - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension DirectoryPath : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      let components = self.storage.lazy.map({ "\"\($0)\"" }).joined(separator: ", ")
      return "DirectoryPath(pathComponents: [ \(components) ])"
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: DirectoryPath - Codable
// -------------------------------------------------------------------------- //

extension DirectoryPath : Codable {
  
  // synthesized ok
  
}
