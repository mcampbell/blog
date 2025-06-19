---
author: Michael
layout: post
---
# TIL: Jest `global.fetch`

## The Issue
We have been working with a file of tests doing some UI testing that was exceptionally
flaky, but always for the same reason - some network timeout issue.  Which was really
weird since we were mocking all the network interactions.

And doubly so since manual testing consistently worked fine; in fact in manual testing we
couldn't GET it to fail.

It got so bad that we just had to `// FIXME: ...` and comment out all the flaky tests so
we could get the code to pass CI/CD and get the code to production.

Recently, we had to add to this file and modify a test since we added some components to
the UI.  Flaky network timeout issue again.  Our suspicion was some sort of race condition
between the new component `expect`s and various `useEffect`s setting values in whatever
way it does that, which I've found to be no unlike magic dice throwing.

## The Workaround

If it's a race condition, maybe we're not waiting at the right points for the right
things.  In an [an earlier blog post](https://unixgeek.com/blog/2025/05/12/til-jest-waitfor.html)
I explained how `waitFor()`from React Testing Library works, which we tried here.

That did fix a few things, but not all.

## The Fix

Colleague figured it out (admittedly, with the help of some Gippity input), but putting in
some code that causes *ALL* network interactions to immediately fail.

```javascript
global.fetch = jest.fn(() => Promise.reject(new Error(
  'Network request failed: Ensure that all external network requests are properly mocked in your test setup.',
)));
```

What this does is set up a global mock for `fetch` that immediately `reject`s a `Promise`
with an `Error`.  The idea here is if some network interaction happens that you don't plan
on, and don't mock, it'll immediately die.

And it did.  So my colleague mocked the network calls he'd not known about and his tests
started running fine.  As a bonus, all the `// FIXME: ...` tests from before were able to
take advantage of this, and _THEY_ started running consistently too!

This is a good pattern, and is ages old.  We work in a dynamically typed language at the
moment, but if you're lucky enough to have legit static typing, the old-school way to
change a variable name, before all the fancy IDE's "know" what scope a variable lives in,
is to "go ahead and change it; see what won't compile".  In a more general sense, make the
DEFAULT action be "die", and see what dies.  You know where all the things you need to fix
now sit.

Et voila!
