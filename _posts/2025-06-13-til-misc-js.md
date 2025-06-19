---
author: Michael
layout: post
---

# TIL: Miscellaneous Javascript Stuff

## Source Debugging

Debugging javascript source is always easier for me in WebStorm when I can do it, but
sometimes you can't and have to use the devtools, which is fine.  My only problem with
that is they keybind the various "step over/step in/step out/continue" keys to different
ones than I am used to and have used for literally decades.

One thing I found irritating is how to pull up a file.  JS sources are often buried under
layers and layers of directory structure that someone thought was a good idea once
(sometimes this someone is me) but proves hard to navigate.

At least in Chrome (and Edge), the quick-key to do fuzzy search finding of files is
Ctrl-P/Cmd-P.

## Disabling `eslint` Errors

Sometimes `eslint` gripes about things that just aren't relevant for you.  Yesterday I had
a function that was just an expression, so you could have done it using the shorthand:

```typescript
const isVarInThisArray = (var: string?) => typeof var === 'string' && SOME_LONG_NAME_FOR_AN_ARRAY.include(var)
```

`eslint` gripes that the line is too long, but reformatting it...

```typescript
const isVarInThisArray = (var: string?) =>
  typeof var === 'string' && SOME_LONG_NAME_FOR_AN_ARRAY.include(var)
```

complains that it could be one line.  Ok, so let's not use the shortcut, and...

```typescript
const isVarInThisArray = (var: string?) => {
    return typeof var === 'string' && SOME_LONG_NAME_FOR_AN_ARRAY.include(var);
};
```

gripes that you should use the shortcut.

I learned 3 ways to disable this.  First see what it's griping about to get it's internal
"id" or "name" of the error, then use one of the following.

This one is used when your line is short, and the eslint directive PLUS your code won't
exceed its line length.

```typescript
x = something_eslint_hates; // eslint-disable-line error-id
```

This one is used when your line is longer, and the eslint directive PLUS your code _WILL_
exceed its line length.

```typescript
// eslint-disable-next-line error-id
x = something_eslint_hates;
```

And finally use this one when you want to disable the issue over a whole section of code.

```typescript
// eslint-disable error-id
x = something_eslint_hates;
... lots of other stuff
// eslint-enable error-id
```

Et voila!
