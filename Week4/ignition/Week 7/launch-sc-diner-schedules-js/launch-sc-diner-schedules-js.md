We've created our diner menus, but we can't have a functioning diner with just some menus! Let's keep building our diner out.

## Getting Started

```no-highlight
et get launch-sc-diner-schedules-js
cd launch-sc-diner-schedules-js
node main.js
```

## Instructions

#### Get Familiar With The Code

Let's start by reviewing the code already provided:
- A `createNewIngredient.js` file, which contains a function that takes two arguments- `name` and `category`, and return an object with those attributes.
- A `createNewMeal.js` file, which contains a function that takes two arguments- `name` and `ingredients`, and have two method- `isVegetarian()` and `isDelicious()`, and returns the object at the end of the function.
- A `createNewMenu.js` file, which contains a function that takes 3 arguments- `title`, `startTime`, and `endTime`, and have two methods- `addMeal()` and `printMenu()`

_If you completed the 'Diner Menus' assignment, the provided code will look familiar to you_

#### Part One - Refactor

Using the provided code, refactor the `ingredient`, `meal`, and `menu` objects to use `Ingredient`, `Meal`, and `Menu` classes instead. Replace the existing functions with classes and put each of these classes in their own corresponding `.js` files in this project directory, with matching names. Remember to make sure `main.js` has access to your classes!

_Additionally_, add a `static` method to your `Menu` class called `whichMenu`. This method should take in the time of day as an argument (remember that, for simplicity, we're dealing with round hours in military time, so 1PM would be `13`) and tell the user which menu is currently active. "Breakfast" should be served from 7AM - 12PM, "Lunch" from 12PM - 4PM, and "Dinner" from 4PM - midnight.

Once this is done, you should be able to un-comment the "Part One" code in `main.js` and have it run without issue, seeing your full menu printed out to the terminal and the active menu at 1PM ("Lunch").

#### Part Two - Shifts

With our menu finalized, we're ready to open our diner. Let's set up our shift schedule so we know how many employees we might need.

Create a `Shift` class in its own file. The constructor should take in two arguments- `startTime` and `endTime` (You can expect these to abide by the same time rules of our menus, with round hours in military time. Additionally). Add an instance variable named `filled` which is initially set to `false`, indicating that the shift has not yet been filled by an employee.

Once your class has been completed, comment in the code under "Part Two" in `main.js` and make sure it runs correctly.

#### Part Three - Servers

Okay, we have some shifts available! It's time to hire some servers to fill them.

Create a `Server` class which takes in one argument- `name`. A server should also instantiate with a `shifts` instance variable that is initially set to an empty array.

Add an `assignShift` method to the server. This method should take in an argument of a shift object. The method should add the shift to the server's `shifts` array, but it should _also_ mark `shift.filled` as `true`, so that the other employees know that shift is no longer available to claim!

Finally, add an `available` method which can check to see if a server is available to take a specified shift. This method should take in a shift object as an argument. When the method runs, it should iterate through the employee's existing shifts to see if they are available to take the shift that was handed in! For each shift that a server already has, you'll need to check both the start time and end time to see if it overlaps with the provided shift. If the server is available, this method should return true. If not, the method should return false Hint: As you loop, remember that you can conditionally return false at any time. If all goes well, you can then return true at the end!

Comment in the code in `main.js` under "Part Three" to test out your functionality here.

Congratulations! We've created a fully operational diner! Can't wait to have some Disco Fries and Belgian Waffles.
