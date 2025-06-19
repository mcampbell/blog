---
author: Michael
layout: post
---

# Overview

Brain dump of thoughts about commits and PRs.

## Commits

Since I've been working with `git` I've found that people land in 1 of 2 basic schools of
thought as to what commits mean and what they are for.

### The "History" School

In this school, a commit is seen as a history of what happened.  Everything, no matter how
banal, should be kept... since it's history.  If it happened, it's history, and if a
commit records that, great.  They can be as detailed and written as often as anything that
affects history happens.  "Tell me what went on."

This one optimizes to "reality", it shows what happened.  It can get extraordinarily ugly
and verbose.

This one is easily taught and easily done; you commit when you've done something
meaningful, and you keep that commit even later if you UNDO that thing, since both the
creation and destruction of something is part of the history.

Some practices (like the J.B. Rainsberger school of TDD) support this as a way of doing
things.  Lots of small commits as you write tests and go through the refactoring dynamo,
writing new code/tests, etc.  However, every commit should be made with passing tests, so
_any rollback/reverts gets you do a working state_.

It makes an accurate, if hard to read, story of the code change.  However, sometimes the
most boring insignificant detail is the thing that is the spark of an idea that solves a
problem.

In ML terminology, it has high "recall" - everything important is here.  (But possibly
buried in a pile of unimportant stuff.)

Opponents of this style might say, "I don't want to have to wade through all the
`typo`/etc garbage/low quality commits to get to what's going on in the PR."


### The "Story" School

In this school, a commit is seen as a story that a reviewer should follow.  They should
each encompass one main idea of the code change, no matter how many files or changes went
into it.  Too, the story should be optimal and not include ANYTHING not related to it.

This one optimizes to the review process.  It doesn't waste the reviewer's time with
things not related to reviewing what's in front of them.  This is often done with
interactive rebasing, git squashing, etc. to collapse many commits into one "idea".

It can be challenging to know ahead of time what "idea" you're working on to fit into a
commit, and/or just put those changes in it.  It can be equally challenging to
interactively rebase (move around, squash, amend, etc.) a bunch of smaller commits that
are not necessarily in the right order into their respective buckets of commonality.

It makes a well told, easy to follow, story of the code change, but omits anything that is
not _considered_ relevant to the review.

In ML terminology, it has high "precision" - everything here is important.  (But possibly
there are other important things NOT here.)

Opponents of this style might say, "I want to know what happened, not some bespoke,
artisanal whitewash.  It's too easy to mess this up or just not realize what's important
and omit it, forever."



### Purpose

Which school you land in often comes down to what do you think commits are for.  Are
commits for PR's or for code archaeology?  I think there's no wrong answer here, but it's
also true that it's hard if not impossible to have both.


## PRs

How an org decides to go with commits will determine in large part how it handles PR's.

One tactical thing to consider is rebasing; when and where do you allow/require it.  Some
of that depends on the above, but it is considered bad practice to
squash/fixup/amend/rebase your own commits that have been pushed already, since if
someone's pulled your branch and you rewrite history with a rebase, now they're looking at
a different reality.  This is very confusing.

A model I've seen is a hybrid of the above; you commit often and small, and before you
push, you can rebase into smaller # of commits for the "well told story".  But once it's
pushed, it's immutable, and you should never rebase through that point in history.  Future
sets of commits follow the same rule.

## Misc

### Broken Windows

[See also](https://en.wikipedia.org/wiki/Broken_windows_theory)

TL;DR: leaving the little things (incorrect docs, bad comments, small unfactored code,
etc) when making code changes has an exponentially bad effect on the code base.  As such,
one should fix things as they find them.

Like the 'story' vs 'history' dichotomy, people tend to fall into one of 2 camps here.

One one side, fixing it as you find it helps keep the codebase in a good state and
directly addresses the issue.  However, this can clutter PR's with unrelated fixes if not
commented well (either in the code or the PR).  This tends to irritate the "Story" camp
where the PR should be a carefully curated set of commits all related to one idea.

On the other side, the common advice is to do these kinds of things as separate PR's or at
least separate commits.  This can be difficult to pull off since one doesn't necessarily
know where one will find a broken window ahead of time, and "pushing these on your work
stack as you find them to do later all at once" is a friction, however subtle.  It feels
as one has to change their workflow to satisfy someone else's.

Regardless of where an org falls, this should be spelled very explicitly as this is one of
those situations where a PR can be rejected for "that's not how I would have done it"
reasons, which is toxic to the team.
