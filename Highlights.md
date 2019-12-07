# Highlights

## `ComparisonResult` Tools

My personal opinion is that the three-way comparison operation is a better foundational operation than the standanrd six-operator suite (even after accounting for the fact that "all you need is `==` and `<`"). 

I thus do the following:

1. introduce a `ComparisonResult`-returning spaceship operator `<=>` that works with all `Comparable` types
2. introduce numerous conveniences on `ComparisonResult` values
3. introduce coalescing-constructors on `ComparisonResult`

For (1) it works as you'd expect--my only concern is conflicts with others defining the same operator in the same way.

For (2) it's two things: (2.a) methods for inverting a result and (2.b) methods like `impliesLessThan`. Everything here is very trivial, but it's better to have it defined exactly once than manually-inlined wherever you ened it.

For (3), the methods look like this:

```swift
extension ComparisonResult {
  
  static func coalescing(
    _ a: @autoclosure () -> ComparisonResult,
    _ b: @autoclosure () -> ComparisonResult,
    _ c: @autoclosure () -> ComparisonResult) -> ComparisonResult { 
    let aa = a()
    guard aa == .orderedSame else {
      return aa
    }  
    let bb = b()
    guard bb == .orderedSame else {
      return bb
    }
    return c()
  }  
}
```

I have overloaded versions from arity-2 through arity-9; it'd be nice to just use variadics, but we want lazy evaluation, lazy evaluation requires `@autoclosure`, and `@autoclosure` doesn't (currently) interoperate with Swift's variadic arguments--this is a topic addressed in a forthcoming article. Note that should you need it, I do also include a `Sequence`-accepting variant of `coalescing`, too.

Finally, from a style point these *could* be rewritten like so:

```swift
extension ComparisonResult {
  
  init(
    coalescing a: @autoclosure () -> ComparisonResult,
    _ b: @autoclosure () -> ComparisonResult,
    _ c: @autoclosure () -> ComparisonResult) {
      // etc.
    }
}
``` 

...but I have mixed feelings about that idiom--it feels like syntax abuse--and haven't found the current implementations problematic.

## Object Utilities

I include tools for *demoting* objects so that equality, hashing, etc., are based purely on their identity (and not, say, their contents); I also include tools for streamlining common tasks *with* those objects.

The first bit is easy, and looks like this:

```swift
/// Wrapper around an object, causing it to "forget" its own `Equatable` and
/// `Hashable` implementations, and so on.
struct ObjectWrapper<T:AnyObject> : Equatable, Hashable {
  let object: T
  var objectID: ObjectIdentifier {
    ObjectIdentifier(object)
  }
  
  static func ==(
    lhs: ObjectWrapper<T>,
    rhs: ObjectWrapper<T>) -> Bool {
      return lhs.objectID === rhs.objectID
    }
    
  func hash(into hasher: inout Hasher) {
    self.objectID.hash(into: &hasher)
  }
}
```

The second bit is simultaneously pragmatic and precarious, and includes collections like `ObjectSet`, `ObjectToObjectDictionary`, and so on. These collections (a) wrap the corresponding standard-library collection and also (b) *transparently* wrap/unwrap the objects within `ObjectWrapper`.

In other words, one can say this:

```swift

class Tag : Equatable, Hashable {
  var tag: String
  init(_ tag: String) {
    self.tag = tag
  }
}

let tags = [
  Tag("foo"),
  Tag("bar")
]

// both of the below "contain" `Tag("foo")` and `Tag("bar")`:
var setForTags = Set(tags)
var objectSetForTags = ObjectSet(tags)

// these will be true, b/c `Set` uses `Tag`'s `Equatable` and `Hashable`,
// and thus it "contains" even these *new* instances of `Tag`
setForTags.contains(Tag("foo"))
setForTags.contains(Tag("bar"))

// these will be false, b/c `ObjectSet` *transparently* ignores `Tag`'s
// `Equatable` and `Hashable` and *only* looks at object-id...and thus
// b/c it doesn't recogize contain the *new* instances we're showing it:
objectSetForTags.contains(Tag("foo"))
objectSetForTags.contains(Bar("bar"))

```

...and efficiently work with pre-existing object types solely by their identity, not their content. In some situations this is a lifesaving tool, in others it's a total footgun--use it, but use it judiciously.

## In-Place Mutations

I include a fair amount of in-place mutations, filtration, etc., on the core types like `Optional`, `Array`, `Dictionary`, and so on. The motivation for these is to make it easier to mutate things in-place *without* unnecessary overhead, duplicative work, and so on.

This code is quite useful, but could benefit from a review: better names, more-consistent naming, adding missing variations, etc., would all leave it in a better state.

## Miscellaneous Logic/Control-Flow Functions

This contains a *lot* of "overloaded-function families": `countOfNil`, `countOfTrue`, etc., return the count of their arguments that are `nil`, of `true`, and so on; `weakMax` and `weakMin` are like `min` and `max` but work with `T?`--ignoring `nil` arguments; `firstNonNil` works like a chain of `??`, but is clearer (and sidesteps occasional compiler difficulties); `unwrap` and `unwrapValidated` lazily evaluate(-and-validate) their arguments, returning either a "complete tuple" or `nil`.

All of these exist only to improve readability in particular scenarios.

## On-Demand Direct Map

Note: on reviewing the documentation this *may* have become superfluous.

This type exists to fix what I *believed* to be a subtle gotcha in `lazy.map()`: my understanding *was* that the underlying collection would lazily calculate-and-cache the mapped values, thereby (a) avoiding re-apply the transformation but (b) incurring the expense of allocation. As per the docs on `LazyMapCollection`, this is not the case at present--it explicitly states that the transformations are re-applied on each access; perhaps this is a change from earlier Swift, perhaps I always misunderstood.

In the event that I can confirm that that behavior for `.lazy.map` is now guaranteed--now and forever--I will likely drop this type and change the utility method that constructs it to return the appropriate standard-library type.

## Validatable

The `Validatable` protocol exists to provide a canonical way to verify intended invariants that cannot be handled at type level. The protocol looks like this:

```swift
protocol Validatable {
  var isValid: Bool { get }
}
```

...and there's a primary helper method:

```swift
func isValidOrIndifferent(_ x: Any) -> Bool {
  return (x as? Validatable)?.isValid ?? true
}
```

...which *would* be an extension on `Any` if Swift supported such things.

Here's some examples of the *intended* use of `Validatable`:

```swift
/// `newtype`-like wrapper around `String`s used as component identifiers.
/// Identifiers are expected to *never*, *ever* (a) be empty or (b) contain whitespace.
public struct ComponentIdentifier : Validatable {
  internal var storage: String
  
  var isValid: Bool {
    // verify the expected invariants hold:
    guard 
      !self.storage.isEmpty,
      !self.storage.containsWhitespace else {
        return false
      }
      return true
  }
}

/// `Pair`-like type that guarantees its constituents are in ascending order.
public struct AscendingPair<T:Comparable> : Validatable {
  var lesser: T
  var greater: T
  
  // verify the expected invariants hold:
  var isValid: Bool {
    get {
      return self.lesser <= self.greater
    }
  }
}

```

Within my own code I use three tiers of assertions: the third, lowest tier is switched on only when debugging thorny issues; I use `isValid` copiously within those occassionally-active third-tier assertions, thereby identifying-and-rectifying innumerable subtle logical mistakes over the years.

I mention this to offer advise vis-a-vis using `Validatable` in your own code: it's not the right protocol for "application-level validation" (e.g. it isn't for validating user input before submitting a form)--it's for runtime validation of the underlying data types.

Now that I'm making it public I worry about such generic terminology triggering name collisions, but...I'll deal with that when I need to, and not proactively.

This package contains miscellaneous utilities, infrastructure and support code. There's no overarching theme here beyond "code used everywhere else". 

I'm still in the process of slimming this package down, and thus between now and `0.1.0` expect even more of non-essential code to be moved out into its own packages.

