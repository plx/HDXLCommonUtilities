//
//  Sum4+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

public struct Sum4View<A:View,B:View,C:View,D:View>: View {
  
  @usableFromInline
  internal typealias Storage = Sum4<A,B,C,D>
  
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
    case .d(let view):
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
