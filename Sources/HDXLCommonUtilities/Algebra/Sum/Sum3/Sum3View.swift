//
//  Sum3+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

public struct Sum3View<A:View,B:View,C:View>: View {
  
  @usableFromInline
  internal typealias Storage = Sum3<A,B,C>
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal func obtainStorageView() -> AnyView {
    switch self.storage {
    case .a(let view):
      return AnyView(view)
    case .b(let view):
      return AnyView(view)
    case .c(let view):
      return AnyView(view)
    }
  }
  
  @inlinable
  public var body: some View {
    get {
      self.obtainStorageView()
    }
  }
  
}
