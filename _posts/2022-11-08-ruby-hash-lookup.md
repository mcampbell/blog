---
author: Michael
layout: post
tags: ruby, til
---

Ruby has at least 3 different ways to get a value out of `Hash`, and when to use each one depends largely how you want
to deal with a key that doesn't exist.

## Indexed

This is the way you'll see most code:

```ruby
# I'm using symbols for keys here, but of course this is an irrelevant detail.

h = Hash.new()
value = h[:nope]  # => nil
```

A non-existent key will cause the `Hash` lookup to simply return `nil`.

## Using `fetch`

Ruby also has a `fetch()` method on `Hash`.

```ruby
h = Hash.new()
value = h.fetch(:nope)  # => KeyError thrown.
```

Here a non-existent key will cause the `Hash` lookup to throw a `KeyError` exception.

## Using `fetch` with default

Fetch also has a second (or "1'th" for you 0-index types) optional parameter.

```ruby
h = Hash.new()
value = h.fetch(:nope, 'hey there!')  # => 'hey there!'
```

Using this version of `fetch` will provide a default value _IF_ the key doesn't exist.  Do note that this is _does not_
mutate the original hash in any way; the key STILL doesn't exist if it didn't before.

```ruby
h = Hash.new()
value = h.fetch(:nope, 'hey there!')  # => 'hey there!'
h  # => {}  :nope still doesn't exist
```

If you want the behavior of mutating the array on a non-existent key access, you can use the [default
value](https://ruby-doc.org/core-3.1.2/Hash.html#method-c-new) constructor.  This will provide a default value for any
key access for which the key doesn't exist, but the default value is the SAME FOR ALL KEYS; the "fetch with default"
scheme can be used to have a DIFFERENT default per key lookup.  More info
[here](https://ruby-doc.org/core-3.1.2/Hash.html#class-Hash-label-Default+Values).

# When To Use What?

Like in so much of development, "it depends".  I will posit that the `fetch` method should be used mostly only when you
REALLY, REALLY expect the key to be there, and it's A Bad Thing(tm) if it isn't.  Mainly because exceptions should
be... exceptional; reserved for if they happen, you have a bug, or someone else has a bug, or there's a bug.  Something
that needs to be looked at.  This is a bit of a hot take and different teams view this differently, and that's ok.  But
in general, I feel that exception based flow-logic is a bit harder to understand and _should_ be avoided where possible.

The `indexed` method is probably the most common and idiomatic.  It does return `nil` which generally needs to be
checked specifically since `nil` is almost never the type or value that you want, but it's also "falsey", so can be put
inline into a conditional.

```ruby
h = {}

if h[:nope]
    puts "Wait, this shouldn't happen"
else
    rule_the_world()
end
```

I really like `fetch with default`, but it's for use cases where the non-existent key issue is expected, and you can
actually provide a default at lookup time.

I use it a lot in the "change multiple if's to a lookup table" refactoring pattern.

```ruby
# Example in mechanics, not quality.

value = if some_hash[:foo] == 0
           "zero"
        elsif some_hash[:foo] == 1
           "one"
        else
           "many"
        end
```

can be refactored to:

```ruby
lookup_table = { 0 => "zero", 1 => "one" }
value = lookup_table.fetch(:foo, "many")  # yes, sometimes `case` can be better here.
```
