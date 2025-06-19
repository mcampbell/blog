---
author: Michael
layout: post
---

## The Good

I first read about DSLs ("Domain Specific Languages") in the CS classic, [Programming Pearls](https://amzn.to/3hq2cT2
"Programming Pearls") by Jon Bentley.  He describes "little languages" that are generally used to interact with a
computer, but in a domain-specific way.  For example, `TeX`, `nroff`, `pic` and `eqn` are languages to produce a
printable output but not using general purpose programming language.  They're higher levels of abstractions, *for
humans*, to reduce the cognitive effort of what we (as humans) want vs what the computer wants.

For years, I've seen these DSLs attempted, and almost universally poorly.  You can think of a lot of modern web
frameworks as "App DSL's", especially ones for dynamically typed languages where they're much easier to write.  Django
and Rails come to mind.

## The Bad

I've also run into some probems with these that seem to crop up a lot.  (I should note here that some of these are team
dynamics so not DSL problems per se, but the DSL was surely a catalyst.  And I also understand I'm conflating DSLs with
frameworks a bit.)

### Simple != Easy

If you've never heard/seen Rich Hickey's [Simple Made Easy](https://www.youtube.com/watch?v=SxdOUGdseq4) talk, go watch
it.  He explains this much better than I can.  Seriously, stop reading and go watch it now.

Anyway, the point of a DSL is to reduce cognitive load.  It's probably silly to write a program in C to spit out a well
formed circle surrounded by text when LaTeX can do that for you, with fewer keystrokes and errors.  Most DSLs I've run
into are just not very well written, and for good reason.  They're HUMAN INTERFACES, and humans suck, and interfaces are
REALLY REALLY HARD to write.  _GOOD_ ones are damn near impossible, so I get it, but the fact remains.  Also, most devs
that write DSLs I've found to not have much front-end/user/CX experience (as I don't), and it shows.  Having anyone but
the originator use them is an exercise in frustration.

In a previous job a developer "designed" a DSL to allow non-devs to specify conditions for anomolous network activity.
It was a barely functional XML parser with an ill-defined XML schema as input.  While, yes, it was arguably "less hard"
for non-developers to be able to input the "rules" for this thing to run, it was still XML which is no less picky about
syntax than a programming language.


### 100% Coverage

A good abstraction should make the 80% easy, and the 20% possible. Too many of them try to do 100% coverage, and then
you're stuck.  This can be either via technical means, or a misguided attempt from your team at DRY.  In one job I used
Django, and (bless it's heart) the combination of Django and the dozen or so plugins/addons we used gave the developers
the _ability_ to do 99.5% of what you needed to do "in Django".  The downside was the team decided this was a hard rule;
if it could be done in Django, it had to be.  Since the domain of possible things to do was pretty large, unless you
work with Django all day every day when you run into one of the 19.5% cases, figuring out the obscure "Django or maybe a
plugin but no one's quite sure" way to do it takes 15X longer than just coding it in pure, idiomatic, easy to read
Python.

### DRY

As I mentioned before, some DSL's (or teams using them) encourage DRY by encapsulating common tasks into some smaller
set of code or keystrokes or whatever.  Which is great... for that 80% case.  The 20% case still needs to be dealt with
and is almost always better suited with idiomatic 'real' programming language code.


## The... Maybe Not So Bad?
