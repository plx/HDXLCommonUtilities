# Product Collections

The product collections provide the n-way cartesian product of their constituent collections.

This document describes some of design considerations and includes some general remarks vis-a-vis these collections.

## Caching and Wastage

In the abstract, here is what we can say about the performance of a generic `Collection` of unknown concrete type:

- `isEmpty` will *almost-certainly* be `O(1)` (*almost-certainly* because it will be `O(1)` barring poor coding choices)
- `count` *should be* `O(1)` for `RandomAccessCollection` but may be `O(n)` for `Collection` or `BidirectionalCollection`
- `startIndex` *should be* `O(1)` but is allowed to be otherwise
- `endIndex` *should be* `O(1)` but is allowed to be otherwise
- `index(_:offsetBy:)` *should be* `O(1)` for `RandomAccessCollection` but *may be* `O(n)` (in the offset) for `Collection` or `BidirectionalCollection`
- `distance(from:to:)` *should be* `O(1)` for `RandomAccessCollection` but *may be* `O(n)` (in the distance) for `Collection` or `BidirectionalCollection`

To get uniform, predictable performance these product collections privately cache a lot of information about each consituent collection—counts, "final subscriptable index", etc.—as well as supporting information (see any concrete product collection for details).
This caching is unnecessary whenever we have products entirely of `RandomAccessCollection`s, but we need it for all other cases.
This feels wasteful and it'd be nice to "override" the implementation with a less-wasteful one for such cases, but that's not a capability currently Swift offers (short of having a second implementation with a different name and tighter type bounds, but that's wasteful in a different way...).

I'd also point out that to support all this caching *all product collections allocate*; you may not wish to use these in tight inner loops.
I'd *consider* adding non-allocating product collection implementations at some point, but so far—and unlike the chain collections—I haven't had the need for them.  

## Performance Inheritance

Characterizing the asymptotic performance of the product collections is surprisingly tricky.

One source of difficulty is that the product collections are potentially *much larger* than the constituent collections, which arguably throws off intuitions about the asymptotics.
For example, a 5-way product of collections `a`, `b`, `c`, `d`, and `e`—each of size 100—will have `count` 10,000,000,000.
Even if each of the consituents requires `O(n)` to calculate count, however, that leaves the product's cost for `count` as roughly `5 * O(100) + O(1)` (to abuse notation).
That's not a true `O(1)`, of course, but in practice it's "feels like `O(1)` vis-a-vis the size of the *product*"; that said if you have one huge constituent that's `O(n)`, then you may wind up "feeling very `O(n)` over here".

Likewise, calculating linear distances between indices is faster than true `O(n)` but similarly-tricky to pin down.
It's implemented in a way that is `O(1)` when all constituents are `RandomAccessCollection` but pseudo-`O(1)` for all other cases: finding the distance may be `O(n)` for each constituent *component*, but once we have that we can produce a final distance in `O(1)`. 

I hope the general picture is clear by now: most operations are `O(1)` when the constituents are `RandomAccessCollections` and can be anywhere from "pseudo-`O(n)`" to "pseudo-`O(1)`" depending on the constituents' types and relative sizes.   

## Iteration Order

The current iteration order for `CartesianProduct(foo, bar, baz)` is *equivalent to* the following:

```swift
for z in baz {
  for y in bar {
    for x in foo {
      yield((x,y,z))
    }
  }
}
```

...(if Swift had a `yield` statement; I hope it gets one sooner or later!). 
I have it in that order for no particular reason, but also don't see a reason to change it (e.g. to reverse it): it's fine, and you shouldn't rely on the ordering.

If I *did* change it it'd be to switch to the "triangular" iteration ordering, which for all-integer indices would visit in this ordering:

- 0-tier: `(0,0)`
- 1-tier: `(1,0)`, `(0,1)`
- 2-tier: `(2,0)`, `(1,1)`, `(0,2)`

...and so-on and so-forth. 
The advantage, here, is that it has better behavior vis-a-vis pathological collections—e.g. it'll still visit everything, eventually, even if some of the constituent collections are infinite.

The disadvantage, here, is that doing this generically brings up several awkward choices.
We can do this "easily" and *efficiently* when all our collections are `RandomAccessCollection`, but this would require `RandomAccessCollection` be our generic bound (which'd probably be a more-restrictive type constraint than we want). 
We can do this somewhat less-"easily" and somewhat less-*efficiently* when all our collections are `BidirectionalCollection`, but that, too, is perhaps a more-restrictive type constraint than we'd want.
We can still do this for mere `Collection`s, but because of the unknown performance we're forced to choose between:

- very-pessimal performance for collections with `O(n)` iteration
- using a "storage cache" to hold visited indices (and that will eventually grow to hold all indices for all constituents)
- privately capturing the constituent collections into random-access collections and then iterating *those*, easily and efficiently (but potentially wasting space, etc.) 

...and thus I have no intention of adopting the triangular iteration ordering for the foreseeable future.

Note that this situation could be improved if Swift had the capability to supply *alternative implementations* when certain type constraints are satisfied.
At present, this isn't possible: you *can* define methods that are present only when particular type constraints are satisfied, but you can't "override" those methods with *better* methods when tighter constraints are also satisfied.
To make this point perfectly clear, I'll sketch it:

```swift
// "baseline implementation"
extension Product2Collection : Collection {
  
  func index(_ i: Index, offsetBy distance: Int) -> Index {
    // "slow implementation here"
  }
  
}

// we can't do this and "have it take": 
extension Product2Collection where A:RandomAccessCollection, B:RandomAccessCollection {

  override func index(_ i: Index, offsetBy distance: Int) -> Index {
    // "faster implementation here"
  }

}
```

This isn't supported for perfectly-reasonable reasons, but lack of support for such constructs is rather limiting.


## Gripes and Grumbles

### Positions vs Indices

Swift uses what I call the half-open indexing paradigm, e.g. the paradigm wherein the subscriptable indices form a half-open range like so: `[startIndex, endIndex)`.

I consider this paradigm an understandable choice but also the wrong choice—at least for the fundamental abstraction—in part due to how poorly it composes (for chains, products, and so on).

One alternative paradigm is what I'll call the closed indexing paradigm, wherein what I'll call the subscriptable positions form a closed range like so: `[firstPosition, finalPosition]?` (with that `?` b/c this will be `nil` for empty collections).
The closed paradigm is slightly more awkward to work with for the simplest cases—e.g. for flat collections like `Array`—but for chains, products, etc., it composes much more naturally:

- it's symmetric vis-a-vis forward and backward iteration
- there's no "non-subscriptable" position for-which you have to constantly check

As with the chain collections, then, the product collections implement their iteration logic in terms of this position concept, wrapped inside something implementing the half-open paradigm Swift supports. 

### `@propertyBehavior` vs Generics

To simplify the collection implementations, I make heavy use of a `GenericCollectionStorage` that (a) handles the caching of expensive properties and (b) implements the core logic for "iteration in terms of positions".
It'd be nice if I could somehow propagate that *into*, say, an `InlineProductN` type, but I can't; I must thus either (a) re-implement a lot of the logic from the products or (b) have a private utility that exposes the constituents of these product collections as a product. 
I opted for (a) but (b) might've been less tedious and error-prone.

