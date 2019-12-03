//
//  FileStatus.swift
//

import Foundation

// -------------------------------------------------------------------------- //
// MARK: FileStatus - Definition
// -------------------------------------------------------------------------- //

/// Enumeration of the possible "state" of a file (path). Note that the nature
/// of file systems means that, in general, the information conveyed by this type
/// will not necessarily remain stable for very long...but it's still convenient
/// to have a type like this around for doing "right now" status-checks.
///
@objc(HDXLFileStatus)
public enum FileStatus : Int {
  
  /// Case for when nothing is present.
  case doesNotExist
  
  /// Case for when a file exists.
  case existsAsFile
  
  /// Case for when a directory exists.
  case existsAsDirectory
  
}

// -------------------------------------------------------------------------- //
// MARK: FileStatus - Support
// -------------------------------------------------------------------------- //

public extension FileStatus {
  
  /// `true` iff *something* exists.
  @inlinable
  var impliesExistence: Bool {
    get {
      switch self {
      case .doesNotExist:
        return false
      case .existsAsFile:
        return true
      case .existsAsDirectory:
        return true
      }
    }
  }

  /// `true` iff *nothing* exists.
  @inlinable
  var impliesAbsence: Bool {
    get {
      switch self {
      case .doesNotExist:
        return true
      case .existsAsFile:
        return false
      case .existsAsDirectory:
        return false
      }
    }
  }

  /// `true` iff a file exists.
  @inlinable
  var isFile: Bool {
    get {
      switch self {
      case .doesNotExist:
        return false
      case .existsAsFile:
        return true
      case .existsAsDirectory:
        return false
      }
    }
  }

  /// `true` iff a directory exists.
  @inlinable
  var isDirectory: Bool {
    get {
      switch self {
      case .doesNotExist:
        return false
      case .existsAsFile:
        return false
      case .existsAsDirectory:
        return true
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FileStatus - Equatable
// -------------------------------------------------------------------------- //

extension FileStatus : Equatable {
  
  @inlinable
  public static func ==(
    lhs: FileStatus,
    rhs: FileStatus) -> Bool {
    return lhs.rawValue == rhs.rawValue
  }

}

// -------------------------------------------------------------------------- //
// MARK: FileStatus - Hashable
// -------------------------------------------------------------------------- //

extension FileStatus : Hashable {
  
  @inlinable
  public func hash(into hasher: inout Hasher) {
    self.rawValue.hash(into: &hasher)
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FileStatus - CustomStringConvertible
// -------------------------------------------------------------------------- //

extension FileStatus : CustomStringConvertible {
  
  @inlinable
  public var description: String {
    get {
      switch self {
      case .doesNotExist:
        return ".doesNotExist"
      case .existsAsFile:
        return ".existsAsFile"
      case .existsAsDirectory:
        return ".existsAsDirectory"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FileStatus - CustomDebugStringConvertible
// -------------------------------------------------------------------------- //

extension FileStatus : CustomDebugStringConvertible {
  
  @inlinable
  public var debugDescription: String {
    get {
      switch self {
      case .doesNotExist:
        return "FileStatus.doesNotExist"
      case .existsAsFile:
        return "FileStatus.existsAsFile"
      case .existsAsDirectory:
        return "FileStatus.existsAsDirectory"
      }
    }
  }
  
}

// -------------------------------------------------------------------------- //
// MARK: FileStatus - Codable
// -------------------------------------------------------------------------- //

extension FileStatus : Codable {
  
  // synthesized ok
  
}
