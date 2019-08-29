//
//  InlineProduct3+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: InlineProduct3 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct3: AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic {
   
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct3 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct3 : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic {

}

