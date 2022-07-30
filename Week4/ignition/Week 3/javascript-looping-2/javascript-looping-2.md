We've seen the `while` and `do/while` loops, but *there's more!* Here are some essential ways to run a `loop`. We will use **iteration** to great lengths!

## Learning Goals  

* Loop through arrays in JavaScript using `for` and `forEach`.

### Ways to Loop  

In JavaScript, we're given a few different ways to run loops:

* **while** - loops through a block of code while a specified condition is true
* **do/while** - also loops through a block of code while a specified condition is true. Works the same way as a while loop, but the code inside will execute AT LEAST 1 time, even if the condition is false.
* **for** - loops through a block of code a number of times
* **forEach** - an updated way to specifically iterate through our arrays

### The for loop

Here's the format you'll use in your `for` loops:  

```javascript
for(counter; conditional limit; counter incrementer) {
  code block to be executed
}
```

As an example, here's a simple `for` loop with the same functionality as our `while` loop from part 1:

```javascript
for(let i = 1; i <= 3; i++) {
  console.log('Blast off!')
}
```

```no-highlight
// i = 1
Blast off!
// i = 2
Blast off!
// i = 3
Blast off!
// for loop stops running
```

Our first parameter, the counter `let i = 1`, sets up a variable that will start at a certain number. Here, we're saying we want to start our number off at 1.

Our second parameter, the conditional limit `i <= 3`, sets up the rules for how long our loop should continue for, just like our `while` loop. Whatever is given as the second parameter will test if the given condition is true or false to decide if the loop should continue. Here, we're saying that we want our counter `i` to start at `1`, and our loop should continue until the counter reaches `3`.

Finally, our third parameter, the counter incrementer, tells our `for` loop how to change the number `i` each time. We use the incrementing functionality `i++` to add `1` to our counter each time we loop through our `for` loop.

The benefit of `for` loops is that they assume we'll be doing some kind of incrementing as we go. We will typically use `for` loops to loop through an existing array: so instead of hard-coding our limit (`i <= 3` above), we could use the `length` of an array to decide our limit. Let's take a look at the below example:

```javascript
const airTravelArray = [ "ship", "rocket", "satellite", "drone"]

for (let i = 0; i < airTravelArray.length; i++) {
  console.log(`${airTravelArray[i]}s away!`);
}

// ships away!
// rockets away!
// satellites away!
// drones away!
```

 Here, our counter is preset to `0`: `let i = 0`. This is saying "Set up a variable to represent our index, which starts at 0."

 Our conditional limit here is actually using the length of our array to know how long our loop should continue for. Here, we want to continue "For as long as our 'i' is less than the length of the given array" (or until we have reached every single item in our array).

Our incrementer will stay the same to make sure we look at each item in the array in order: `i++`.

Finally, inside our loop, we're able to use our `i` index to look at a specific item in the array and use it for our `console.log`! We reach the item we're looking for using `index`: `airTravelArray[i]`.

### The forEach loop

In ES6, we gained an even more readable way to loop through our arrays: the `forEach` loop. This syntax will still allow us to iterate over our arrays, but it is oftentimes preferable to a `for` loop because of how much clearer it is in its syntax. `forEach` loops utilize `arrow functions` to set up easy, readable loops through our arrays, using the following format:

```javascript
myArray.forEach((element) => {
  // do something with the element at hand
})
```

We can see that we no longer need to worry about indices, or a limit, or incrementing our `i` variable. Instead, our `forEach` loop is assuming we're looking at an array, it will give us direct access to that array, and then stop once we've gone through the entire array. How nice is that?

Here is our prior `for` loop refactored with `forEach`:

```javascript
const airTravelArray = ['ship', 'rocket', 'satellite', 'drone']

airTravelArray.forEach((vehicle) => {
  console.log(`${vehicle}s away!`)
})

// ships away!
// rockets away!
// satellites away!
// drones away!
```

In the two above examples, we use a placeholder to represent the individual elements in each array. In our `airTravelArray` we chose the word `vehicle`. It could be any word you want, but convention is we choose a word that relates to the elements within the array.

You will use the `forEach` method *a lot* when dealing with arrays. Make sure to commit this method to memory.
