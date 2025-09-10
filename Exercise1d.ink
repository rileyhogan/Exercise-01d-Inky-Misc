/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Varrying text via loops
 - Functions
 
 In the assignment:
 - A story with at least 6 knots
 - Vary some text via a loop
 - Create a function that serves as a timer. (This is shown in the video)
*/


VAR torches = 0
VAR recollection = -1
VAR big_macs = 0
VAR cleanliness = 0
VAR time = -1


-> memory

== memory ==
{recollections()}

* [Sniff around] -> sniff
* [Taste...around] -> taste
* [Feel, well, whatever comes your way, man. We're all just passing through.] -> feel
* {recollection > 2} [Open the door] -> cave_mouth0

== sniff ==
Like a bloodhound health inspector closing an Olive Garden, the smells of parmesan and burnt olive oil linger on your nose.
    -> memory
== taste ==    
Like the murderer of a family of innocent pickles, the guilty taste of vinegar haunts your tongue.
    -> memory
== feel ==    
Like the owner-operator of your own personal salt mine, the capitalist itch of dry hands wordlessly markets emollient creams to you.
    -> memory

== cave_mouth0 ==
You come to the conclusion that you probably botched the gnocchi again and passed out scrubbing at the pan. Inconceivably, the door opens to the entrance of a cave.
* [Look around] -> cave_mouth

== cave_mouth ==
You think it's {advance_time()}. {time == 1: If only you had some lunch.} {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.
+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* {not torch_pickup} [Pick up the torch] -> torch_pickup
+ {time == 1} {big_macs > 0} [Eat Big Mac] -> lunch_time_loophole

== east_tunnel ==
You are in the east. It is very dark; you can't see anything.
+ {torches > 0} [Light torch] -> east_tunnel_lit
+ [Go back] -> cave_mouth

== west_tunnel ==
You are in the west. There are three doors, facing north, south, and west. {hands_washed:You feel fresh and ready for adventure.}
+ {big_macs > 0} [Eat Big Mac] -> big_mac_eaten
+ [Go north] -> north_door
+ [Go south] -> south_door
+ [Go west] -> west_door
+ [Go east] -> cave_mouth

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
+ [Go back] -> cave_mouth

== east_tunnel_lit ==
The light of your torch glints off thousands of coins in the room.
+ [Pick up a coin] -> coin_pickup
+ [Go back] -> cave_mouth

== coin_pickup ==
You pick up a coin. Turns out it's made of chocolate. Too bad you're allergic.
+ [Flick it away and run off in fear] -> cave_mouth

== north_door ==
You enter the north door, and are shocked to find yourself in a suburban McDonald's.
+ [Order a Big Mac] -> big_mac_pickup
+ [Go back] -> west_tunnel

== big_mac_pickup ==
~ big_macs = big_macs + 1
{big_macs < 2: You now have one Big Mac. You're not sure if you should be grateful or disappointed.}
{big_macs > 1: You try to order another Big Mac, but you haven't finished the first one! The server's glare humbles you into retreating.}
+ [Go back] -> west_tunnel

== big_mac_eaten ==
You take a bite of the Big Mac. And another. And another. Though each bite removes a piece of the burger, it never seems to get smaller. You ponder the implications of the infinite Big Mac as you eat.
+ [Get back to exploring] -> west_tunnel

== lunch_time_loophole ==
~ big_macs = 0
You eat the Big Mac in its entirety. Infinite or not, mankind devours all.
+ [Press on] -> cave_mouth

== south_door ==
You enter the south door, but find only a public restroom. It's surprisingly clean.
+ [Wash your hands] -> hands_washed
+ [Go back] -> west_tunnel

== hands_washed ==
~ cleanliness = cleanliness + 100
Even though you don't have to use the restroom, you take the time to wash your hands. You never know what kind of nasty stuff you might have brushed in that cave. You are now {cleanliness}% clean. Nice.
+ [Go back] -> west_tunnel

== west_door ==
You enter the west door, only to find that there is no door at all. As a matter of fact, you're not entirely sure that there is a cave either.
+ [Doubt your existence] -> existence_doubted

== existence_doubted ==
Who are you? Why did you start exploring this cave to begin with? Is this all a dream? Are you under the influence of psychotropic drugs, or perhaps anaesthesia? You can't seem to shake the feeling that your sole purpose in life is to explore this cave, and you're not sure how you should feel about that.
+ [Become one with reality] -> west_tunnel

== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 2:
            ~ time = 0
    }    
    
    {    
        - time == 0:
            ~ return "morning"
        
        - time == 1:
            ~ return "noon"
        
        - time == 2:
            ~ return "night"
    
    }
    
        
    ~ return time
    
== function recollections ==
    ~ recollection = recollection + 1
    {
        - recollection == 0:
            ~ return "You wake up with a throbbing headache, in a room with no familiar features. If you could just remember how you got here, maybe it would ease your mind. What do you recall?"
        - recollection == 1:
            ~ return "You're still in the unknowable room, but the walls have begun to take shape."
        - recollection == 2:
            ~ return "Forget what I said. The walls you thought were taking shape were actually closing in. Maybe the world isn't a place that you want to learn about."
        - recollection == 3:
            ~ return "Now you've gone and done it. You see the door. There's no turning back now. I'd commend your inquisitive spirit, if I didn't know what was waiting for you out there."
    }
    
    
    
