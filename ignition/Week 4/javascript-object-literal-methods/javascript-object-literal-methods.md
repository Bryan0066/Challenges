Now that we've gotten comfortable with object attributes, let's introduce _methods_: functions that are stored as properties of an object.

### Learning Goals

- Create object literals with attributes and behaviors
- Use methods to update object state

## Getting Started

```no-highlight
et get javascript-object-literal-methods
cd javascript-object-literal-methods
code .
open index.html
```

Open the main.js file to start your work. You'll see your output in the browser console.

### Create a Book

JavaScript objects can be a very useful way of modeling real-life objects... like books! Let's create an object that represents a library book that can be checked out of the library and returned. This book object needs the following properties: `title`, `author`, `yearPublished`, and `isCheckedOut`. Later on, we'll also add a method, `updateBookStatus()`.

For this example, we'll use Jenny Lawson's _Furiously Happy: A Funny Book About Horrible Things_ and start with it as a new book, never checked out. Let's get started!

```javascript
const book = {
  title: "Furiously Happy: A Funny Book About Horrible Things",
  author: "Jenny Lawson",
  yearPublished: "2015",
  timesCheckedOut: 0,
  isCheckedOut: false
}

console.log(book)
```

### Modifying Attributes with Methods

It would be nice to have an easy way to update the values of `timesCheckedOut` and `isCheckedOut`. We could always change these attributes directly in our code:

```javascript
book.isCheckedOut = !book.isCheckedOut // sets the value to the opposite of its previous value
```

However, whenever we toggle `isCheckedOut`, we're also going to want to update `timesCheckedOut` as well. It would be nice if we could create a function and associate it to with our `book` object, similarly to how we've associated attributes like `title` . Fortunately, JavaScript allows us to do just that!

Let's define a function, `updateBookStatus()`, as a property of our `book` object. _When a function is defined as a property of an object, we call it a **method**_. This method will be called whenever a book is being checked in or out; if it is being checked out, it will increase `timesCheckedOut` by `1`, and in either case, it will toggle `isCheckedOut` and print the status to the console.

```javascript
const book = {
  title: "Furiously Happy: A Funny Book About Horrible Things",
  author: "Jenny Lawson",
  yearPublished: "2015",
  timesCheckedOut: 0,
  isCheckedOut: false,
  updateBookStatus() {
    if (book.isCheckedOut === false) {
      book.timesCheckedOut += 1
    }
    book.isCheckedOut = !book.isCheckedOut
    console.log("Book status updated to " + book.isCheckedOut)
  }
}
```

The syntax we've used here for the method is slightly different from the syntax you've seen previously when defining functions -- this syntax is called _method syntax_.

```javascript
  updateBookStatus() {
    // ...
  }
```

Now, in the console, call the method on your book object by entering this line of code:

```no-highlight
$ book.updateBookStatus()
Book status updated to true
undefined
```

Two quick notes:

- Ignore the `undefined` -- the console is trying to display the `return` value of our function, but we haven't given it one.
- Don't forget the `()` when you want your function to run! Otherwise, you're asking the console to tell you what the function is, rather than actually performing the function.

You can now confirm that the state of `book` changed by checking `book.isCheckedOut` and `book.timesCheckedOut` in the console:

```no-highlight
$ book.isCheckedOut
true

$ book.timesCheckedOut
1
```

Voila! We've created a handy method on our book object that can help us manage checkouts/checkins by modifying the book's attributes.

#### Method Shorthand

While the above method syntax is widely used, it is worth mentioning that it is shorthand available to us in ES6. Let's briefly examine the implementation below
```js
const libraryCard = {
  name: "Terry Pratchett",
  cardActiveStatus: false,
  renew() {
    cardActiveStatus = true
  }
}
```
Now let's see the same without our shorthand.
```js
const libraryCard = {
  name: "Terry Pratchett",
  cardActiveStatus: false,
  renew: function renew() {
    cardActiveStatus = true
  }
}
```
It's the former example that we will prefer, but the latter example is how it is interpreted. Now we know what the non-shorthand is, we can see that when we define an object method, we are simply adding a property that stores a function. When we call on the property and then add parens with `()` we are able to invoke that function in that property.

#### The `this` keyword

Let's revisit our method:

```javascript
  updateBookStatus() {
    if (book.isCheckedOut === false) {
      book.timesCheckedOut += 1
    }
    book.isCheckedOut = !book.isCheckedOut
    console.log("Book status updated to " + book.isCheckedOut)
  }
```

There's something a bit awkward here -- we're requiring the method _inside_ of our object  to know what we've named the object via our declared variable (`"book"`). This could cause problems, for example, if the object were assigned to a new variable. Instead, we need a way to say "whatever the thing is that the method is being called on".

JavaScript gives us the `this` keyword for just this reason. `this` is meant to represent whatever we are looking at at this particular point in time: it's as if it's saying, "this specific object that I am being called inside of right now". We can (and should!) refactor our method to use `this` instead:

```javascript
  updateBookStatus() {
    if (this.isCheckedOut === false) {
      this.timesCheckedOut += 1
    }
    this.isCheckedOut = !this.isCheckedOut
    console.log("Book status updated to " + this.isCheckedOut)
  }
```

Now, no matter what the object is named, we'll still be updating the correct object's attributes. This will be particularly useful in the future, when we learn how to create classes.

Note: `this` can be used in any kind of function (not just methods), and it refers to the function's _current execution context_. The execution context is an advanced JavaScript concept; if you'd like to learn a little more, [check out this article][gentle-explanation-of-this], but for now, just remember that `this` in a method refers to whatever you're calling the method on.

Now, if you need a good laugh after all this hard work, go read the actual book! [Furiously Happy](https://www.goodreads.com/book/show/23848559-furiously-happy)

### Summary

We've taken the objects we learned about previously to the next level by defining functions on those objects, which we call methods. These methods provide our functions with behaviors, not just attributes.

[gentle-explanation-of-this]: https://dmitripavlutin.com/gentle-explanation-of-this-in-javascript/#1-the-mystery-of-this
