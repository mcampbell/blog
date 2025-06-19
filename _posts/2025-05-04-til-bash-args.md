---
author: Michael
layout: post
---

# TIL: `bash` arguments

Today I learned a bit about `bash` shell script command line arguments.  I'd known
some/most of this for some time, but did a little deeper dive, based on a PR I saw at work
that had some code in it I had never seen before.

## Processing "Groups"

I haven't looked into the "why" yet (and honestly I don't care that much), but `bash` has
both `$*` and `$@` to get your command line args into your script.  I'd looked into this
before, but there are subtle differences when iterating over them in your script,
especially if you have whitespace between them, if they are within quotes, and how you
want them represented in your script.

TL;DR: use `"$@"` for most cases.

For example, if you run a script with `bash test.sh "foo bar" baz`, you PROBABLY want
`"foo bar"` to be one argument, since it's quoted as such on the command line, and then of
course `"baz"` to be a second argument.  Various combinations of `$*` and `$@`, with and
without quotes around them in your script will do different things.  Here's the rundown.
Code link for this test script at the end.

```
❯ bash ./test.sh "foo bar" baz
I got 2 args

$*
Argument: [foo]
Argument: [bar]
Argument: [baz]

"$*"
Argument: [foo bar baz]

$@
Argument: [foo]
Argument: [bar]
Argument: [baz]

"$@"
Argument: [foo bar]
Argument: [baz]
```

et voila!

## Extracting Specific Arguments

Dealing with arrays in `bash` has always been a bridge too far for me (reasonable people
can disagree), and if I ever get into a situation where I absolutely need that I'll
probably write the script in `ruby`, `perl`, `python`, or some other language that handles
them natively a bit more in line with my experience.

That said, occasionally you need to pluck out a specific positional value from the `bash`
command line args, and TIL the easy way to do that.

The syntax is `${@: <index>:<size>}`.  So if you want the first _argument_ from the list
of args, it's `${@: 1:1}` (or just `${@: 1}` as the size appears to default to `1`.)

You can also use a negative index to count from the END of the arg list, so if you want
the last argument, `${@: -1:1}` (or, again, `${@: -1}`) using the default.

Note that index `0` is the script/file name itself, in line with the C language `argv`
convention.

The space after the `@:` appears to be significant.


### Code

[Github Repo](https://github.com/mcampbell/til)
