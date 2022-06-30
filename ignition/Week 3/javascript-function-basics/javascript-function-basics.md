Functions are *central* to the JavaScript programming language.

## Learning Goals

* Implement function *declaration*
* Show a more modern function *expression*
* Declare and invoke functions with and without parameters
* Compare and contrast return values vs. functional side effects

### JavaScript Function Declarations

To follow along, open the Web Developer Tools Console. Press `Cmd + Option + J` or `Ctrl + Shift + J` in Chrome.

Functions are simply chunks of code execution assigned to a variable. Below, we define or _declare_ a function `gimmeThree`, which when called or _invoked_, will return the number 3. All we are telling this function to do is `return` the number three.

Paste the following code into your console, then press return:

```javascript
function gimmeThree(){
  return 3
}
```

So, we declared the function in our console, and saw an output of `undefined`. Why don't we see the number 3 returned to us? The function won't run until we call, or invoke, the function on a separate line. When we ran the code above, it didn't run the function, but defining something also gets a return, in this case `undefined`. Let's focus instead on what *running* our function returns to us.

 This time, enter `gimmeThree()` **with** parens and see what's returned.

```no-highlight
> gimmeThree()
3
```

Now that we have _invoked_ the function correctly, we see that it returns the number `3`.

Historically, functions in JavaScript are declared using `function myFunctionName` followed by `( )` parens, then `{ }`. You'll find the _body_ and the _return statement_ of the function inside those curly braces. 

However, in the latest JavaScript applications, we ideally prefer a different syntax: arrow functions. These arrow functions will be very similar to our named declarations, but the way we will write them will require a minor tweak. 

### The Arrow Function

Arrow functions are particularly common in standard JavaScript applications nowadays. Arrow functions have a standard structure
```js
const gimmeThree = () => {
  return 3
}
```
This is similar to traditional functions, but we leave off the `function` keyword and add an arrow after the parens. The functionality is nearly the same, but will have minor benefits (and even drawbacks) that we won't get into here (because we don't yet have the context).

### Parameters & Arguments
Here we can declare a function `triple` that returns three times an input. `x` here is considered a *parameter* and `return 3 * x` is the body or the *block*, which needs to be wrapped in curly braces. Parameters are used like variables that we can access within the function when it is invoked.

```javascript
const triple = (x) => {
  return 3 * x
}
```

```no-highlight
> triple(6)
18
```

Both of our example functions have the word `return` inside their block. Return statements do just that - they return a value to the function caller. `gimmeThree()` returns the value `3` and `triple()` returns the value of its parameter times three.

Functions can have no parameters, a single parameter, or multiple parameters. Let's look at a slightly more complex example of multiplying the numbers `x` and `y`.

```javascript
const multiply = (x, y) => {
  return x * y
}
```

```no-highlight
> multiply(2, 10)
20
```

In this example, we declared a function named `multiply` that takes in two parameters, `x` and `y`. When we call the `multiply()` function, we pass in the _arguments_ of our choice, `2` and `10`. Parameters can be used like variables within the function, and arguments are the values actually passed into the function invocation. Or in other terms, a parameter is just a stand-in for a future argument when the function is called.

### Functions as Factories

It can be helpful to think about functions as factories.

 ![Function Factory](https://s3.amazonaws.com/horizon-production/images/function_factory.jpg)

Like a factory, a function takes in raw materials, processes them, and returns
a finished product. Now we'll explore functions returning one value, or multiple values. Below is the basic syntax of a JavaScript function declaration. 

```JavaScript
const myFunction = (parameters or arguments) => {
  // this is the function body
  return value
}
```
The return statement ends function execution and specifies a value to be returned to the function caller. If no return is present, `undefined` is returned instead.

Below, we can see an example of first defining a function `landingPadArea`, invoking that function with two arguments, and returning one result:

```JavaScript
const landingPadArea = (length, width) => {
  return length * width
}
// length and width are the parameters.

landingPadArea(2, 6)
// 2 and 6 are the arguments
// returns 12
```

In this next example, we are going to declare a variable inside of the function, which we'll then return:

```JavaScript
const landingPadArea = (length, width) => {
  const landingArea = length * width
  return landingArea
}
// length and width are the parameters.

landingPadArea(2, 6)
// 2 and 6 are the arguments
// returns 12
```

Now, the return here is still the same as our former example. Functions can only return one object, whether it's one number, one string, one array, etc. If we want to take in multiple parameters and return multiple values,
we'll want to use an **array** to do so! Let's see how we'd return _two_ values from a function.

```JavaScript
const landingMeasurements = (length, width, height) => {
  const landingArea = length * width
  const landingHangerVolume = length * width * height
  const measurements = [landingArea, landingHangerVolume]
  return measurements
}

const destinationArea = landingMeasurements(2, 4, 6)[0]
// 8
const destinationVolume = landingMeasurements(2, 4, 6)[1]
// 48
```
The calculations are performed inside the landingPadMeasurements function, stored in the variable `measurements`, and an array is returned. Each element of the array is accessible using the element index of `[0]` or `[1]`.

This can get confusing, so feel free to play around with this code in the console. Refresh the current console and enter the code with a debugger just before the return statement. This will pause your program and let you explore the current values of `landingArea`, `landingHangerVolume`, and `measurements`.

```JavaScript
const landingMeasurements = (length, width, height) => {
  const landingArea = length * width
  const landingHangerVolume = length * width * height
  const measurements = [landingArea, landingHangerVolume]
    debugger
  return measurements
}

const destinationArea = landingMeasurements(2, 4, 6)[0]
const destinationVolume = landingMeasurements(2, 4, 6)[1]
```

### Return Statements vs Side Effects

```javascript
const sayHello = () => {
  console.log('Hello friend!')
}
```

How would we invoke this above function, if it does not require any arguments? We still
need to include our parentheses in order to make the function run, so we could
just pass it empty parentheses:

```javascript
sayHello()
// Hello, friend!
```
Et voila! Our function has run successfully.

In this above example, we have no explicit `return` value, but there is a `side effect`. Each time we invoke the `sayHello` function, a string is printed to the console. `Side effect` may sound like a bad thing but it's not! Side effects are any changes observable outside the called function _other_ than its return value. Examples other than printing to the console might be modifying an external variable or other object property.


### Passing Functions as Arguments to Other Functions

Functions are *first-class objects* in JavaScript, meaning that they have the same behavior as any other object. What's so special about that? Well, while a program is being executed, a function that was constructed can be stored in a data structure. Additionally, we can pass the function around as a parameter to another function, and even have that function be returned as the value of another function!

_Interested in learning more here? See more on [StackOverflow](http://stackoverflow.com/questions/705173/what-is-meant-by-first-class-object) about functions as first class objects._

```javascript
const obiWanKenobi = (name) => {
  return "Use the force, " + name
}

const darthVader = (name) => {
  return name + ", I am your father."
}
```

Here we are just declaring two functions `obiWanKenobi` and `darthVader` which return two different strings based on an input parameter `name`. We can now pass either of those functions to another function `dataHandler`. Below, `dataHandler` takes in two parameters which we define as `name`, and `func`.

```javascript
const dataHandler = (name, func) => {
  return func(name)
}
```

Now let's call `dataHandler`. In the first example we pass in the the argument "Luke" for the parameter `name`, and the argument obiWanKenobi for the `func`tion parameter.

```no-highlight
dataHandler("Luke", obiWanKenobi)
>> "Use the force, Luke"

dataHandler("Luke", darthVader)
>> "Luke, I am your father."
```

Passing functions between one another not only cleans up our code, but allows us to organize and associate powerful actions, especially when we incorporate events. Make sure to re-read this a time or two, because it takes time to fully comprehend.

### More on Return Values

By the way, it's worth noting again that to have a function return a value of something other than the default, a *return* keyword must be called. Additionally, `return` stops a function's execution immediately. Test out the following code in your console:

```JavaScript
const myName = (firstName) => {
  return true
  return `My name is ${firstName}`
}

myName("Mae")
```

```no-highlight
> myName("Mae")
true
```

The function `myName` includes two return statements. We now know that only the first return statement will be evaluated.
