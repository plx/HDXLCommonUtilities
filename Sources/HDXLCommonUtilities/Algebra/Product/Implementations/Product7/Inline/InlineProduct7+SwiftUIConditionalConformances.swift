//
//  InlineProduct7+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: InlineProduct7 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct7: AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic,
  E:AdditiveArithmetic,
  F:AdditiveArithmetic,
  G:AdditiveArithmetic {
 
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct7 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct7 : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic,
  E:VectorArithmetic,
  F:VectorArithmetic,
  G:VectorArithmetic {
  
}

