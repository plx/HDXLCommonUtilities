# HDXLCommonUtilities

This package contains miscellaneous utilities, infrastructure and support code. There's no overarching theme here beyond "code used everywhere else".

## Package Status: On A Diet

At present, this package contains three *types* of functionality: 

1. miscellaneous minor utilities with broad, general applicability
2. narrow-purpose niche utilities and infrastructure
3. (mad) “science-experiment” components  

`HDXLCommonUtilities` *should* contain neither (2) nor (3)--such functionality belongs elsewhere, in their own packages.

I thus describe `HDXLCommonUtilities` as being "on a diet" because I'm currently extracting the code falling into (2) and (3) and moving said code into more-appropriate homes.

## Package Overview

- `ComparisonResult` Enhancement
- First/Last API
- `Validatable` Protocol

## `ComparisonResult` Enhancement

I generally prefer 3-way comparison—`ComparisonResult` in Swift—and have put some effort into filling in its “missing API”.

I extend `ComparisonResult` with (a) support for inversion and (b) interpretation-assistance utilities like `impliesLessThan` and `impliesGreaterThanOrEqual`. I also provide support for efficiently-coalescing several possible comparisons into a final comparison result, allowing one to write code like this:

```swift
static func <=>(
  lhs: Foo,
  rhs: Foo) -> ComparisonResult {
  return ComparisonResult.coalescing(
    lhs.a <=> rhs.a,
    lhs.b <=> rhs.b,
    lhs.c <=> rhs.c,
    lhs.d <=> rhs.d
  )
}
```

…and obtain the appropriate end result while only performing the *necessary* comparisons.

I also define the `<=>` operator seen above, and make it available to all types conforming to `Comparable`. This is convenient, but (a) has a high chance of conflict with other packages and (b) feels like a stopgap measure until-or-unless the Swift standard library incorporates a protocol based around`<=>` (or amends `Comparable` to do so).

This is a bit outside the scope of this `Readme`, but there are advantages to having`<=>` as the core primitive—especially when you *want* \```ComparisonResult```. Consider, for example,``x \<=\> y`where (a) both`x`and`y`are 100,000-element`[Int]`s and (b)`x`and`y`are identical up until the very final value. For such`x`and`y`, then, a truly-primitive`x \<=\> y`would need only a single iteration through`x`and`y`, but whereas two or would be needed to calculate`\<=\>`via`\<`and`\>\`. 

### First/Last

Although one *can* chain `??`, I've found it far preferable to use named functions like `firstNonNil`. Such functions leave the intention clearer and--further--avoid `??`'s apparent tendency of straining the compiler's type-inference behavior.

Similarly, in certain narrower cases I've found it helpful to use the "reverse" functions like `finalNonNil`; this is typically in cases like collection traversal, wherein the `index(after:)` and `index(before:)` often resemble mirror-images of each other.

### `Tribool` Type

The `Tribool` type is an `Objective-C` *compatible* enumeration with three states: `.yes`, `.no`, and `.indefinite`; note that the `.yes` and `.no` are used in reference to `Objective-C`’s use of `YES` and `NO` for `BOOL` values. 

My motivating use for `Tribool` was specifically for code that must be Objective-C compatible but needs *the equivalent* of `Bool?`. For example, consider something like this:

```swift
/// Sketch for a hierarchical text-formatting system.
@objc(HDXLTextFormattingConfiguration)
class TextFormattingConfiguration {

  var parentConfiguration: TextFormattingConfiguration? = nil

  /// Whether or not the text should be bolded.
  ///
  /// Interpreted like so:
  /// - `true`: bold explicitly requested
  /// - `false`: bold explicitly rejected
  /// - `nil`: use parent preference
  ///
  /// - seealso: `resolvedBold`
  var bold: Bool? 

  /// Whether or not we should use bold (will examine parent if necessary).
  ///
  /// - note: Real version would try to cache this
  var resolvedBold: Bool? {
    self.bold ?? self.parentConfiguration?.resolvedBold
  }

}
```

If we must ensure that the class above *must* be fully-usable from `Objective-C`, we can simply use `Tribool` like so:

```swift
extension TextFormattingConfiguration {

  /// Exposed to Objective-C as a `Tribool`, with
  /// clear 1:1 correspondance to `Bool?`.
  @objc(shouldUseBold)
  var __shouldUseBold: Tribool {
    get {
      return Tribool(self.bold)
    }
    set {
      self.bold = newValue.boolValue
    }
  }

}
```

### `Validatable` Protocol

I use the `Validatable` protocol in types that must maintain certain semantic invariants; sans documentation, this is the complete protocol:

```swift
public protocol Validatable {  
  var isValid: Bool { get }  
}
```

The `isValid` is expected to return `true` iff the required semantic invariants have been maintained. The *intention*—and the way I use `Validatable`—is for a `false` return value from `isValid` should imply a serious code defect

As an example, the `OrderedPair` type is *supposed* to correspond to a “2-tuple” wherein the first value is `<=` the second; here’s it’s `isValid` implementation:

```swift
extension OrderedPair : Validatable {
  
  @inlinable
  public var isValid: Bool {
    get {
      guard
        self.lesser <= self.greater,
        isValidOrIndifferent(self.lesser),
        isValidOrIndifferent(self.greater) else {
          return false
      }
      return true
    }
  }
  
}
```

…wherein we return `true` iff both (a) `self.lesser <= self.greater` (as-expected) and also (b) both `lesser` and `greater` are, themselves, valid.

This brings me naturally to `isValidOrIndifferent`: `Validatable` is similar to `CustomStringConvertible` and `CustomDebugStringConvertible`—useful to adopt, rarely useful as a generic type bound. The code for `isValidOrIndifferent` is simply this:

```swift
@inlinable
func isValidOrIndifferent(_ value: Any) -> Bool {
  return (value as? Validatable)?.isValid ?? true
}
```

…making its relationship to `Validatable` analogous in spirit to the relationship between `String(describing:)` and `CustomStringConvertible` or the relationship between `String(reflecting:)` and `CustomDebugStringConvertible`. 
