# **Conventions**

*****************

## BUT WHYYYYYY?

We need some conventions in place to have some clarity in what's happening in the project. Makes some stuff a lot easier.

As much as I disdain these, they are useful once you get used to them...

*****************

## File naming

There is no explicit rule except all files should be in lowercase and spaces should be replaced with an underscore:`_`
Come up with something funny too, I think a lot of people would appreciate some funny file names here and there! (At least I would...)
Keep the names SFW of course...

*****************

## Git commits, PR's & branches

### How to

For each change that's made, make a new branch! I.E.
**DO NOT PUSH TO MAIN DIRECTLY**
The branch and PR should have the same name. If possible, the commit should have the same name too. But if there are multiple commits in one branch, then obviously use different names.

To give an example. I want to make a new README file.
I'll start by making an branch called "fix:README" or something similiar.
Clone it, do my changes.
When i'm finished with my changes, make an pull request to merge with main with the user RichCat-code to approve it.

Bim bim bam bam, I approve or dissaprove and magic happens!

### Naming conventions

* "Feat" - New feature.
* "Fix" - Fixed an existing feature.
* "Perf" - Changes that impact performance positively.
* "Docs" - When documentation of anykind is changed.
* "Chore" - Maintenance of code or application.
* "Style" - Changes with any kind of style.
* "BC" - Breaking change, large changes to code.

Example: Let's say I'm **FIXING** an existing feature.
I'd call the branch "fix:IO-STAT-retrieve". So the type of change goes first then comes the descriptive name.