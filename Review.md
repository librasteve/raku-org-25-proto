# Review Spike01

Thanks for agreeing to review the first iteration of a prototype upgrade to the raku.org website.

Spike01 is live here https://proto25.harcstack.org

You can also see the README to install and run locally if you prefer.

Please note that the review period is from 27-Jun to 02-Jul.

Hopefully the following will help with osme context and guidance...

## Review Process

Coming off the kitchen docs / website conversation, we agreed to limit the initial review to the summit participants plus Damian. 

Therefore the “plan” is iterate on these prototype spikes until that group reaches consensus prior to making a release plan. 

On release, the source will be published over to the raku.org repository and subsequent change requests will be open to the wider community as with the old site.

## Feedback and Change Requests

I prefer feedback and change requests in the form of a PR here please. Otherwise if less concrete, then open a new Issue. 

If your proposal needs a new layout component (or anything that needs real work), that will be an “opportunity” to grow your HARC skills (which is a lot of -Ofun).  Happy to support you!

I will try to gather and funnel changes to maintain a simple and unified design. 

## HARC Stack

My proposal for a new raku.org website is based on https://harcstack.org. If you have been following the [story](https://rakujourney.wordpress.com/all-posts/) then you will know that this is quite a distinctive and opinionated tool. 

It is based on the Cromponent work done by FCO and the Rainbow highlighter by Patrickbr as implemented in the rakudoc v2 proposal by finanalyst.  

As mentioned in the kitchen, the current HARC version was intended all along to make a new better raku.org site. So when I selected https://htmx.org and  https://picocss.com it was with this job in mind.

HARC is new and still a work in progress. Specifically I have built some new Air::Base components:

- Tabs
- Hilite (this is an HTML layer on Rainbow, soon to be a standalone module)
- Markdown
- Flexbox
- Lightbox

For me the advantage of HARC stack for our new website is to challenge and hone this tool for a real project and to have a strong reference if we are successful. (So no, I’m not going to rewrite raku.org in Wordpress). 

For the community, the benefits from this effort are:
- our raku showcase will be built on a 100% raku codebase
- we will have a modern responsive design built on a popular CSS library
- we can leverage HTMX for dynamic UX needs
- focused on attracting new coders and new sponsors 

(remember 51% of site views are smartphone)

## Deployment

I am planning to build a deployment facility for HARC stack based on the requirements we agree for raku.org which hopeully will ape / improve on existing deployment methods (rakudoc?).

My slight preference is to leverage the work I did on https://github.com/librasteve/raku-CLI-Wordpress with docker / docker-compose ... but happy to adapt to the raku deployment team needs.

Please add any thoughts to deployment Issue(s).

## Requirements 

Check out the Requirements.md file here to see the intent and focus as already reviewed by the wider raku community.

I am now closing the requirements consultation so that we are not chasing a moving target. 

## Inspiration 

Looking at “competitive” programming language sites (Python, Swift, Go, Ruby, Rust) has been an important part of the design process. There are some very strong (and well funded) sites out there. 

I have been particularly inspired by:
- swift page layout and code vignettes
- rustup installation focus

## Focus

For me, web design is a learned skill and my usual process is to try stuff and see how it looks. The current spike 01 is the result of 100s of iterations… 

What you see is building on the old raku.org example code and (i) extending that approach (as in  the swift site) to cover the (very many) unique aspects of raku and (ii) working out a way to gradually reveal these (tabs) without overwhelming visitors.

Please, please provide any feedback and improvements you can to these examples. I fear that there are too many already so those that can effectively combine several cool features will be much favoured. 

So the main idea of the site is to engage coders who have not considered raku before and to encourage them to install and try. 

The main call to action - the install - is given a dedicated page and a tight focus on one installation mechanism. Patrickbr has agreed for me to reskin the rakubrew.org content (with the potential to retire the rakubrew.org site) to avoid the visual shock of going to an external download site. 

As agreed in the kitchen, the raku, rakudo, rakudo star navel gazing has been deliberately left out - a classic pitfall of unimportant data irrelevant to newcomers that cause friction to the desired outcome.

## Omissions

There are some things I want to do but didn’t want to delay this review:
- other install options
- list IDE options
- cover Community options (Discord and IRC)
- carousel for sponsor icons
- footer items
- link to glot.io sandbox
- link to suggest change to this site
- link to rosetta https://rosettacode.org/wiki/Category:Raku
- link to rakudo latest releases https://rakudo.org/news

Much of this will be brought in directly from the main site 

If you want a specific install option or IDE to be listed please raise that here by PR or Issue. It is apparent that many install options (eg `apt install rakudo`) should be excluded due to the very old raku versions they supply, so be prepared for a quality assessment. 

## Pitfalls

The “competitive” sites demonstrate many of the pitfalls:
- many confusing options that only serve insider interests (eg Python looks designed by committee)
- lack of a clear focus and objective
- too much reliance on gadgets (such as code sandboxes)
- too much marketing jazz (swift)
- websites with many sadly neglected pages 

I am a strong advocate of simplicity, focus and a frictionless experience to attract new coders to join us and grow our community.

And I’m lazy. 

Therefore spike 01 is deliberately minimalist (but already contains a massive amount of code examples) and in general I would like to avoid adding more stuff. So if you want to request something new, please also tell me what should be removed. 
 
## Triage

New requests will be treated according to:

### Positive
- stuff I have asked for
- stuff that I should have asked for

### Dubiuos
- multiple ways to do the same thing
- stuff that needs additional pages or aside blocks

### Negative
- things that don’t work or poor quality
- things that are not relevant to the site objectives

here endeth the lesson :-)
