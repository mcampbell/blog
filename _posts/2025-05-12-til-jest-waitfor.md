---
author: Michael
layout: post
---

# TIL: Jest `waitFor()`

Helping a colleague today debug a `jest` test with `testing-library` mixed in.  Turns out
that the `waitFor(cb)` method will keep running your `cb` callback until it *DOESN'T*
throw an error.

This is handy when your `cb` has `expect()` calls in it, since if those fail they throw
errors.  So if you're expecting something to happen, since the DOM updates in
&lt;diety&gt; knows WHAT order, you can wrap that in a `waitFor()`, put whatever
`expect()`ations you want before the thing you want to try, and let 'er rip.

In our case, a button was needing to be clicked, but for #reasons, it was `disabled` and
that was being toggled off by a `useEffect` elsewhere in the code.  The LOGICAL flow
looked right so this was probably just a race condition between the `useEffect`
asynchronicity and the test.

We put in an `expect(buttonElement.disabled).toBe(false)` _in the callback_, and that was
what got us past the issue.

Something like...

```
await waitFor(() => {
  // do stuff
  // get the buttonElement
  expect(buttonElement.disabled).toBe(false);

  buttonElement.click()
});
```

As long as the `useEffect` (not shown) had not yet swapped that `buttonElement` to NOT be
`disabled`, `waitFor()` would keep running the callback.  Since the button is disabled,
the `expect`ation would fail via error, and then finally when the `expect` was finally
satisfied it would pass and click the button.

It should be noted that there are two other levers to tweak; an `interval` value which
tells `waitFor()` how long to pause between attempts, and a `timeout` to tell it how long
to try before it gives up.  These are defaulted, and those default values are left as an
exercise for the reader, but they are reasonable.

et voila!
