---
author: Michael
layout: post
---

Antony Marcano made a
[wonderful](https://www.linkedin.com/posts/riverglide_one-thing-holding-back-agile-in-your-company-activity-7029690545807466497-TpW3?utm_source=share&utm_medium=member_desktop)
post on a common Agile issue on LinkedIn.

This hits a few issues I've seen and have thought about over the years.  This is from an
enterprise point of view, but I've seen it in small orgs, too.

## The Pendulum

First, this is all part of the great project-team vs functional-team pendulum.  An org
will get all gung ho on "full stack" self-delivery project teams that own a project from
soup to nuts.  It's wonderful, in theory.  Except orgs aren't often organized
_technically_ that way; they're organized with some technical economy of scale in mind;
one db/domain model, one UI, etc.

### The Project Team
So they start a project team and are delivering stuff.  Great!  However, they also find
that too many specialties are needed too rarely; the projects don't need a full time UI
person, or a full time DB specialist.  The DB model is corporate wide, so each team's DB
person can't affect change in a meaningful way.  The org doesn't do [micro]services that
can be truly deployed on their own, they don't need a CI/CD person per team, and the devs
don't have enough time to learn all that.  Some people are bored.

Also, sometimes these cross-org technical decisions (one domain model, one UI library, a
common CI/CD thing) are slowing things down. Who owns this?  Why do I need a committee to
get a new table?

Or the other side of the coin; stuff is being put in with not enough standardization.
Team Tiger is using React, but Team Wolf decided on Vue (because they were just acquired
and still fancy themselves a scrappy startup, and no we THEY'RE going to bow down; it's
our culture!).  This table makes no sense since THAT table we already had would have
worked just find with a little tweaking.  OH MY GOD you can't change that column name
without letting everyone know!  DUDE we have a CI/CD workflow for a reason, just throwing
stuff in there makes it un-monitorable.

### The Functional Team
Bean-counters start saying "Why do I need 15 db/ui/ci/etc/ people when they're only
engaged 17% of the time?  We can get economy of scale by putting them in one team and have
the other teams use their specialized service!"  "We need to standardize so we can have
people move around as needed."  "All of our stuff is a mess; no one talks to each other."
(Of course not, that would slow everyone down.)

So, the "functional team" edict is given, and the data team, or a ci/cd team, etc. are
created.

These teams know their stuff and the specialization really works and labor money is
saved. Hooray!

### Cracks Appear
Since each "project team" now needs services from these functional teams, stuff starts to
stall.  It's no one's fault, every functional team is now "scaled economically" and
everyone is at 100% capacity, but there are only 24 hours in a day and they're swamped, so
stuff gets held up.

Project managers then start complaining of the inevitable gatekeeping.  You can't just
throw a widget on a page or create a new column; the UI/DB team needs to do that!  It'll
get done, but now they're organized like that they are at 100% capacity and stuff is slow.

### Denoument
So they think "These functional teams are too slow, and we're not delivering" so the bean
counters agree that revenue is important and they start the project team orientation.

`goto 'The Project Team'`

## Size Matters

### Too Big

Part of this is just due to some org's size.  Beyond a certain size, human nature is such
that fiefdoms and sub-groups and power struggles just naturally appear. I've yet to see an
org beyond whatever that magic limit is not start to fracture this way.  And the C suite
keeps preaching this "One <X>" for "your company" values of <X>.  It Just Doesn't Work
That Way(tm), but everyone tries and puts on a brave face and gets their annual bonuses
knowing stuff isn't working, but hey, a man's gotta eat.

### Too Small
On this side, the org is too small to HAVE much specializtion, which is a shame since
specialization is what allows civilisation to exist and we'd all be gathering our own food
still were it not for that. Startups almost necessarily NEED the "one person wearing meany
hats" type people, but these people are not as plentiful as one would expect, and they
tend to be younger.

This need and mentality however just doesn't scale after a certain point, and hanging on
to that is romantic, sure; it's what got you here, but ultimately is a bit naive and IMO
kind of childish.  At some point you have to put on your big boy pants, figure out where
you are in the pendulum (assuming you're actually growing beyond this size) and start
playing that delicate balancing act.

That can be hard since these inflection points require process changes, and process
changes require human changes, which can be "hard" to "impossible".  Sometimes it's easier
to change WHICH humans you have than to change THE humans you have.

## Waterfall... Wasn't That

A bit of a tangent but interestingly few people realize the OG waterfall paper actually
did have feedback loops in it, so the typical stairstep diagram isn't necessarily
accurate.  Not sure why that got lost in the zeitgeist, but I suspect because of company's
need to simplify at the cost of breakage (see Deming: "People will align to their
incentives even if they have to break the enterprise to do it").

It's definitely "easier" for a team to throw something over the wall and consider it done
rather than be on the hook for rework in the feedback loop.  I blame MS Project and Gantt
charts, and not even jokingly; it keeps that mindset going and people get locked into it,
not even realizing it could be done differently.

But too, "functional" teams LOVE this since they can check off "todo" items, prioritize
work, and keep a queue of small, specialized things going.  Is it the best way, or even a
_good_ way to do things?  Perhaps, perhaps not - but again a function of the org size is
just that there's a fundamental incongruity between trying to appear to be "one org doing
one thing/application well" vs sub-groups, power struggles, and fiefdoms that human nature
will never get away from.
