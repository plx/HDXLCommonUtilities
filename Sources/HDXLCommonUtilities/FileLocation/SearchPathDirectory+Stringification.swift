//
//  SearchPathDirectory+Stringification.swift
//

import Foundation

public extension FileManager.SearchPathDirectory {
  
  /// Returns what `description` *should* return, if it were defined on this type.
  ///
  /// - note: We can't safely have `FileManager.SearchPathDirectory` conform to `CustomStringConvertible` (etc.) b/c we can't safely add protocol conformances in cases for which we neither (a) control the type nor (b) own the protocol.
  @inlinable
  var readableStringification: String {
    get {
      switch self {
      case .applicationDirectory:
        return ".applicationDirectory"
      case .demoApplicationDirectory:
        return ".demoApplicationDirectory"
      case .developerApplicationDirectory:
        return ".developerApplicationDirectory"
      case .adminApplicationDirectory:
        return ".adminApplicationDirectory"
      case .libraryDirectory:
        return ".libraryDirectory"
      case .developerDirectory:
        return ".developerDirectory"
      case .userDirectory:
        return ".userDirectory"
      case .documentationDirectory:
        return ".documentationDirectory"
      case .documentDirectory:
        return ".documentDirectory"
      case .coreServiceDirectory:
        return ".coreServiceDirectory"
      case .autosavedInformationDirectory:
        return ".autosavedInformationDirectory"
      case .desktopDirectory:
        return ".desktopDirectory"
      case .cachesDirectory:
        return ".cachesDirectory"
      case .applicationSupportDirectory:
        return ".applicationSupportDirectory"
      case .downloadsDirectory:
        return ".downloadsDirectory"
      case .inputMethodsDirectory:
        return ".inputMethodsDirectory"
      case .moviesDirectory:
        return ".moviesDirectory"
      case .musicDirectory:
        return ".musicDirectory"
      case .picturesDirectory:
        return ".picturesDirectory"
      case .printerDescriptionDirectory:
        return ".printerDescriptionDirectory"
      case .sharedPublicDirectory:
        return ".sharedPublicDirectory"
      case .preferencePanesDirectory:
        return ".preferencePanesDirectory"
      case .applicationScriptsDirectory:
        return ".applicationScriptsDirectory"
      case .itemReplacementDirectory:
        return ".itemReplacementDirectory"
      case .allApplicationsDirectory:
        return ".allApplicationsDirectory"
      case .allLibrariesDirectory:
        return ".allLibrariesDirectory"
      case .trashDirectory:
        return ".trashDirectory"
      @unknown default:
        return "unknown search-path-directory with raw value \(self.rawValue)"
      }
    }
  }

  /// Returns what `description` *should* return, if it were defined on this type.
  ///
  /// - note: We can't safely have `FileManager.SearchPathDirectory` conform to `CustomStringConvertible` (etc.) b/c we can't safely add protocol conformances in cases for which we neither (a) control the type nor (b) own the protocol.
  @inlinable
  var debugStringification: String {
    get {
      switch self {
      case .applicationDirectory:
        return "FileManager.SearchPathDirectory.applicationDirectory"
      case .demoApplicationDirectory:
        return "FileManager.SearchPathDirectory.demoApplicationDirectory"
      case .developerApplicationDirectory:
        return "FileManager.SearchPathDirectory.developerApplicationDirectory"
      case .adminApplicationDirectory:
        return "FileManager.SearchPathDirectory.adminApplicationDirectory"
      case .libraryDirectory:
        return "FileManager.SearchPathDirectory.libraryDirectory"
      case .developerDirectory:
        return "FileManager.SearchPathDirectory.developerDirectory"
      case .userDirectory:
        return "FileManager.SearchPathDirectory.userDirectory"
      case .documentationDirectory:
        return "FileManager.SearchPathDirectory.documentationDirectory"
      case .documentDirectory:
        return "FileManager.SearchPathDirectory.documentDirectory"
      case .coreServiceDirectory:
        return "FileManager.SearchPathDirectory.coreServiceDirectory"
      case .autosavedInformationDirectory:
        return "FileManager.SearchPathDirectory.autosavedInformationDirectory"
      case .desktopDirectory:
        return "FileManager.SearchPathDirectory.desktopDirectory"
      case .cachesDirectory:
        return "FileManager.SearchPathDirectory.cachesDirectory"
      case .applicationSupportDirectory:
        return "FileManager.SearchPathDirectory.applicationSupportDirectory"
      case .downloadsDirectory:
        return "FileManager.SearchPathDirectory.downloadsDirectory"
      case .inputMethodsDirectory:
        return "FileManager.SearchPathDirectory.inputMethodsDirectory"
      case .moviesDirectory:
        return "FileManager.SearchPathDirectory.moviesDirectory"
      case .musicDirectory:
        return "FileManager.SearchPathDirectory.musicDirectory"
      case .picturesDirectory:
        return "FileManager.SearchPathDirectory.picturesDirectory"
      case .printerDescriptionDirectory:
        return "FileManager.SearchPathDirectory.printerDescriptionDirectory"
      case .sharedPublicDirectory:
        return "FileManager.SearchPathDirectory.sharedPublicDirectory"
      case .preferencePanesDirectory:
        return "FileManager.SearchPathDirectory.preferencePanesDirectory"
      case .applicationScriptsDirectory:
        return "FileManager.SearchPathDirectory.applicationScriptsDirectory"
      case .itemReplacementDirectory:
        return "FileManager.SearchPathDirectory.itemReplacementDirectory"
      case .allApplicationsDirectory:
        return "FileManager.SearchPathDirectory.allApplicationsDirectory"
      case .allLibrariesDirectory:
        return "FileManager.SearchPathDirectory.allLibrariesDirectory"
      case .trashDirectory:
        return "FileManager.SearchPathDirectory.trashDirectory"
      @unknown default:
        return "@unknown FileManager.SearchPathDirectory(rawValue: \(self.rawValue))"
      }
    }
  }

}
