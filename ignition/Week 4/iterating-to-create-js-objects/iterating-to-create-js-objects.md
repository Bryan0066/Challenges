One of the most useful methods for working with arrays in Javascript is `.map`. Let's take a closer look at this function, starting with its cousin `.forEach`.

### Learning Goals
* Identify the power of using `.map` to create new arrays of information.
* Examine how to iterate over objects and compound data structures.

### .forEach

 We can use `.forEach` to perform an operation _for each_ item in an array. It takes as input a callback function that describes what we want to do for each element of the array.

 Let's say we have a list of colors. We want to print every color plus the string `" spaceship"` to the console. We can do:

 ```javascript
 const shipColors = ["White", "Black", "Gold", "Silver"]

 shipColors.forEach(color => {
   console.log(color + " spaceship")
 })

 // "White spaceship"
 // "Black spaceship"
 // "Gold spaceship"
 // "Silver spaceship"
 ```

Now let's modify this example to illustrate a case better handled with `.map`. Here, we want to actually store each of our concatenated strings to a new array, and then print that array to the console. Let's evaluate how we would do this with `.forEach` first, and then `.map`.

```javascript
const shipColors = ["White", "Black", "Gold", "Silver"]

const ships = []

shipColors.forEach((color) => {
  ships.push(color + " spaceship")
})

console.log(ships)
// ["White spaceship", "Black spaceship", "Gold spaceship", "Silver spaceship"]
```

In this example, we:
* create a new empty array called `ships`
* Use `.forEach` to begin iterating over each color in the `shipColors` array
* `.forEach` accepts a callback function (denoted by the arrow function `=> {` that is performed for each element)
* Add the substring `spaceship` to each color string to create a new ship color string
* Use `.push` to add our new string to the `ships` array
* Call `console.log()` on the new `ships` array

Our iteration takes the values from the original `shipColors` array and alters those values slightly, and at the moment this takes quite a few steps. When performing a loop where we make such alterations, using a slightly different iterative method, `.map` can improve our code.

### Revisiting .map

The `.map` function streamlines this altering process for us. Take a look:

```javascript
const shipColors = ["White", "Black", "Gold", "Silver"]

const ships = shipColors.map((color) => {
  return color + " spaceship"
})

console.log(ships)
// ["White spaceship", "Black spaceship", "Gold spaceship", "Silver spaceship"]

console.log(shipColors)
// ["White", "Black", "Gold", "Silver"]
```

Now we're letting `.map` create this new array for us! All we need to do is provide a callback function that _describes_ what we want each element in that new array to be. In plain English, the return statement says "give me the concatenated color and `" spaceship"`."

* Just like .`forEach`, `.map` takes a callback anonymous function `color => { ... }`. The difference here is that instead of adding to a separate array (the empty ships array in the first example), we call `return` an element that will be stored inside the variable `ships` for us. We didn't need to declare a new array, this is done for us!

* Once the iteration of over the `shipColors` array is complete, and our callback function has been called for each element, `.map`  will collect the returned variables in a _new_ array for us, called `ships`

* Notice how we have set our `ships` variable a little differently. Instead of declaring it as an empty array, we've set it equal to whatever is returned from `.map`, which again, is an array of all of the values returned from our callback function.

### .map with Objects

Let's look at a more complicated example, in which we want to construct an array of combined first and last names for each space explorer listed below:

```javascript
const spaceExplorers = [
  { firstName: "Buzz", lastName: "Aldrin" },
  { firstName: "Neil", lastName: "Armstrong" },
  { firstName: "Ellen", lastName: "Ripley" },
  { firstName: "Malcolm", lastName: "Reynolds" },
  { firstName: "James", lastName: "Kirk" }
];
```

What if we wanted to construct an array of combined first and last names for each space explorer, instead of storing them as key value pairs?

```javascript
const fullNames = spaceExplorers.map((spaceExplorer) => {
  return spaceExplorer.firstName + " " + spaceExplorer.lastName;
});

console.log(fullNames);
// ["Buzz Aldrin", "Neil Armstrong", "Ellen Ripley", "Malcolm Reynolds", James Kirk"]
```

In this case, we have a slightly more complex data structure, an array of objects. With the `.map` method, all we have to do is _describe_ what we want each new data point to be. A plain English or "pseudo-coded" interpretation of our example might be: iterate over each spaceExplorer object, and add the values stored in firstName and lastName into one string, collecting all of the full names together in a `fullNames` array as we go.

### Creating our Own Objects with .map

Creating an array of strings is all well and good, but what if we wanted to also create our own array of objects? Let's practice this, and create an array of more complex objects as we go.

Here, we create objects to house each of the full names of our spaceExplorers:

```javascript
const spaceExplorerObjects = spaceExplorers.map((spaceExplorer) => {
  const combinedName = spaceExplorer.firstName + " " + spaceExplorer.lastName;
  const spaceExplorerObject = { fullName: combinedName  }
  return spaceExplorerObject
});

console.log(spaceExplorerObjects);
// (5) [{fullName: Buzz Aldrin }, {…}, {…}, {…}, {…}]
```

##### Creating Objects with Multiple Properties
Creating objects for each spaceExplorer AND giving them each a `distanceTraveled` property, which will be defaulted to 953,054:

```javascript
const spaceExplorerObjects = spaceExplorers.map((spaceExplorer) => {
  const combinedName = spaceExplorer.firstName + " " + spaceExplorer.lastName;
  const spaceExplorerObject = { fullName: combinedName, distanceTraveled: 953054 }
  return spaceExplorerObject
});

console.log(spaceExplorerObjects);
// (5) [{fullName: Buzz Aldrin, distanceTraveled: 953,054  }, {…}, {…}, {…}, {…}]
```

##### Modifying an array of objects
Let's pretend we are also given an array of `fictionalCharacters`.
```js
const fictionalCharacters = ["Ellen Ripley", "Malcolm Reynolds", "James Kirk"]
```

We want to _normalize_ our data by transferring the information in this new array to our spaceExplorerObjects array that we have already defined. If the name of a fictional character exists in our `spaceExplorerObjects` array, we'll give them a property `fictional` set to the boolean `true`. Otherwise, their `fictional` property will be `false`.

We'll have to make use of the [.includes](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes) method to help us. The `includes()` method determines whether an array includes a certain element, returning true if it does contain that element, or false if it doesn't. Thus, calling `fictionalCharacters.includes("Ellen Ripley")` would return `true` because `"Ellen Ripley"` is a part of our `fictionalCharacters` array.

Now let's implement our solution with `.map` on the array we created in our last example:

```javascript
// Assume we have already used the code in the previous example to create spaceExplorerObjects

const fictionalCharacters = ["Ellen Ripley", "Malcolm Reynolds", "James Kirk"]

const newSpaceExplorers = spaceExplorerObjects.map((spaceExplorerObject) => {
  const newSpaceExplorerObject = spaceExplorerObject

  if (fictionalCharacters.includes(spaceExplorerObject.fullName)) {
    newSpaceExplorerObject.fictional = true
  } else {
    newSpaceExplorerObject.fictional = false
  }

  return newSpaceExplorerObject
});

console.log(newSpaceExplorers);
// (5) [{fullName: Buzz Aldrin, distanceTraveled: 953,054, fictional: false  }, {…}, {…}, {…}, {…}]
```
Let's break it down:
* We iterate over our array of `spaceExplorerObjects` from the last example
* We declare a new variable `newSpaceExplorerObject`, which looks exactly like our old `spaceExplorerObject`, except we plan on modifying this one to include a fictional status.
* If the space explorer's name can be found in our list of `fictionalCharacters` with `.includes`, we assign our new object a property of `fictional` set to `true`, otherwise we set said property to `false`.
* We return the `newSpaceExplorerObject`, so that it can be collected into the array of `newSpaceExplorers`.

Our iteration is getting powerful, but believe it or not that last example could have been executed quite similarly with `.forEach`.

```js
spaceExplorerObjects.forEach((spaceExplorerObject) => {
  if (fictionalCharacters.includes(spaceExplorerObject.fullName)) {
    spaceExplorerObject.fictional = true
  } else {
    spaceExplorerObject.fictional = false
  }
});
```

And this time `.forEach` was more expedient!

## Conclusion

As we can see, `.map` is not a replacement for `.forEach`. There are times when one or the other can be slightly more useful in terms of implementing a solution.

`.forEach` just executes a callback function for each element it iterates over. `.forEach` itself doesn't actually return anything.     
`.map` also executes a callback function for each element it iterates over, but its unique characteristic is that *it also returns a newly mutated array in place*.

You often see and use `.forEach` for executing simpler changes to an existing array, or perhaps for logging each of the values of an object. Whereas `.map` can be used more often for creating an entirely new array of elements, based off of information from the array we called `.map` on.

You might be thinking that the difference between `.forEach` and `.map` is pretty subtle, and you would be correct! So why bother learn `.map` at all? The map method is just another small building block in the tool belt that leads to greater power over how we transform our data.
