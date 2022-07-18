Let's get some practice modifying the DOM!

## Learning Goals

- Modify the tag name, attributes, and text of an HTML element
- Create a new HTML element and insert it into the DOM
- Remove an HTML element from the DOM

## Getting Started

```no-highlight
et get modifying-dom-elements-drills
cd modifying-dom-elements-drills
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

Next open up your dev tools by right clicking on the page and selecting `inspect`  
We will be working in the console to select the correct elements and as we satisfy each step, we can record the correct selector method in `main.js`

For example:  
Let's look at the first problem in this exercise, "Print to the console the text of any elements with a class of `oh-no`". First we need to find all elements that have a class of `oh-no`. We could use either a `querySelectorAll` or `getElementsByClassName`, but be aware that they return different objects and will need to be handled accordingly! Let's use `querySelectorAll` for this case.

```js
let ohNoElements = document.querySelectorAll(".oh-no") // -> returns Nodelist with 1 element inside [p.oh-no]
// currently we only have one element, but we should write code that would account for any amount of elements in this Nodelist.  We can use a loop to have access to each element within this list

ohNoElements.forEach(element => {
  // we can use .textContent to get the text contained within this element
  console.log(element.textContent)
})
```

Then in `main.js` we can record this working solution

```js
// main.js
// 1.) Print to the console the text of any elements with a class of `oh-no`
let ohNoElements = document.querySelectorAll(".oh-no")
ohNoElements.forEach(element => {
  console.log(element.textContent)
})
```

### Instructions

Without modifying `index.html`, achieve the following. Reload your page as you update `main.js` to see your updates in action. You can inspect the page by right-clicking and choosing "Inspect" to see the resulting HTML and all related classes, etc.

Be aware that you may need to look up additional methods to finish some of the later steps.  Look at the documentation and see what methods are available! [MDN Documentation][mdn-document]

1. Print to the console the text of any elements with a class of `oh-no`
2. Print to the console the tag name of the element with an id of `hashtag-inspiration`
3. Print to the console the all the HTML contained within any elements with a class of `tv`
4. Reluctantly fix the typo "Never gonna run around and dessert you" to "Never gonna run around and desert you", where "desert" has one `s`
5. Replace the text in the fourth child of the element with an id of `purple-jaguar-eye` with lyrics of your choosing
6. Turn each `<h2>` into an `<h3>`. _Hint: Be careful which method you use to access the elements. `#getElementsByTagName` will return a *live* `HTMLCollection`, and `#querySelectorAll` returns a *non-live* `NodeList`. Play around to see what works better, and see if you can identify why this is tricky!_
7. Add a class of `scary-thoughts` to the element with an id of `woof`
8. Add an image of a fish as the last child of the element with an id of `shes-the-one-for-me`
9. Delete the class `rickroll` from the div that also contains the class `limerickroll`
10. Add your own lyrics to the element with an id of `lyrics` by adding one additional `<p>`
11. Add a new paragraph explaining what your favorite song is as the last child of `<body>`
12. Add an attribute called `foo`, with a value of `bar`, to each child of the element with a class of `rickroll`

[mdn-document]: https://developer.mozilla.org/en-US/docs/Web/API/Document