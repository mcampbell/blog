---
author: Michael
layout: post
---

# TIL: Javascript Date Oddity

I don't know why this is like this, but if you `toString()` a Javascript Date, whether or
not the current time is "attached" depends on the _format_ of the date that was used to
construct it.

```javascript
ymd = new Date("2025-05-22")
console.log(ymd.toString())

mdy = new Date("5/22/2025")
console.log(mdy.toString())
```

Running this with `node`, I get the following:

```
17:15❯ node ~/tmp/tmp.js
Wed May 21 2025 20:00:00 GMT-0400 (Eastern Daylight Time)
Thu May 22 2025 00:00:00 GMT-0400 (Eastern Daylight Time)
```

Note that one has _A_ time attached, one does not.  What's even more weird is that the
time ISN'T THE CURRENT TIME.  It always seems to only have granularity of an hour.

I'm sure this is documented, somewhere.  It might even make sense, but it's a bit of a
head-scratcher; I've never encountered a situation where this made a difference... till
today.

A colleague was doing some testing using the the
[mockdate](https://www.npmjs.com/package/mockdate) javascript library and the test works
fine on his machine, but fails on the CI/CD machine with an off-by-one date issue.  Of
course the CI/CD machine is in a UK time zone so time zones were the immediate suspect.  I
noticed that the different examples listed on the library's github page showed a weird mix
of "with time" and "without time", and sure enough changing the format of the input string
caused the test to start working.  I then dug into just doing javascript Dates and found
that the cause is there, not the library.

Weird.
