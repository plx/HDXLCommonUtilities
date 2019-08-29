//
//  InlineProduct4+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: InlineProduct4 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct4: AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic {
 
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct4 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct4 : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic {
  
}

