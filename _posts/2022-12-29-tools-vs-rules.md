---
author: Michael
layout: post
---

I'm a big fan of lists and checklists specifically.  It's been shown that people make significantly fewer mistakes when
_actually_ following a checklist, even when doing things they've done so many times it's just rote.
[Doctors](https://khn.org/news/hospital-checklist-mainbar/) and pilots are 2 very visible examples.

However, I've seen a lot of times that development shops often stop there.  They figure if a checklist is in place,
fewer mistakes are made, right?  Right??  Well, sometimes.  As the saying goes, rules and procedures don't reduce risk
so much as they just tell you who to blame when something goes wrong.

The "Tools, not Rules" movement is one way around that.  Don't tell people what to do, automate it.  This works
especially well in software development shops, where people WANT to do the fun creative stuff and the non-fun rote stuff
can often be automated anyway.

The CI/CD part of modern dev is moving (thankfully) to this direction.  In `$PREVIOUSJOB`(s), the number of steps to get
from writing your code to getting it deployed was mind-bogglingly long.  Everything had to be done in a specific order,
with many edge cases and many ways it could fail; it was stressful.  Luckily I've seen orgs generally going towards a
more "classic" model of having engineers who are good at the CI/CD pipeline architecture actually specialize in that to
write systems to help deployment -> deploys go smoothly, quickly diagnose and fix issues, and make both their own and
their customers (generally developers) lives easier.  This not only makes everyone happier, but makes the entire org
more efficient.  "Everyone should do everything" DevOps _sounds_ good on paper, but I've yet to see it actually work for
real.  Management loves it (hey, get 1 person to do 2 jobs, for 1 salary?  Win, right?), and there are indeed a lot of
people who not only can do this but enjoy it, but consider that for every hour of "ops" study/practice/expertise one
has, they could have had that hour of "dev" study/practice/expertise, or vice versa.  Maybe companies just don't need
really good devs, or really good ops, just good enough is fine.
