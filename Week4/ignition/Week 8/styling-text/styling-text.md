## Styling Text with CSS

Now that you're comfortable with the basic syntax of CSS, let's cover some ideas and properties that come into play when styling text elements.

### A Quick Look at Inheritance

For the most part, when you define a particular property on a CSS element, you can expect that property to get applied to the element you're currently talking about and nothing else. For example, if I define a border around my entire `body` element like so:

```css
body {
  border: 1px solid black;
}
```

...I wouldn't expect **every** single element inside `body` to **also** get a border around it. That would look ridiculous:

![Screenshot of a page with borders around everything][bad-example]

Luckily, we never need to worry about that happening! The property `border` does not get **inherited** by child elements. It gets applied to the exact elements you specify it for, but not their children.

Most CSS properties that you'll be learning down the line also are not inheritable. However, properties that are used for styling text are different! Most text-related properties - and **all** the properties described in this lesson - **do** get inherited by child elements. That means that if we declare the `color` property on our `body` element:

```css
body {
  color: red;
}
```

...text within **every** element inside the body element will be red!

We will take a deeper dive into all of the rules of inheritance in another lesson. The important thing to know here is that we can target different elements more _specifically_ in order to override inheritance. So if we wanted to make only our `h3` elements in our webpage blue, and keep all other text red, we could specifically pinpoint our `h3`s:

```css
h3 {
  color: blue;
}
```

Now all the text on the site will be red, _except_ for `h3`s, which will be blue.

### Sizing Our Text

There are a few different ways to define how big something should be on your screen.

- **px** (short for "pixels") - the most common and straightforward. One pixel is one dot on your screen. If you specify how many pixels something should be, it will be that many dots large no matter what, regardless of what size screen it's viewed on.

- **em** - another unit of measurement, and one that is liable to change depending on what device the user is viewing your page on. `1em` is equal to whatever the **default font size** for the given element is on the user's screen. All `em` measurements are relative to that default font-size - so if you say this header should have `font-size: 2em;`, you're saying it should be twice the default font size for the header.

- **rem** - like `em`s, but relative to the font-size of the **r**oot element. This allows us a more concrete way to measure: it bases the size off of the **default root font size** rather than the default font size of the given element. This means that `rem`s are of equal size whether you're working on a paragraph tag or a header.

It's important to note that using `em` and `rem`s does **not** automatically make your website "responsive", and that no matter which unit of measure you choose to use, you'll have to do similar work to make your website look good on mobile. There are ways of defining completely different CSS rules for different screen sizes. (That's for another lesson!)

## Properties for Styling Text

Here is a list of properties you can and should be using, for easy reference going forward!

### color

([documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/color))

Changes the color of a piece of text.

**Examples:**

```css
body {
  color: red;
}
```

```css
p {
  color: #73b26c;
}
```

### font-size

([documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/font-size))

Changes size of a piece of text. Size can be defined in `px`, `em`, or `rem`.

**Examples:**

```css
p {
  font-size: 14px;
}
```

```css
h1 {
  font-size: 3.2em;
}
```

### font-weight

([documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight))

Changes the boldness of a piece of text. You can specify a word, such as `bold`, `normal`, or `light`. `light` will only work if the font you've specified has a `light` variant of that font defined (poke around [Google fonts](https://www.google.com/fonts) to see some examples of fonts with different font weights!). You can alternatively specify a number such as `400` or `700` to specify weight. You can [read here](https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight) for more information on using numbers, but feel free to just use the words `bold` and `normal` for your work!

**Examples:**

```css
p {
  font-weight: bold;
}
```

```css
h1 {
  font-weight: 700;
}
```

### font-style

([documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/font-style))

Allows you to make text italic. You can specify the values `italic` or `normal`.

**Examples:**

```css
p {
  font-style: italic;
}
```

```css
h1 {
  font-style: normal;
}
```

### text-decoration

([documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration))

Allows you to control whether text is underlined. You can specify the values `underline` or `none`.

**Examples:**

```css
h1 {
  text-decoration: underline;
}
```

```css
a {
  text-decoration: none;
}
```

### text-align

([documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/text-align))

Allows you to align text within the space it has available. You can specify the values `left`, `right`, `center`, or `justify`.

**Examples:**

```css
h1 {
  text-align: center;
}
```

```css
p {
  text-align: justify;
}
```

### font-family

([documentation](https://developer.mozilla.org/en-US/docs/Web/CSS/font-family))

Allows you to set the font family for a piece of text.

Many fonts are available on all browsers, but you can't always guarantee that being the case. For that reason, `font-family` allows you to set several values in a comma-separated list. It'll try to use the first one, but if that doesn't work for some reason, it'll try the next one as a fallback, and so on down the list. You can put the names of your fonts either in quotes or not.

Serif, sans-serif, and monospace are some default values that all browsers can recognize. You should always use a worst-scenario fallback that all browsers will be able to render.

**Examples:**

```css
h1 {
  font-family: Veranda, Ariel, sans-serif;
}
```

```css
h1 {
  font-family: 'Papyrus', 'Comic Sans MS', monospace;
}
```

#### Side Note: Adding New Fonts

There are a couple options on how to go about loading new fonts into your website. Neither will be required in the upcoming challenges, but if you're interested, check out the following resources:

- [Google fonts](https://www.google.com/fonts) - This service allows you to add a line of code to your site and automatically import fonts that you select for use in your stylesheets! Instructions on how to include these fonts in your code are provided during the process of selecting your fonts.
- `@font-face` is a CSS rule that allows you to take a font file that you've downloaded and load it into your stylesheets. You can read about it [here](https://css-tricks.com/snippets/css/using-font-face/) and [here](https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face)! There are many, many places you can find on Google to download free font files to include in your sites.

[bad-example]: https://s3.amazonaws.com/horizon-production/images/bad-example.png
