---
author: Michael
layout: post
---

Naming is hard in computer science; anyone who has been in the industry for any length of
time knows this. (Yes, I know "the joke".)

While not getting into a deep philosophical treatise on good or bad names, there are a few
rules of thumb _I_ like to follow. Never forget source code is for people to read; that
computers can make use of it is only a nice side effect.

* Name something what it is or what it's for.
* AVOID THESE: `item`, `data`, `status`, `object`, and `info`. These are all meaningless
 non-names which do nothing to help the reader. Even in very small scopes I flag these
 in PRs.
* Time marches on, so NEVER name something `..._new` or `new_...`, since it won't be that
 for very long.
* Personally I'm fine with longer more descriptive names; the extra context is worth it,
 and my IDE can navigate and autocomplete them without the burden of the extra typing.
* Use units if you can and where it makes sense to do so. `time_seconds` vs `time`,
 `weight_lbs` vs `weight`. This is doubly useful if you're not using a language with
 that sort of thing enforced by a type system.
* You can get away with shorter names for smaller scopes, especially if it's idiomatic in
 your context to do so. `i`, `j`, and the like for 2-3 line loops are fine. In general,
 the bigger the scope the bigger the name.
* Your industry, language, company, etc. has idioms.  Most of these naming rules can be
  broken for those.  In FinTech for example, EVERYONE KNOWS what `acct` means, or `dr` vs
  `cr` in Accounting.  Naming things with the idioms is fine, and in some places
  required.  (Some shops have a list of abbreviations that are not only allowed, but
  required.  I see nothing wrong with this.)

Above all, make this source code easily understandable by anyone with a reasonable
background into the tech and/or domain, including FutureYou.  Minimize as much as you can
making anyone have to go look up for figure out what you mean.
