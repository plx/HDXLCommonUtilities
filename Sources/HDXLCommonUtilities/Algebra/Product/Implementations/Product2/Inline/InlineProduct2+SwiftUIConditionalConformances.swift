//
//  InlineProduct2+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: InlineProduct2 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct2: AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic {
   
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct2 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct2 : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic {
  
}

