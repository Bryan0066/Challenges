Let's reinforce those element-finding skills!

## Learning Goals

- Retrieve elements from the DOM based on a variety of criteria, using the best suited method

## Getting Started

```no-highlight
et get accessing-dom-elements-drills
cd accessing-dom-elements-drills
code .
```

There is a provided `index.html` file for you to practice with!  

For Mac users

```no-highlight
open index.html
```

For PC users

```no-highlight
start index.html
```

Next open up your dev tools by right clicking on the page and selecting `inspect`  
We will be working in the console to select the correct elements and as we satisfy each step, we can record the correct selector method in `main.js`

For example:  
Let's say we have an instruction asking us to "Find An element with an id of `woof`".  
We would go into our console and since we are looking for an element by it's `id`,  
we can use the `document.getElementById` method.

```js
document.getElementById("woof") // -> should return <p id="woof">There’s a valley of mega dogs over our heads</p>
```

Then in `main.js` we can record this working solution
```js
// main.js
// 1.) Find An element with an id of `woof`
document.getElementById("woof")
```

And then it's back to the console for the next step!

### Instructions

Use the methods for accessing the DOM to find:

1. An element with an id of `i-love-educated-lizards`
2. All elements with a class of `recipe-idea`
3. Using the result from #2, access the second element with this class
4. All `<div>` elements
5. All `<h2>` elements with a class of `lyrics`
6. The parent of the element whose `id` is `purple-jaguar-eye`
7. The children of the element whose `id` is `purple-jaguar-eye`
8. Using the result from #7, the sixth child of that element
9. The element with classes of both `recipe-idea` and `intentional-misspelling-of-desert` (using just one line of code)

Additionally,

10. Tell me how many elements are children of the element with a class of `limerickroll`
