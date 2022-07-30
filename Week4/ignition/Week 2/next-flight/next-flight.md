### Getting Set Up

```no-highlight
et get next-flight
cd next-flight
code .
```

Complete your work in the `code.rb` file, and run your code in the terminal like this:
```no-highlight
ruby code.rb
```

## Instructions

Your new space flights are a huge hit - so much that you're flooded with calls about timing. It's time to automate!
Given the following data, calculate the user's next available flight based on their input of when the earliest is that they can leave. For ease of development, use a 24-hour decimal format where 1:15PM == 13.25.

```no-highlight
Flight 1, 2
Flight 2, 5
Flight 3, 7.5
Flight 4, 8.5
Flight 5, 9
Flight 6, 10
Flight 7, 11.5
Flight 8, 13.5
Flight 9, 14.5
Flight 10, 17
Flight 11, 18
Flight 12, 19
Flight 13, 24
```

_When the user specifies a time that they want to leave Earth, the system should inform them of the next available flight_

## Meeting Expectations Requirements

### Part 1

* Use an array to store the flight timetable
* Write Ruby code that asks the user when they want to depart - Expect that the traveler will enter their time in decimal format, i.e. `11.25` instead of `11:15AM`. 
* Here is an example run of what your program might look like:

#### Sample Run:

```no-highlight
ruby code.rb
What time are you leaving?
> 12.5
You should catch Flight 8 leaving at 13.5
```

### Part 2

* Handle bad traveler input. Any input that is not a number should prompt the traveler to re-enter the data. For example, after running `ruby code.rb`:

#### Sample Run:

```no-highlight
What time are you leaving?
> abcd
Sorry, I don't understand that time.

What time are you leaving?
>
```

### Tips

* Remember that elements within an array are accessed via a 0-based index.
* To get the flight number, add one to the index.
* **DO NOT** start the requirements necessary to Exceed Expectations until you have completed the requirements necessary to Meet Expectations. Remember to `et submit` after Meeting expectations - it's okay to submit more than once!

## Exceeds Expectations Requirements

* Update the program to notify users when the recommended flight is the same as their preferred departure time.

```no-highlight
As a space traveler
I want to know when my recommended flight is scheduled
So that I can arrive on time
```

#### Sample Run:

```no-highlight
$ ruby code.rb
What time are you leaving?
> 10
You're in luck! Flight 6 is leaving at that exact time.
```

* Customers have been asking for alternative flight suggestions in case their preferred departure time is close to another time. Continue to recommend the next available flight, but also check if their preferred time is 1 hour or less away from the _previous_ time slot.

```no-highlight
As a space traveler
I want to know if there is an alternative time slot
So that I can try to catch an earlier flight
```

#### Sample Run:

```no-highlight
$ ruby code.rb
What time are you leaving?
> 9.5
You should catch Flight 6 leaving at 10. If you're looking for an earlier flight, Flight 5 will be leaving at 9.
```

* Simulate the following output if the user should catch Flight 13.

```no-highlight
As a space traveler taking the midnight flight who also _loves_ Journey
I want to see the lyrics from Journey's masterpiece "Don't Stop Believin'"
So that I can sing along
```

_When the system identifies the midnight flight as the next available flight, the user should be presented with the lyrics from "Don't Stop Believin'"_


#### Sample Run:

```no-highlight
$ ruby code.rb
What time are you leaving?
> 22
You should catch Flight 13 leaving at 24

***DON'T STOP...BELIEVIN'!***

Just a small town girl
Living in a lonely world
She took the midnight train going anywhere
Just a city boy
Born and raised in South Detroit
He took the midnight train going anywhere

A singer in a smoky room
A smell of wine and cheap perfume
For a smile they can share the night
It goes on and on and on and on

Strangers waiting, up and down the boulevard
Their shadows searching in the night
Streetlights people, living just to find emotion
Hiding, somewhere in the night.
```
