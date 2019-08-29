//
//  InlineProduct9+SwiftUIConditionalConformances.swift
//

import Foundation
import SwiftUI

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - AdditiveArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct9: AdditiveArithmetic
  where
  A:AdditiveArithmetic,
  B:AdditiveArithmetic,
  C:AdditiveArithmetic,
  D:AdditiveArithmetic,
  E:AdditiveArithmetic,
  F:AdditiveArithmetic,
  G:AdditiveArithmetic,
  H:AdditiveArithmetic,
  I:AdditiveArithmetic {
   
}

// -------------------------------------------------------------------------- //
// MARK: InlineProduct9 - VectorArithmetic
// -------------------------------------------------------------------------- //

extension InlineProduct9 : VectorArithmetic
  where
  A:VectorArithmetic,
  B:VectorArithmetic,
  C:VectorArithmetic,
  D:VectorArithmetic,
  E:VectorArithmetic,
  F:VectorArithmetic,
  G:VectorArithmetic,
  H:VectorArithmetic,
  I:VectorArithmetic {

}

