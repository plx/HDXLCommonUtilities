//
//  InlineProduct5+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: InlineProduct5 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct5: AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic,
  E:AdditiveArithmetic {
  
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct5 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct5 : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic,
  E:VectorArithmetic {
  
}

