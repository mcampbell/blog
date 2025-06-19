---
author: Michael
layout: post
---

# TIL: Rails `Enumerable#index_with`

Rails adds an enormous amount of convenience functions to standard Ruby classes and
Modules.  Today I learned about `Enumerable#index_with`.  This method takes a block or a
value, iterates over the Enumerable and returns a hash where the keys are the Enumerable
elements and the values are the value, or the return value of the block.

```ruby
> [1, 2, 3].index_with(true) # => { 1 => true, 2 => true, 3 => true }

> [1, 2, 3].index_with { |idx| idx * 3 } # => { 1 => 3, 2 => 6, 3 => 9 }
```

I don't know that I've ever needed this, but good to have in the back pocket.  Like almost
all "iterator" type functions, this could easily be done with `#inject` or
`#each_with_object`, but convenience functions are convenient.
