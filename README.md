# HDXLCommonUtilities

This package contains miscellaneous utilities, infrastructure and support code. There's no overarching theme here beyond "code used everywhere else". 

I'm still in the process of slimming this package down, and thus between now and `0.1.0` expect even more of non-essential code to be moved out into its own packages.

## Contents & Status Overview

I've put a longer summary of the highlights in `Highlights.md`. 

## Documentation & Testing

Most methods are documented.

Not *everything* in the package is tested, but *almost everything* is—especially for the things I don't anticipate extracting into their own pacakges.

## Open Concerns

The `<=>` operator here can't be the only one--I worry about conflicts.

I use a `Validatable` protocol that requires an `isValid` property. This has been helpful for me for years, but both the protocol and the property seem seem to generic  high risk of conflict 

## Related Work

I cleaned this up for making public because it's a dependency of more-interesting packages I also intend to make public--hopefully soon.

Currently-public, "interesting" packages include:

- [HDXLSIMDSupport](https://github.com/plx/HDXLSIMDSupport): types that let you *write* `Quaternion<T>`, `Matrix2x2<T>`, ..., `Matrix4x4<T>` but *use* the actual, native, SIMD-accelerated types.
- [HDXLSemanticEquivalance](https://github.com/plx/HDXLSemanticEquivalence): a thin package containing tools to assist with deduplication logic; grew out of `CloudKit/CoreData` sync, but generalized to be no longer `CoreData`-specific.
- [HDXLAlgebraicUtilities](https://github.com/plx/HDXLAlgebraicUtilities): an experimental package with algebraic sums, products, and related collections

...with more hopefully coming soon.

## Style Remarks

See the `HDXLStyle.md` file for remarks on certain stylistic aspects of this code.
