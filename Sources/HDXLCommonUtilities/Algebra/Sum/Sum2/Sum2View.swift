//
//  Sum2+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

public struct Sum2View<A:View,B:View>: View {
  
  @usableFromInline
  internal typealias Storage = Sum2<A,B>
  
  @usableFromInline
  internal var storage: Storage
  
  @inlinable
  internal func obtainStorageView() -> AnyView {
    switch self.storage {
    case .a(let view):
      return AnyView(view)
    case .b(let view):
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
