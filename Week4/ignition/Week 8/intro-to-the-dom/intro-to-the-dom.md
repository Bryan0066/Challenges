Before we learn how to modify and style HTML using JavaScript and CSS, we need to make a quick pitstop and learn about how the browser provides a programming interface (basically, a tool for us to grab ahold of and interact with in our code) for representing an HTML document. Enter: the DOM!

### Learning Goals

- Understand how a webpage is represented using the DOM

### Why This Matters

As we prepare to learn how to write JavaScript and CSS code to modify and style HTML documents, it will be helpful to understand a little bit about the object that your browser uses to represent a webpage, called the _DOM_.

## Tree Structures

Before we introduce the DOM, let's talk a little about tree structures. Tree structures are a way of representing relationships between different things, where some of those things are _children_ of other things.

One example you may already be familiar with is a family tree:

![Family tree diagram][family-tree]

Each person or couple is represented as a rectangle; we call these points _nodes_. The tree structure shows us the relationship between the nodes: we can see that Debra is Richard and Cynthia's child and that Donna and Susan are cousins.

### Documents as Tree Structures

Tree structures aren't just for families! Let's look at a list we've written of our favorite things:

```markdown
# Favorites

1. Awesome TV shows
   1. Kipo and the Age of the Wonderbeasts
   2. Community
   3. Bojack Horseman
2. Awesome bands
   1. The Aliens
   2. The Beta Band
   3. The Clash
```

Just like in the family tree we saw before, we can identify nodes (items in the outline) and their relationships to one another: `Kipo and the Age of the Wonderbeasts` is a child of `Awesome TV shows`, whereas `Awesome TV shows` and `Awesome bands` are siblings (with TV shows coming first). If we were to draw this as a tree structure it might look like:

![Favorites list tree diagram][favorites-list-tree]

We could use a tree structure to represent any kind of text, or combination of text and media, that we'd like. Let's look at another example (this one written in HTML):

```html
<div id="fears">
  <h1>My Greatest Fears</h1>
  <p>I am afraid of many things, and I'd like to describe them to you here.</p>

  <div id="plants">
    <h2>Plants</h2>

    <a href="https://en.wikipedia.org/wiki/Helianthus">Sunflowers</a>

    <p>
      I am afraid of sunflowers. They are tall with garish yellow petals and
      have big faces and I'm afraid that they'll attack my face with their
      faces.
    </p>

    <img
      alt="image of three sunflowers being menacing"
      src="./images/sunflowers.jpg"
    />
  </div>
</div>
```

In this case, our basic tree structure would look like this:

![Tree of text example][text-tree]

We can see that the `<div>` with an id of `fears` is the top level, or _root_ node, and it has a top-level heading, a paragraph and another `<div>` element as children. The `<div>` has four children of its own: a second-level heading, an anchor, a paragraph, and an image.

## Our Good Friend, the DOM

What does all this have to do with the DOM? And what _is_ the DOM, anyways?

> The DOM, or Document Object Model, is a tree-structure-based model of an HTML document, where each node is an object representing an HTML element, text, or attribute.

In brief, the DOM is a more complex version of the trees we've seen above, where the added complexity helps us better represent HTML documents. For example, our tree diagram above lumps tags, text, and attributes all in a single node, even though these three things are all doing very different work. By contrast, a diagram of the page's DOM would look more like this:

![DOM of text example][dom]

The DOM is more than just a concept we use to think about our webpage's structure: **our browser uses this model to provide a structural representation of the HTML document**, so that we can interact with it using JavaScript, CSS, and other programming languages. Let's say that we want to modify the `id` of the `<div>` HTML element. We can now have our JavaScript code specifically target this element's attribute node and modify only that one part of the data structure, leaving the rest of it alone! The DOM object serves the purpose of being something "tangible" for our JavaScript code to manipulate.

### In Summary

In this article, we've seen how the browser provides a programming interface called the DOM which represents HTML documents. Soon we'll see how to access the DOM to write JavaScript that changes the HTML!

[family-tree]: https://horizon-production.s3.amazonaws.com/images/article/intro-to-the-dom/family-tree.jpg
[favorites-list-tree]: https://horizon-production.s3.amazonaws.com/images/article/intro-to-the-dom/favorites-list-tree.jpg
[text-tree]: https://horizon-production.s3.amazonaws.com/images/article/intro-to-the-dom/text-tree.jpg
[dom]: https://horizon-production.s3.amazonaws.com/images/article/intro-to-the-dom/dom.jpg
