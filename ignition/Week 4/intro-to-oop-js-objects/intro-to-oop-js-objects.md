Now that you've been introduced to objects, setting object properties, and defining methods to modify those properties, it's time to look at the big picture: object-oriented programming.

## Learning Goals

- Compare and contrast the differences between **functional programming** and **object-oriented programming**
- Outline the motivations for using objects to encapsulate data and behavior

## The (Briefest) History of Programming

### Imperative Programming

Early code was _imperative_, meaning that the code simply listed commands to be immediately executed in order. When you learn programming, this is generally out of necessity the first pattern you use.

Here's an example of some imperative JavaScript code for calculating the fifth number in the [Fibonacci sequence][fibonacci-sequence].

```javascript
const start = 1
console.log(start)

const secondNum = 0 + start
console.log(secondNum)

const thirdNum = start + secondNum
console.log(thirdNum)

const fourthNum = secondNum + thirdNum
console.log(fourthNum)

const fifthNum = thirdNum + fourthNum
console.log(fifthNum)

// Output:
// 1
// 1
// 2
// 3
// 5
```

Each line reads very clearly and descriptively, and the code makes sense reading from top to bottom. The problem, however, is repetition: imagine having to write this out to the 10th number, or the 50th, or the 2,000th. If we were to make a mistake on one of the lines, we might not even know until we ran the program and carefully studied the output!

### Functional Programming

A foundational leap forward for software design was the introduction of _functional programming_ as a popular pattern. Functional programming was named so after its key idea: functions!

#### Codifying Logic

Functions are a way of codifying behavior - we can take repeatable logic and tasks and assign them a name. We can then _call_ that name to perform the behavior as often as we like without having to rewrite the logic. And much like how we could have made the imperative Fibonacci above more _dynamic_ (meaning that the behavior changes based on context) by accepting user input, functions can become dynamic by accepting external information via _arguments_.

If we wanted to write a function in JavaScript to codify the logic of the Fibonacci sequence, it might look like this:

```javascript
const fibonacci = (n) => {
  let secondToLastNum = 0
  let lastNum = 1
  let currentNum = 0

  const numbers = []
  numbers.push(currentNum)

  for (i = 0; i <= n; i++) {
    secondToLastNum = lastNum
    lastNum = currentNum
    currentNum = secondToLastNum + lastNum
    numbers.push(currentNum)
  }
  return numbers
}

console.log(fibonacci(3))

// Output:
// [0, 1, 1, 2, 3]

console.log(fibonacci(7))
// [0, 1, 1, 2, 3, 5, 8, 13, 21]
```

This function encapsulates the logic of Fibonacci, and we can use it to get any Fibonacci number we'd like without rewriting any of the code!

Notice, though, that the data that we want to use (the `3` and the `7`) are separate from the function - they have to be passed in. This is, in fact, one of the strongest benefits of functional programming. Our functions don't rely on internal data, they instead only represent logic. Any data we pass in can be used and acted upon but still remain unchanged.

In some situations, however, our _data_ becomes more greatly intertwined with _behavior_ (the functions). In cases like this, much like how we package related bits of logic into functions, it increasingly makes sense to package interrelated data and behavior **together**.

### Object-oriented Programming

**Object-oriented programming** (or OOP) is one of the most popular patterns that modern programmers use to package data and behavior together into logical pieces. _Objects_ can thus contain both **state** (data) and **behavior** (functions).

We defined a function above to calculate the Fibonacci number at any point in the sequence. It made sense to define this as a pure function - it can be used with any (positive) number, it doesn't rely on any other logic, and it isn't inherently related to any external piece of data. We _want_ to be able to pass anything into it freely.

But let's say we wanted to be able to store information about all of our students. We _could_ do something like this:

```javascript
const bobFirstName = "Bob"
const bobLastName = "Loblaw"
const bobTestScores = [82, 91, 88, 98, 71]

const lindsayFirstName = "Lindsay"
const lindsayLastName = "Bluth"
const lindsayTestScores = [93, 100, 84, 99, 81]

const maebyFirstName = "Maeby"
const maebyLastName = "Funke"
const maebyTestScores = [77, 81, 78, 91, 70]

// Output the results to the screen.
console.log(
  `${maebyFirstName} ${maebyLastName} received a ${
    maebyTestScores[0]
  } on her first test.`
)

console.log(
  `${lindsayFirstName} ${lindsayLastName} received a ${
    lindsayTestScores[0]
  } on her first test.`
)

console.log(
  `${bobFirstName} ${bobLastName} received a ${
    bobTestScores[0]
  } on his first test.`
)
```

If our program did not require any additional features, this solution might be satisfactory. Everything is computed in one pass, top-down, and we print the results at the end.

However, the code looks a bit cluttered, and it might take a moment for someone reading the code to figure out what it is doing.

#### Objects

Let's try taking a more object-oriented approach to storing data about our students. We can do this by creating JavaScript objects and then assigning some **properties**, so let's do that!

```javascript
const bob = {
  firstName: "Bob",
  lastName: "Loblaw",
  testScores: [77, 81, 78, 91, 70]
}
```

In this example, we created a new JavaScript object called `bob`. We then assigned some **properties** of the `bob` object: `firstName`, `lastName`, and `testScores`.

The **properties** of an object keep track of the current **state** of the object: here, the student's first name, last name, and grades.

We've also seen how we can define **methods** for an object, which are functions stored as properties. These methods allow us to give our objects behavior, including ways to modify the object's properties.

```javascript
const bob = {
  firstName: "Bob",
  lastName: "Loblaw",
  testScores: [77, 81, 78, 91, 70],
  isPassing: true,
  calculateAvgScore() {
    let testScoreSum = 0
    this.testScores.forEach(score => testScoreSum += score)
    const avg = testScoreSum / this.testScores.length
    if (avg <= 60) {
      this.isPassing = false
    } else {
      this.isPassing = true
    }
  }
}
```

In the near future, we'll see how JavaScript provides us with the ability to create `classes` to define objects -- for example, a `Student` class would allow us to easily specify which properties or methods any student should have, so that we don't have to repeat ourselves if we'd like to create a new student.

##### The `this` keyword

Very importantly, the code block above uses the JavaScript keyword `this` to call on `this.testScores` and `this.isPassing`. The `this` keyword is a powerful keyword provided to us by JavaScript, which essentially refers to "the thing I am within the bound context of right now". It can be a tricky concept, so let's talk about it in the context of the usage above.

Here, we are setting up a method, `calculateAvgScore()`, that is bound to our `bob` object. Because we are inside of a function bound to our `bob` object, the value of `this` is the `bob` object itself. In other words, if we call on `this.testScores` inside of this method, it is like calling on `bob.testScores` outside of the object. If we call on `this.isPassing` inside of the method, it will give us the same data as calling on `bob.isPassing` outside of our object. We can think of `this` as referring to "_this_ object that I am inside of right now".

The nice thing is, if we call `this` inside of the `bob` object, it will refer to the `bob` object with all of Bob's data. If we call `this` inside of the `maeby` object, it will refer to the `maeby` object with all of Maeby's data. It's flexible, depending on what it is called inside of!

We'll dive further into the concept of `this` in the weeks to come, but it's helpful to know that, in our JS objects, `this` will refer to the full object it's inside of.

### Summary

In this article, we have briefly described functional programming and introduced objects in JavaScript. Objects allow us to group together **state** (the properties that define an object) and **behavior** (the methods defined within it). This grouping of state and behavior is a foundational concept of the _object-oriented programming_ paradigm.

[fibonacci-sequence]: https://en.wikipedia.org/wiki/Fibonacci_number