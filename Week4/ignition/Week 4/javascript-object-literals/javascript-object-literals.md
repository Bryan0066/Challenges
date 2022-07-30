By now, we're comfortable with using JavaScript arrays to store our data - but that's not the only type of data structure available to us in JavaScript! Let's take a look at another type of data structure: the object.

## Learning Goals

- Explore best use cases for objects
- Experiment with object properties and values
- Investigate the use of strings vs symbols

### When an Array Just Isn't Enough

So far, we've studied the `Array` as a means to organize data. We've learned that arrays are best suited for lists, and that they work best in situations where you want to preserve the order of the list. Consider the example list of even numbers below:

```javascript
const evens = [2, 4, 6, 8, 10, 12, 14]
```

The list is intuitively ordered by the numeric value of each even number. So, we can assume the following English and code-based assertions:

```javascript
//first even number in the list
evens[0]
// 2

//last even number in the list
evens[evens.length - 1]
// 14

//even numbers in the list
evens.length
// 7
```

Now, imagine that we use a similar set of values to reflect how many Matchbox cars a group of 3 children have collected, with each item in the Array representing an individual child's number of Matchbox cars collected. Imagine the three children are named Sally, Jesse, and Raphael.

```javascript
const matchboxCarsOwned = [2, 4, 8]
```

It would be very easy to determine the total number of matchbox cars the children have collected in aggregate, but which child owns only 2? Which child owns 8? How many cars does Jesse own? Which child has the most cars? These questions are harder to answer, because we must remember the order by which Sally, Jesse, and Raphael's total number of cars are stored.

The need for a different way to organize data emerges. In this assignment, we will study the use of an **object** as a more appropriate data structure for the use case mentioned above.

# Objects

An object stores `{ key: value }` pairs and provides various ways to retrieve the stored data. Imagine, for a moment, a magical filing cabinet full of folders. We will call this magical filing cabinet "Sam". We can ask Sam for any folder by name. Sam will then hand us the folder we were looking for. Sam can also file new folders for us -- we just have to give the folder a unique name.

This basically describes how the object data structure works. With this structure, we ask it to retrieve data by giving it a **property** (more frequently called a key). This key is typically a string. The data that is returned is called the **value**.

## Creating Objects

Let's create our own magical filing system for acronyms. The `properties/keys` will be the acronym abbreviation, and the `values` will be what the acronym stands for. **You can follow along by entering each step into your browser console.**

First, we'll declare the variable name, and set its value to an object. We'll be using the object _literal_ syntax:

```javascript
const acronyms = {}
```

We could have also used `const acronyms = new Object()` syntax -- however, object literal syntax is simpler and more concise!

Next, we'll use the name of the object, `acronyms`, followed by a dot and the name of the key we want to include, and then set it equal to a value.

```javascript
acronyms.EST = "Eastern Standard Time"
acronyms.EOF = "End of File"
acronyms.SSN = "Social Security Number"
```

If we now run `console.log(acronyms)` to our browser console, we can see the object in its entirety.

```javascript
{
  EST: "Eastern Standard Time",
  EOF: "End of File",
  SSN: "Social Security Number"
}
```

This syntax, `object.key = value`, is called **dot notation**. We could also use **bracket notation**, `object[key] = value`; let's use it to add a few more key-value pairs to our object:

```javascript
acronyms["UFO"] = "Unidentified Flying Object"
acronyms["NASA"] = "National Aeronautics and Space Administration"
acronyms["MTV"] = "Music Television"
acronyms["DAEMON"] = "Disk And Execution Monitor"
```

Note the similarity between arrays and objects. With arrays, we access elements in the list using numbers or indices. With objects, we access elements using unique names, or **keys**.

Now that we have a decent number of keys and values in our object, what does it look like?

```javascript
{
  EST: "Eastern Standard Time",
  EOF: "End of File",
  SSN: "Social Security Number",
  UFO: "Unidentified Flying Object",
  NASA: "National Aeronautics and Space Administration",
  MTV: "Music Television",
  DAEMON: "Disk And Execution Monitor"
}
```

**Challenge:** Returning to our matchbox car example, how could we better represent the children's matchbox cars collected through the utilization of an object?

***SOLUTION!***

```javascript
const carsCollected = {
  Sally: 2,
  Jesse: 4,
  Raphael: 8
}
```

Notice that we defined the object and its properties at the same time, rather than creating an empty object and then assigning its values one by one.


## Accessing Values by Property

We can retrieve values from objects by using the properties. Instead of using a numerical index, like we did with arrays, we pass an object in square brackets (in this case, a string) as a `property` name, and we get back the associated `value`.

Given this object:

```javascript
const acronyms = {
  EST: "Eastern Standard Time",
  EOF: "End of File",
  SSN: "Social Security Number",
  UFO: "Unidentified Flying Object",
  NASA: "National Aeronautics and Space Administration",
  MTV: "Music Television",
  DAEMON: "Disk And Execution Monitor"
}
```

To access the value of `UFO`, we can once again use either dot or bracket syntax: `acronyms.UFO` or `acronyms["UFO"]`.

```javascript
console.log(acronyms.UFO)
console.log(acronyms["UFO"])
```

If we provide a property name that our object does not know about, our program will not error! Instead, we are returned a `undefined` value.

```javascript
console.log(acronyms["IDK"])
// undefined
```

### Overwriting Values

We can overwrite a value quite simply by reassigning it.

```javascript
acronyms["EOF"] = "End of Flight"
```

Key names **must** be unique.

### Methods

Just like with arrays, we have default methods that are a part of an `Object` and can be called on any object we create. Let's explore a few:

#### Generating an Object

In your browser console, enter this line of code:

```javascript
console.log(carCounts)
// Uncaught ReferenceError: carCounts is not defined
```

It returns an error since we haven't yet declared our variable name. Let's do that, and set it to a new object literal.

```javascript
const carCounts = {}
// undefined
console.log(carCounts)
// {}
```

Great, no errors. Now let's add some properties and values.

```javascript
carCounts["Sally"] = 2
carCounts["Jesse"] = 4
console.log(carCounts)
// { Sally: 2, Jesse: 4 }
```

### Getting a List of Keys or Values

We can get an array of all the property names by calling `Object.keys`:

```javascript
console.log(Object.keys(carCounts))
// ["sally", "jesse"]
```

Conversely, we can use `Object.values` to get an array of all the values stored in an object.

```javascript
console.log(Object.values(carCounts))
// [2, 4]
```

### Finding a Key/Value Pair

What if we are unsure if we have a particular key/value pair? We can use a conditional to check. Remember that `undefined`, which we know is returned when a key/value pair is not defined, is considered "falsey" for JavaScript.

Run this code and see what happens.

```javascript
if (acronyms["BLT"]) {
  console.log(acronyms["BLT"])
} else {
  console.log("I don't know that one!")
}
// I don't know that one!
```

```javascript
if (acronyms["NASA"]) {
  console.log(acronyms["NASA"])
} else {
  console.log("I don't know that one!")
}
// National Aeronautics and Space Administration
```

We could also try to access the value using dot syntax.

```javascript
if (acronyms.BLAT) {
  console.log(acronyms.BLAT)
} else {
  console.log("I don't know that one!")
}
// I don't know that one!
```

```javascript
if (acronyms.NASA) {
  console.log(acronyms.NASA)
} else {
  console.log("I don't know that one!")
}
// National Aeronautics and Space Administration
```

Perhaps we want to check if an acronym is in our object and change it if it isn't what we expect it to be.

```javascript
const ufoKey = "UFO"
const ufoNewValue = "Unidentified Flying Object"

if (acronyms[ufoKey] === ufoNewValue) {
  console.log("No need to update, I already know that one.")
} else {
  console.log("Updating acronyms...")
  acronyms[ufoKey] = ufoNewValue
}
// No need to update, I already know that one.
```

```javascript
const newKey = "UFO"
const newValue = "Unidentified Foreign Object"

if (acronyms[newKey] === newValue) {
  console.log("No need to update, I already know that one.")
} else {
  console.log("Updating acronyms...")
  acronyms[newKey] = newValue
}
// Updating acronyms...
// "Unidentified Foreign Object"
```

First we check to see if the property exists _and_ that it has the appropriate value at that key. If one or both conditions is not met, the `else` portion of our statement will update or add the property and value pair.

For more information and study on Objects, you can refer to the [basic objects guide on MDN][mdn-basic-objects].

### Summary

Wow! We just learned a **ton** about objects! Pat yourself on the back. You have added new tool to add to your JavaScript tool-belt. It will come in handy for the upcoming exercises as well as future programming challenges.

[mdn-basic-objects]: https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Basics
