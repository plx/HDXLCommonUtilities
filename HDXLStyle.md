# HDXL Style

The `HDXL` packages exhibit some personal style preferences:

1. 2-space indentation
2. `with(property:)`-style derived-value utilities
3. explicit `self` (and other "explicit"s)
4. `guard`-stacking
5. `// ////` and `pedantic_assert` 

## Spacing & Indentation

All source files should use 2-space indentation.

## `with(property:)` Derivation

Within the HDXL project you will frequently see datatypes that have `with(property:)`-style APIs, like so:

```swift
struct Point2D<T:Real> {
  var x: T
  var y: T
  
  func with(x: T) -> Point2D<T> {
    return Point2D<T>(x: x, y: self.y)
  }

  func with(y: T) -> Point2D<T> {
    return Point2D<T>(x: self.x, y: y)
  }
}
```

I include this, in part, simply because I prefer `let bar = foo.with(x: newX)` to, say, `var bar = foo; bar.x = newX`. Aesthetics aside, this idiom particularly shines when implementing the COW pattern: communicating "I intend to obtain a new value, but with this change applied" can allow for smarter logic in your new-backing-storage construction. 

I will address this topic in more detail in a forthcoming article.

## Explicit `self` (etc.)

Within the HDXL project, I *always* use explicit `self`; outside the HDXL project, I happily go along with project norms. Similarly, within the HDXL project I *always* write out even `get`-only computed variables as `var foo: T { get { /* */ } }`; outside the HDXL proejct, I happily go along with project norms.

For the curious, I favor explicit `self` because I find code without it faster to read but harder to comprehend: syntax highlighting helps a little, but only if you're using a semantics-aware editor; intimate knowledge of the type helps a lot, but one only has that *after* reading-and-comprehending the code.

## `guard`-Stacking

I'll illustrate `guard`-stacking by example:

```swift
// guard-stacked:
static func ==(lhs: Self, rhs: Self) -> Bool {
  guard 
    lhs.foo == rhs.foo,
    lhs.bar == rhs.bar,
    lhs.baz == rhs.baz,
    lhs.quux == rhs.quux else {
      return false
    }
    return true
}
```

Once you get used to it, I've found it far more readable than any of the conventional approaches--at least the way that they get auto-formatted in `Xcode` (really: by the `SourceKit` stack, etc.). I reproduce below, verbatim, the auto-formatting `Xcode` applies when I type similar logic from scratch:

```swift
// not guard-stacked, no parentheses, 
// reproduced verbatim from `Xcode` formatting-as-I-type:
static func ==(lhs: Self, rhs: Self) -> Bool {
  return 
    lhs.foo == rhs.foo
  &&
      lhs.bar == rhs.bar
  &&
      lhs.baz == rhs.baz
  &&
      lhs.quux == rhs.quux
}

// not guard-stacked, with parentheses, 
// reproduced verbatim from `Xcode` formatting-as-I-type:
static func ==(lhs: Self, rhs: Self) -> Bool {
  return (
    lhs.storage == rhs.storage
    &&
      lhs.storage == rhs.storage
    &&
      lhs.storage == rhs.storage
    &&
      lhs.storage == rhs.storage
  )
}

// not guard-stacked, as tuples, no parentheses,
// reproduced verbatim from `Xcode` formatting-as-I-type:
static func ==(lhs: Self, rhs: Self) -> Bool {
  return
    (lhs.foo,lhs.bar,lhs.baz,lhs.quux)
      ==
      (rhs.foo,rhs.bar,rhs.baz,rhs.quux)
}

// not guard-stacked, as tuples, with parentheses,
// reproduced verbatim from `Xcode` formatting-as-I-type:
static func ==(lhs: Self, rhs: Self) -> Bool {
  return (
    (lhs.foo,lhs.bar,lhs.baz,lhs.quux)
      ==
      (rhs.foo,rhs.bar,rhs.baz,rhs.quux)
  )
}
```

Even if you fix it up afterwards, it'll just get "un-fixed" as soon as you edit it, or copy-and-paste it, or send it through an external tool using the same underlying formatting toolkit. 

Thus I use the `guard`-stack approach pervasively whenever I set up complicated, compound boolean predicates. I'd happily go back to writing it more-naturally *if* the tools would format it correctly, but I'm not optimistic--Swift's been around for *quite a few years*, and this "quirky" formatting of compound `Bool` expressions has been stable the entire time.

## `// ////` & `pedantic_assert`

A forthcoming article will explain `pedantic_assert` in full; here--and for now--I'll only explain the gist of it and the associated `// ////` formatting.

Reading HDXL-project code you'll see blocks like this: 

```swift
var foo: Foo {
  get {
    return self.storage.foo
  }
  set {
    // /////////////////////////////////////////////////////////////////////////
    pedantic_assert(self.hasConsistentFooState)
    defer { pedantic_assert(self.hasConsistentFooState) }
    defer { pedantic_assert(isKnownUniquelyReferenced(&self.storage)) }
    // /////////////////////////////////////////////////////////////////////////
    if isKnownUniquelyReferenced(&self.storage) {
      self.storage.foo = newValue
    } else {
      self.storage = self.storage.with(foo: newValue)
    }
  }
}
```

The `pedantic_assert`s are (a) *off* by default but (b) can be "switched on" for heavy-duty debugging by (temporarily) defining the Swift-style "preprocessor" value `HEAVY_DEBUG=1`; it's inspired by the 3-level system of assertions in Bloomberg's C++ codebase. For why this would be valuable, please see the pending article (will update with a link once it's available!).

The `// ////` is the best way I've found to make the `pedantic_assert` code easy to "tune out" while reading code: once you get used to seeing it, your eye will quickly skip over such blocks. Said blocks could be eliminated if Swift gained proper, language-level support for preconditions and postconditions.
