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
![shortcut](/Un-linked%20scripts) 

1. Open a powershell session
2. Run file1.ps1
3. Run file2.ps1

You should get this output:

![alt text](/Un-linked%20scripts/un-linked%20scripts.png)

If you edit replace $global:value1 in file1.ps1 with $value1 and run these again in a different Powershell window you'll see a different result. There will be nothing returned when you run the second script.

## Dot sourcing files and Scope problems

## Slightly larger application structure (making things easy to find)

## Passing values back to Jenkins/Groovy from Pipeline script execution

## Error messaging and 'Advanced' Functions (why use so called 'Advanced' functions)

<!-- 
TODO: Return values... How this actually works
TODO: Is there a way to 'diagram' this better?
TODO: Entry and Exit points as a way of explaining this stuff better?
-->
