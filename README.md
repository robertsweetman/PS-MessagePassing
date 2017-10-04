# Message Passing in Powershell
One thing I've run into (regardless of language I'm looking at) is that once you've 'kind of' understood the syntax differences between languages and you can make simple scripts work, well, let's say _"sorry kid, you're on your own"_. 

I began hacking at a (small? 3000 LOC) Powershell application which was driven by Jenkins to clone VMs on vCenter, copy and install a bunch of software before kicking off another set of scripts to run tests on the build. 

Given that I had literally no idea when I began beyond the basics of commandlets, actually that's nearly all, what I really struggled with was understanding how this hung together. 

Some questions I had or things I didn't comprehend till much later...

* Where did the value of 'x' variable go after I changed the code? (the WTF?! result)
* How are functions from one script accessible elsewhere?
* What's the difference between a script and a bunch of functions
* Advanced functions? Why? What's all this Param nonsense
* How do you arrange/group/manage and then change scripts/code in something that's not just one script
* Passing values 'back' to something like Groovy (global env.)
* Can you use global variables in a single session where scripts don't 'know' about each other?

To clarify my thinking around these topics I've created some examples.

At the moment it's about one example per WTF(?!) moment from the last 18 months.

## A note on learning to program/new programming languages
The one thing that I've found _super_ effective is to build experiments that show (or don't) the particular behaviour you're trying to understand. Then you've got control over the whole situation as you make small changes and can see what things break or where the boundaries are. 

I was very lucky when I began hacking at things with Powershell that I had an opportunity to work on something (unofficially) that already did a fair number of things. It's about 50% larger than when I began

The other huge advantage I have is that I work with some properly sterling developers. If I was out there totally on my own then, again, my advice would be look at a slightly larger (not huge!) application on Github and see how it's constructed. 

One thing I've appreciated in the Ansible documentation is that they actually suggest how to group roles/playbooks in a large estate, rather than making you guess. Go also has some very strong opinions about where to put files etc. Again, I think this is great. It's all about reducing the cognitive load at this point. Extra decisions to agonise over (in addition to just making something work) aren't helpful.

If you approach this type of topic as 'playing' in order to understand something rather than being under pressure to make something lovely you'll enjoy learning. If you take a different approach you might find you're going to have a bad time...

## Passing values between un-linked scripts in the same Powershell session
<!-- ![shortcut](/Un-linked%20scripts)
     TODO: add this folder shortcut to the section title -->

1. Open a powershell session
2. Run file1.ps1
3. Run file2.ps1

You should get this output:

![alt text](/Un-linked%20scripts/un-linked%20scripts.png)

If you edit file1.ps1 to replace `$global:value1 = "foo"` with `$value1 = "foo"`, **open a new Powershell window** and run them again you'll see _`file2 call result: `_ 

It's blank because there's no way to pass the value to the second script.

## Dot sourcing files and Scope problems with Invoke-Command on Remote machines
This really killed me early on. I would change locations of scripts or edit how things ran and all of a sudden the values would completely vanish. Later (with some excellent coaching and watching a bunch of videos about 'advanced' functions) I figured out a better way of managing this.

Anyway, this relies on a couple of key pieces of information.
```powershell
# right at the top of the initial script
param()
```
Parameter block has to be presented first. 
<!--TODO: figure out how strict these can be (types?)
    TODO: can you use Advanced function validation here also? Mandatory etc. as well?
-->

```powershell
# dot sourcing
. ($PSScriptRoot + "\relative path to a file")
# this pre-loads the code in that script so you can call it's contents later
```
Pre-loads the code and (ideally) should NOT have values hidden in these

If you want to do that then have a pre-defined 'global' variables .ps1 file that can be accessed by everything. Then you can pass them into each function and you explicitly know where they're coming from!

## Slightly larger application structure (making things easy to find)

## Passing values back to Jenkins/Groovy from Pipeline script execution

## Error messaging and 'Advanced' Functions (why use so called 'Advanced' functions)

<!-- 
TODO: Return values... How this actually works
TODO: Is there a way to 'diagram' this better?
TODO: Entry and Exit points as a way of explaining this stuff better?
-->
