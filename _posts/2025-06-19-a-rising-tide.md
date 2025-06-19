---
author: Michael
layout: post
---

# Should I Introduce A New Framework At Work?

Story time, which should start with monads since all good developer stories do.  Monads;
the source of 10_000 blog posts and youtube tutorial videos; the love of all pointy-headed
intellectuals and CS majors[1] and scourge of developers just trying to get shit done.

I've too gone through the mental gymnastics to make sense of them as a thing, but have
recently had my Monad Epiphany, or at least a small one, when dealing with an issue at
work.

The issue is the `Either`/`Result`/`Success` and `Failure` monad[2].  Where I work the
chosen framework uses `Success` and `Failure` types.  The _problem_, if you want to call
it that, is that although these do go a long way to eliminate Exceptions, we use them very
inconsistently.  Because of this I had to deep dive into a particular framework and figure
out how they were MEANT to be used.

This monad is a way to properly do "Railway Oriented Programming" which can make long
chains of functions; data conversions/transformations like a Unix pipe, "do this, do that
with it, do that with it, do that with it, ..." type setups, or fluent interfaces VERY
elegant.  The amount of code for error checking decreases to basically zero at the
outermost client level.  It's great.

But we don't use them like that; we typically use them as a 1 layer wrapper, and
immediately unwrap them to get the `value` out.  It's a complete misuse of the framework,
doesn't save any code and is just another "weird pattern" to have to recognize and learn.
Which brings me to the point of this post...

What do we do here?  Although I'm talking about this very particular feature, I mean _in
general_, how should we deal with some new framework/pattern/paradigm/language, etc.
There are a couple options.

* Teach everyone how to use these things effectively, increase code meaning density,
  reduce cognitive load, and make everyone a better (or at least more experienced)
  developer.
* Go the other way and persuade or dictate a 'least common denominator' approach.
* Let people use what they want.


Each of these have their advantages.  Like anything, "it depends".  While teaching
developers new tricks is wonderful, I don't feel this scales very well.  Too many times
(and in the concrete example I listed), I've seen these sorts of things brought into an
organization by a very small cadre of people; very often 1 person.  This person has either
just learned the new thing and wants to apply it everywhere, or say that they have
experience in "New Framework X" in a production capacity for their resume, or just can't
temper their enthusiasm for it.  I have fallen into this trap in the past.

So for bigger companies; there is ENORMOUS GAIN in sticking to the least common
denominator.  Stick to boring, boilerplate, stock & standard frameworks.  Literally every
developer you pull up off the street or from another team will be able to get on-board and
be productive quicker.  This also applies to companies where devs or teams tend to float
around; if your teams dissolve and reform quickly, or people move around a lot, keeping a
consistent set of frameworks at the ready will reap benefits.  Win.

For startups or small teams, or big companies with teams that tend to remain static both
in the teams themselves and the people in them, trying a new thing WITHIN THE TEAM is
probably fine.  You'll level up your devs, your code will probably get better, and you can
produce revenue quicker.  Win.

For almost no one is the "let devs use what they want".  Perhaps a 1 or 2 person show it's
fine; the only people downstream of any issues here are you, and if you're ok with it, go
for it.  As you might have guessed, this is largely what I'm dealing with now.

But that brings up another aspect of all this;for your own side, learning, funzies
projects, by ALL MEANS go crazy and learn All The Things!  PLEASE DO, in fact!  But in
actual corporate settings, this thing should be minimized.  Based on your company size and
team size and mobility, our *main goals* as devs are to write code that can be deployed
and maintained to produce revenue as fast as possible[3].


### Footnotes

[1] I say this with love; I'm a CS major and have had dalliances with Academia, but at
this stage in my career and life I just want to push product that people like and will pay
for, without screwing myself too badly with crappy code.

[2] What this monad does is not the point of this post, but as a quick overview it "wraps"
return values with some tagged type of "Success" or "Failure".  The point is that
functions now can return these things as objects/types and not throw any exceptions.
There are methods on these types so that the caller can either interrogate them to see
what happened, or pass them along to other functions which can handle them intelligently.
It's a clean way to avoid the non-local code flow that Exceptions cause.

[3] This doesn't mean throw out shitty code; the "and maintain" is as or more important
than the "write" part.  Maintenance is 5x-10x or more as writing the code, so making the
code ETC (easy to change) is something that MUST be taken into account when writing.
