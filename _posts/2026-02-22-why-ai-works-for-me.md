---
author: Michael
layout: post
---

# Why AI Works For Me

I read a reddit post today asking [Is Claude Writing Better Code Than Most Of Us?](https://www.reddit.com/r/ClaudeCode/comments/1rbets0/is_claude_actually_writing_better_code_than_most/).

For me, the answer reminds me of Matt Lucas' "Vicky Pollard" character in Little
Britian, whose catchphrase is "Yes, but no, but yes, but no, but...".  Let me
explain.

## TL;DR

For enterprise coding there is a floor to the level of quality necessary, LLM's
exceed that because it has enough training data to do it, and is far faster than
most human devs.

## Longer Story 

### Background

For me, and I answered in the post, the answer is "Per hour, absolutely." My
tool of choice right now is a terminal/TUI with Claude Code so using the
Anthropic models, although this has nothing necessarily to do with that
particular tool.

My world is "enterprise" development.  That is, writing primarily web based
systems with well known languages (Javascript/Typescript) with a separate
backend also with well known languates (Java, Ruby, Python, bash, SQL) using
well known deployments (AWS, Kubernetes, Github Actions) with well known
monitoring (too many to list).  You see a pattern here.

VERY little in my world is "novel".  It may be a step above CRUD apps, but not
much.  We use established patterns and idioms to glue together well known
frameworks in expected ways to get some bespoke output based on the data we
have.


### Value

Our value is in the Product Managers knowing what our particular customers want
to do, and we write code to allow them to do that, hopefully with as little
friction as possible.  People like me generate the most value by delighting the
customers as quickly as possible.

This is an important thing though, and there's more to it than just shipping
code quickly.  Some of that is saying "no".  It's not a delight to customers if
your design is slowing you down.  It's not a delight if you have to support and
work around code for features that no one uses.  It's not a delight if your
build process takes hours.  So it's a balance of getting out the right stuff and
not letting the wrong stuff get in your way.  This is mostly design and not
code/implementation, which is where devs like me who have been doing this for
too long have some extra value.

## Right, And?

So how does AI factor in here?  Because almost all of my "work" is using well
established tech, all the LLM vendors had an enormous corpus of prior art to
steal, errr, "train on".  So the models well know all the patterns, frameworks,
best practices, error conditions, etc.  It's generally VERY GOOD at coming up
with a reliable, idiomatic solution for your question.  This all does require
some good prompting, context window management, etc., but we're all learning
that.  And, it does this in minutes where it would have taken me hours or days
of (very education/experience) trialling and erroring and reiterating.  And,
it's generally good enough.  It's readable, idiomatic, has acceptable error
checking, etc.  It's not _exciting_ code, but the older I get the less I want
that.

Would my artisinal, hand-tooled, anguished over code be "better"?  Probably, for
some value of "better", but for this particular type of application, that
doesn't matter and LLMs are a hell of a lot faster.  The "quality / minute" is
just higher.  Design does still matter, a lot, and that's where I and my
colleagues still do it mostly by hand (or by whiteboard).
