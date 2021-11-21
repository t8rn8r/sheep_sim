# sheep_sim
The most realistic sheep simulator in existence

Computer scientists are very smart. They are able to solve complex problems to achieve their goals and make successful products. They wield tools that are baffling to the average person but still manage to design simple interfaces that the rest of us can understand.
Sheep can do none of those things. I've spent the better part of almost two decades herding sheep, and let me tell you the one thing I've learned from all of it: sheep are not smart.
I don't know if it's nostalgia or just curiosity, but I've kept my eye out for a good sheep herding simulator and have yet to find one. Every one I've looked at fails to understand one key bit of information: sheep are very dumb. 
When a computer scientist sets out to program a sheep, they usually start with the fact that sheep like to be close to each other. When you program that, it gives you something like this:

[I'll put this image in later]

But this isn't how sheep actually behave. If they acted like this, they would smother each other. The next thing a programmer might do is tell the sheep not to get too close to each other:

[I'll put this image in later]

That doesn't look right either. 
Instead of doing these things, I've changed the rules here beginning with the fact that sheep don't really make decisions. They just exist in a semi-conscious state of reacting to the world around them.
First things first, sheep basically move randomly when there's no other simulation. Here's what that looks like:

[I'll put this image in later]

They just wander around aimlessly, bumping into each other and everything else. I can confirm that this is accurate behavior.
Now, to continue the randomness, instead of setting hard and fast rules for how sheep make decisions, I'm going to say that a sheep will randomly choose between two options:

1. Move toward another random individual sheep.
2. Move away from another random individual sheep.

This is called a stochastic simulation. It is a much more accurate representation of how sheep actually behave and it has the bonus of being less computationally intensive (just like a sheep's brain). Here's what it looks like when I incorporate that one simple rule:

And here's what they look like after a long time of running the simulation:

[I'll put this image in later]

Now that's all fine and good, but will they herd? Yes! Yes, they will!
My simulation assumes two things that relate to herding:
A sheep is very unlikely to actually see and react to the shepherd. 
A sheep is very likely to do whatever it sees another sheep doing. 
In practice, this means that when there's a shepherd trying to herd the sheep, only a few of the sheep see the shepherd and run away; however, a lot of sheep see the other sheep running and choose to do the same thing:

[I'll put this image in later]

Here's a video of my sheep simulator in action! I've decided to call it Sheep Sim and release it as a playable game.

[I'll put this in later]

