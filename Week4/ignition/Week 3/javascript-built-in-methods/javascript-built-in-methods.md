JavaScript provides us with a vast library of built-in methods to use in our own code - saving developers a lot of time! Let's take a look at some of the common built-in methods that we'll be working with.

### Learning Goals

- explore commonly used built-in JavaScript methods
- store a method return value to a variable
- mathematical operations as functions

### Getting Started

From your `challenges` folder in the terminal, type the following commands:

```no-highlight
et get javascript-built-in-methods
cd javascript-built-in-methods
code .
```

For Mac users

```no-highlight
open index.html
```

For PC users

```no-highlight
start index.html
```

### Introduction

When referring to _methods_, we're referring to the behaviors or functionality available for a specific type of _object_. We've seen examples of this when interacting with Strings, Numbers, and Arrays and use their built-in methods defined by JavaScript. 
We can also create our own methods on objects we define (if you haven't formally worked with objects and object literals, stay tuned)! Although they can look similar, there is a slight semantic distinction between methods and functions. Until we cov

We define a **function** as a standalone block of code, then call on the function directly by its name to execute the code. Whereas a **method** has been declared as a "function" for a specific type of object or data type. We call methods by their name, but they must be used with its specific data type. 
In this article, we'll take a look at some built-in JavaScript objects and their built-in methods! To see more built-in methods you can check out the MDN documentation on the built-in JavaScript objects we're currently using for [Strings][string], [Numbers][number], [Arrays][array], [Booleans][boolean, and [Window][window].

The code we'll be referencing in this article is provided in `main.js`. Follow along by uncommenting the code within `main.js` for each section to see the expected output in the console. It may help to comment out previous sections to reduce the number of outputs.

### `console.log()`

This is one of our favorite tools that we heavily use when developing and debugging! Its purpose is to [log][console.log] messages or data to the console, and can be any data type. It can take multiple arguments, but we often provide just one argument.

```js
console.log("Hello World!")
```

Uncomment the first section in `main.js`, and run the code provided to open the `index.html` file in the browser, then open the browser console to see the first couple messages. (_We are primarily working in the browser console, though in some applications, we will log messages to the **terminal** console through the Node environment set up on our machines_.)

> on a Mac, clicking on the browser and pressing `cmd + option + j` will open the browser console on a PC, clicking on the browser and pressing `control + shift + j` will open the browser console, you can also right-click on the page and click `Inspect`

The first example logs a string, `Hello World!`. We can also log other data types like arrays and even perform operations.

The last example logged to the console takes 2 arguments; the first is a message of the string `"my cats"`, and the second argument is the variable `catsArray`. This can be a helpful way to label the data you are logging to the console, especially when you have multiple console logs!

How are we able to see our message in the browser? The `console` is a special JavaScript object that we have access to from running our code in the browser environment. The `console` object has its own list of available methods for interacting with the object, and the `.log` method is one example. We often use the `console` when developing or debugging our code to see the values of our data or variables.

### Popup Box Functions

Sometimes in browser applications we want to provide a quick message to users, or we need some information from a user. One way we can go about this is using the built-in popup methods from JavaScript's global `window` object.

The `window` refers to the browser window that is running the JavaScript scripts (our code!). If you take a look at the documentation, you might notice the explicit use of `window` when using these methods, but not in our own code examples. Both options are valid! Running our code in the browser gives our program access to the `window` object (we can see the object if we console log `this`). Since `window` is a global object, it makes these built-in window methods globally accessible, meaning we can omit `window` when using them!

#### `alert()` Window Popup Function

Uncommenting this next section and refreshing your page should trigger a popup box appear on the screen with a new message! This is a great way to [alert][alert] a user with updated information while they are using our application. This method takes only one argument - the message we want to display. When an `alert` popup is on the screen, the user cannot interact with the application until the popup is closed. This means it also pauses the execution of our code.

#### `prompt()` Window Popup Function

If we need to obtain some information from the user, we can use another window popup method called [prompt][prompt]. `prompt` takes two arguments, the second of which is optional. The first, e.g. `prompt("hello")`, is an arguent that determines what message is displayed in the initial popup. Most often we use just the first message argument, but the second argument can be used as a placeholder value within the text field. THis is if we want to suggest to the user what they can write in the field that the `prompt` function displays.

The `prompt` method returns the input value from the user, or `null` if nothing was provided. We can assign the `prompt` method to a variable to capture this return to be used elsewhere:

```js
const userName = prompt("Nice to meet you! What's your name?")
console.log(`How are you, ${userName}?`)
```

### Sample Methods

Let's take a look at some common methods we might use with data types like [Arrays][array] and [Strings][string].

#### `.includes()`

Scrolling through the documentation for the string and array data types, you might notice they share some of the same methods! `includes` is one such method, and checks to see if a value is included in a string (as a substring) or to see if a value is included in an array of elements.

The function is called on an instance of a [string][string-includes] or [array][array-includes], and is passed an argument of the value you want to look for in the string or the array. Keep in mind that the search is _case-sensitive_ and should be taken into consideration to get accurate results. In the examples from `main.js`, look at the different output we receive when the search value is capitalized vs lowercase!

```js
console.log("Jagr".includes("J"));
// capital - true

console.log("Jagr".includes("j"));
// lowercase - false
```

When using this method, it returns a boolean indicating if the item was found or not. We might assign the return of `includes` to a variable to use that boolean value elsewhere to determine other behavior in our application (check out the `if` statement example in this section of `main.js`).

A second argument is optional to indicate the starting position or index, though we typically want to search the entire string or array.

#### `.sort()`

This method is available to us when working with arrays as a way to organize the array contents. By default [sort][sort] can be used without any arguments, and works great with an array of strings. Under the hood, the method converts the array elements into strings and organizes alphabetically, comparing the current element to the previous.

```js
console.log(["Jagr", "Toews", "Catniss", "Julia"].sort())
```

If we needed to `sort` an array of numbers, we can do so by passing an argument to the method - this is where things can get interesting! We can provide a _callback function_ to `sort` to determine the sort order we are looking for. This callback function works by comparing the _difference_ between the current and previous elements in the array.

Working with callback functions is tough at first! When using a function like `sort()` that can take a callback function, first focus on using the function without the callback argument to start, just like the example above.

```js
console.log([34, -10, 7, 15, 0].sort((a, b) => a - b));
```

`sort` returns the array, sorted, and in doing so alters the order of the original array. You'll notice that the `catsArray` in our example code has mutated after using `sort`.

### Mathematical Operations

JavaScript also provides built-in operators for us to perform mathematical operations, like addition, subtraction, multiplication, etc. These operators are just functions! When given some information it will execute the mathematical equation, and return the result.

```js
const x = 4
console.log(x + 10);
```

The mathematical operators also provide a way to both perform the math operation, and assign the new returned value to the variable.

```js
let y = 5
console.log(y += 18);
console.log(y);
```

In the example above, we are adding 18 to the variable `y`, _and also_ assigning the returned value (23) to the variable `y`. These assignment operators are available for all of the JavaScript Mathematical Operations.

### In Summary

There are many tools and methods that are built-in to JavaScript that we can take advantage of, and the ones covered in this article represent a small fraction of the total amount. 
Utilizing built-in methods aids us in developing our code by saving time with accessible and reusable tools, but in particular, these methods will be assumed knowledge when you read tutorials, study lessons or work through assignments. 

### Resources

- [Strings][string]
- [Arrays][array]
- [Booleans][boolean]
- [Numbers][number]
- [Window][window]

[window]: https://developer.mozilla.org/en-US/docs/Web/API/Window
[console.log]: https://developer.mozilla.org/en-US/docs/Web/API/console/log
[alert]: https://developer.mozilla.org/en-US/docs/Web/API/Window/alert
[prompt]: https://developer.mozilla.org/en-US/docs/Web/API/Window/prompt

[string]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String
[array]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array
[number]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/number
[boolean]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/boolean

[string-includes]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes
[array-includes]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes
[sort]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort
