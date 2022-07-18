### Learning Goals

- Understand a web page as a document
- Be able to explain what a markup language is
- Read and write HTML

### Getting Started

```no-highlight
et get intro-to-html
cd intro-to-html
code .
```

### Why This Matters

Web development rests on three pillars: HTML, CSS, and JavaScript. Here, we'll learn about HTML, which is how we write content for web pages.

## What is HTML?

HTML stands for Hypertext Markup Language. A markup language, like HTML, differs from a programming language, like JavaScript. A programming language is a set of instructions for computations, whereas a markup language is a way of annotating a document to indicate what the different parts of the text _are_: a heading, a list, a paragraph, etc.

Let's say we'd like to make a blog post. We know what we want to write, and how we want to lay it out:

```no-highlight
top-level heading: My Greatest Fears
paragraph: I am afraid of many things, and I'd like to describe them to you here.

second-level heading: Plants
paragraph: I am afraid of sunflowers ("sunflowers" should be in bold). They are tall with garish yellow petals and have
  big faces and I'm afraid that they'll attack my face with their faces.

image:
  name: "image of three sunflowers being menacing"
  file: "./images/sunflowers.jpg"
```

Let's convert that into HTML:

```html
<h1>My Greatest Fears</h1>
<p>I am afraid of many things, and I'd like to describe them to you here.</p>

<h2>Plants</h2>
<p>
  I am afraid of <strong>sunflowers</strong>. They are tall with garish yellow
  petals and have big faces and I'm afraid that they'll attack my face with
  their faces.
</p>

<img
  alt="image of three sunflowers being menacing"
  src="./images/sunflowers.jpg"
/>
```

In HTML, we enclose text in _tags_, like `<h1>` and `</h1>`, to indicate what role the text plays in the document (heading, paragraph, boldface text, etc.). A set of tags and the text they enclose is called an HTML _element_: for example, `<h1>My Greatest Fears</h1>` and `<img alt="image of three sunflowers being menacing" src="https://bit.ly/2YAEckt" />` are both elements.

### Tags, Tags, and More Tags

Let's dig into the tag syntax a little bit more. In the example above, we saw a variety of tags, including

```html
<h1>...</h1>
<h2>...</h2>
<p>...</p>
<img alt="aString" src="aPath" />
```

Each of these tags has a _tag name_: `h1`, `h2`, `p`, or `img`. These tag names indicate what kind of content the tag defines: top-level heading, second-level heading, paragraph, or image, in this case. We'll see some other tag names later on in this article!

Each tag is also enclosed by brackets, `<` and `>`, and sometimes there's a backslash `/` involved. This punctuation indicates whether a tag is

- opening: `<p>`
- closing: `</p>`
- self-closing: `<img/>`

A self-closing tag is the same as an opening tag and closing tag with nothing in between: instead of `<img/>`, we could have used `<img></img>`. You'll see self-closing tags mostly just for images and line breaks (`<br/>`).

#### Attributes

Let's take a closer look at the `<img>` tag:

```html
<img
  alt="image of three sunflowers being menacing"
  src="./images/sunflowers.jpg"
/>
```

This self-closing tag has some additional information within it: `alt` and `src` _attributes_. An attribute is extra information that we want to associate with the tag's element: in this case, some alt-text and the location of the image file.

> Alt-text is used by accessibility tools to describe images to, e.g., vision-impaired users and is very important for ensuring an internet that is accessible to all!

If we didn't know what attributes an `<img>` tag required, we could look it up in the [documentation][img-tag]!

##### `id` and `class` Attributes

Different tags have different attributes, but there are two common attributes that can be applied to any element: `id` and `class`. These attributes are added to tags to help us find those elements later on, when we want to modify our document using JavaScript or style it using CSS.

For now, just know that:

- When you choose to use an `id` attribute, you should set it to a single value that should be unique across the entire HTML document

Good:

```html
<p id="cats">Some stuff about cats</p>
<p id="dogs">Some stuff about dogs</p>
<p id="dog-cats">Some stuff about dogcats</p>
```

Bad:

```html
<p id="cats">Some stuff about cats</p>
<p id="dogs">Some stuff about dogs</p>
<p id="dogs">Some stuff about dogcats</p>
```

- Meanwhile, a `class` doesn't need to be unique, and you can also assign multiple classes to a single element by separating them by spaces.

```html
<p id="racoons" class="animals">Some stuff about trash pandas</p>
<p id="cats" class="animals pets">Some stuff about cats</p>
```

Above, racoons paragraph has one class, `animals`, whereas the cat paragraph has two classes: `animals` and `pets`.

We'll be seeing a lot more of `id` and `class` in the future!

### More Tags!

The list below contains the HTML tags you'll use most frequently; you can find a full list of valid HTML tags [here][html-tags].

Semantic HTML is the use of HTML markup to reinforce the semantics, or meaning, of the information in webpages and web applications rather than merely to define its presentation or look. Semantic HTML is processed by traditional web browsers as well as by many other user agents. Wikipedia

An important note: while different tags can give us different appearances, we always want to be sure to adhere to _semantic HTML_. Semantic HTML is when we use the proper tag to indicate the semantics, or meaning, of the content of our web page. In other words, we would never want to use all `p` tags (or even all `h1` tags), and then just style them to be different sizes for headers and paragraph content, because then we lose the _semantics_ of the tags! Instead, we want to be sure to use the proper tag based on _meaning_, and then style our element to look the way we want.

| Tag            | Meaning                                              |
| -------------- | ---------------------------------------------------- |
| p              | paragraph                                            |
| a              | anchor (i.e., a link)                                |
| h1, h2, ... h6 | headings of various levels                           |
| img            | image                                                |
| ol or ul       | ordered (numbered) list or unordered (bulleted) list |
| li             | list item used within an ol or ul                    |
| div            | a division -- basically, a section of related HTML   |

#### What's this `<div>` business?

Sometimes, we need to group parts of our HTML document together; this can help with readability, styling, or modifying the HTML. Looking back at our earlier example,

```html
<h1>My Greatest Fears</h1>
<p>I am afraid of many things, and I'd like to describe them to you here.</p>

<h2>Plants</h2>
<p>
  I am afraid of <b>sunflowers</b>. They are tall with garish yellow petals and
  have big faces and I'm afraid that they'll attack my face with their faces.
</p>

<img
  alt="image of three sunflowers being menacing"
  src="./images/sunflowers.jpg"
/>
```

it's not entirely clear whether the image is part of the Plants section or not. Let's make this clear using some `<div>`s to show how we want our page to be _divided_:

```html
<div id="fears">
  <h1>My Greatest Fears</h1>
  <p>I am afraid of many things, and I'd like to describe them to you here.</p>

  <div id="plants">
    <h2>Plants</h2>
    <p>
      I am afraid of <b>sunflowers</b>. They are tall with garish yellow petals
      and have big faces and I'm afraid that they'll attack my face with their
      faces.
    </p>

    <img
      alt="image of three sunflowers being menacing"
      src="./images/sunflowers.jpg"
    />
  </div>
</div>
```

These divs help us see that all the content is part of a "fears" section of the document and that the `h2`, second paragraph, and image are all part of the "plants" section. Note that divs don't have any effect at all on how the content is displayed on the page... _until we add styling_! We'll learn how divs allow us to do things like create columns on our webpage or give sections different formatting in the future.

## Rendering HTML

Now that we've got some HTML, we'd like to display (or _render_) it. Luckily, there are applications specifically for displaying HTML documents in a reader-friendly way.

Those applications are... wait for it... wait for it... **internet browsers**! Rendering HTML is one of a browser's three main functions, in addition to applying CSS styling and running JavaScript code.

This article is focused on the first bullet point, displaying (or _rendering_) HTML. To see this in action, create a new file in this directory called `index.html` (this is what we'll typically call our "default" html files). Copy the HTML from the example above into this file, then run `open index.html` (for Macs) or `start index.html` (for Windows) in your terminal. This command should open the html file in your browser, where you can admire our blog post!

However, our `index.html` file is missing some important elements (which our browser is currently adding for us, based on some assumptions, in order to display our page). A proper HTML file should instead look like

```html
<!DOCTYPE html>

<html>
  <head>
    <title>My awesome webpage</title>
    <!-- We may put some JavaScript script tags or CSS link tags here -->
  </head>
  <body>
    <!-- Your HTML here -->
    <!-- If we had some JavaScript to run on the elements of our page: <script src="main.js"></script> -->
  </body>
</html>
```

> In HTML, comments are formatted as `<!-- This is my comment! -->`.

The extra HTML here

- tells the browser that this is an HTML file
- adds some information about the page -- in this case, its title -- in `<head>`
- wraps the content we'd actually like to display in `<body>`

Update `index.html` to follow this format. Your file should look like this:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>My awesome webpage</title>
  </head>
  <body>
    <div id="fears">
      <h1>My Greatest Fears</h1>
      <p>
        I am afraid of many things, and I'd like to describe them to you here.
      </p>

      <div id="plants">
        <h2>Plants</h2>
        <p>
          I am afraid of <b>sunflowers</b>. They are tall with garish yellow
          petals and have big faces and I'm afraid that they'll attack my face
          with their faces.
        </p>

        <img
          alt="image of three sunflowers being menacing"
          src="./images/sunflowers.jpg"
        />
      </div>
    </div>
  </body>
</html>
```

Reload the page in your browser; the page should render just like before, except that "My awesome webpage" should display in the title bar.

### In Summary

In this article, we've learned about HTML, the language we use to create online content. We discussed HTML tags, elements, and attributes, including `class` adn `id`. Finally, we saw our HTML rendered in the browser. Soon we'll dive deeper into HTML webpages!

[img-tag]: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/img
[html-tags]: https://developer.mozilla.org/en-US/docs/Web/HTML/Element
