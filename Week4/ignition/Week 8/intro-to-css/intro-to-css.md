## Changing HTML with Style

### Looks vs. Layout

In the beginning, web pages looked more or less the same. It was basically text, rendered plainly on a web page. White backgrounds and black text were the norm, with the text reading from top-to-bottom in one large column, mostly in the form of one simple article. Links were blue before you clicked them, and purple afterwards. HTML had created a hard _dependency_ between the layout of the website and the _look_ of the website. How an element was rendered on a web page (font, text size, etc.) would be determined exclusively by that element's tag (e.g., all `<p>` elements, or paragraphs, would look exactly the same).

As HTML and the web grew in popularity, there were a few attempts to remedy this. Initially, some new elements were created to manipulate text on the web pages in a way familiar to users of word processor, and some contained some level of customizability. `strong` was introduced to mimic boldface, `i` was introduced to render text in italics, and `u` was introduced to give text an underline.

```html
<i>Italic text</i>
<strong>Bold text!</strong>
<u>Underlined Text!</u>
```

When the above is put into a `body` element and rendered by a web browser, it looks like this:

![Image showing three lines of text: one italic, one bold, one underlined][font-variants]

While that pattern worked, the differences between the layout and the design continued to be a strain on HTML. For instance, consider header elements (labeled `h1`, `h2`, and so on until `h6`). Semantically, they referred to different levels of headers and subheaders. Practically, they told the browser to render the various elements as different sizes of text.

```html
<h1>A little bit softer now...</h1>
<h2>A little bit softer now...</h2>
<h3>A little bit softer now...</h3>
<h4>A little bit softer now...</h4>
<h5>A little bit softer now...</h5>
<h6>A little bit softer now...</h6>
```

Rendered by a web browser, the above produces the following:

![Image showing headers of all sizes in decreasing order][font-size-variants]

The problem came when a website wanted to vary from the patterns that the limited series of elements provided it. We may want to define something as a header but have a different color or size than the default. Separating HTML content from HTML presentation was an important concept for accessibility.

Software called "readers" could understand HTML and read its contents to the visually impaired end user. This works so long as the _semantics_ of the html are correct -- so, headers are appropriately labeled as `h1`, paragraphs as `p`, etc. However, a developer who is focused on what the website _looks_ like might just use whatever element renders with their desired font effects -- perhaps rendering an important paragraph as an `h5` to make it boldface and larger. This would cause problems for readers, which would assume that the text was a header instead of a paragraph. Moreover, what if I want my website to have a background, or for links to be red before they're clicked on? What if I don't want my website to be a single column of text, but instead a multi-column layout? I would need more flexibility than HTML alone can provide.

### Enter: CSS

There was clearly a need to add a new puzzle piece, separate from HTML, that is capable of handling presentation details. This is where CSS, or _Cascading StyleSheets_, comes in! CSS isn't really a programming language or a markup language but a whole new thing: it's a stylesheet syntax, where a _stylesheet_ is literally just a file, or sheet, listing styles. CSS lets you apply styles selectively to elements in HTML documents. Thanks to CSS, we were able to separate some concerns in our simple webpages: HTML elements helped you define _what_ the element was meant to represent semantically, and the styles in CSS allowed you to achieve the design you wanted.

CSS provides us with syntax to pinpoint exactly which elements we want to style and then specify exactly how they should be styled. Let's take a look at a breakdown of CSS syntax.

#### The Anatomy of a CSS Ruleset

CSS determines _which_ elements to style, and _how_, using what is called a _ruleset_. A ruleset can look something like the below:

```css
p {
  font-style: italic;
}
```

A ruleset has a few key parts that define the styling.

The first part of the ruleset is the **selector** -- here, `p`. The selector answers the question: _which_ element(s) do we want to style? By choosing selectors carefully, we can be as broad or as specific as we want about which elements we want to apply the styling to. Here, we are saying that we want to apply this style to all `<p>` elements.

The next part of the ruleset is the **declaration**, which includes everything inside of the curly brackets. The declaration is the part that tells our application _how_ we want to style. The declaration is made up of (one or many!) pairs of **properties** and **values** (if you're familiar with JavaScript objects, these terms may sound familiar!). _Properties_, or _property names_, describe things about the HTML elements that we can change. _Values_, or _property values_, describe all the different modifications that we can make.

In the above example, `font-style` is the property, and `italic` is the value. Note the other syntax: we use a colon to separate the property and value. Additionally, we end each line of CSS with a semicolon. If we wanted to add additional styles (for instance, if we also wanted our font size to be 16 pixels) we could just add an additional property/value pair:

```css
p {
  font-size: 16px;
  font-style: italic;
}
```

We will go over specifics about what kinds of properties we can change in a future article!

#### Where does CSS belong?

We have two options for where to put our CSS code. Our first option is to put our CSS code directly in our HTML document, within a `style` tag inside of our `<head>` element. This is a quick and easy way to get CSS up and running in our webpage.

Given the following HTML:

```html
<html>
  <head>
    <style>
      p {
        font-size: 16px;
        font-style: italic;
        color: #0000ff;
      }
    </style>
  </head>
  <body>
    <h1>This is a header!</h1>
    <p>and this is blue!</p>
  </body>
</html>
```

our browser will render the following web page:

![Image showing a header followed by a paragraph tag in blue italics][header-paragraph-blue]

However, this could get unwieldy fast, as we begin to add more styling. Additionally, no matter how much styling we have, it is generally best to separate different concerns into their own file! The better option here is to put our CSS code into its own file, such as a `style.css` file within the same directory as our HTML file, which we can then reference within our HTML document by adding the below `<link>` element into our `<head>` element in our HTML document:

```html
<link rel="stylesheet" href="style.css" />
```

This `<link>` tag does not create a hyperlink to our stylesheet, like an anchor (`<a>`) tag would, but instead links the stylesheet to our HTML document so that the styling in that stylesheet will be applied to our webpage.

Note: We can also link to stylesheets that live outside of our application, if we wanted to use an external styling library. You would do that in much the same way as our _internal_ stylesheet link shown above. For a stylesheet found at the url `http://www.stylez.biz/stylesheet.css`, we would change our `link` element to look like this:

```html
<link
  type="text/css"
  rel="stylesheet"
  href="http://www.stylez.biz/stylesheet.css"
/>
```

Stylesheets have additional benefits beyond allowing us to write our CSS in separate files. When we request a web page, we also request any external files (like _stylesheets_) linked to it. Our browsers have powerful features like _caching_, which will allow a web site to keep a version of its stylesheet with the browser after a user visits the page. The next time the user visits the page, the browser can use the local version of the stylesheet. This prevents the browser from having to make an unnecessary request to our server and improves user performance, because the webpage has less to load up the second time the page is visited.

Finally, it's worth mentioning that there is also something called "inline styling", where we can apply styling directly to an element within our HTML tag. However, this is not considered a best practice - while useful for spot jobs, we ideally want to separate our CSS into its own file, or "Stylesheet". An example of inline styling is below:

```html
<p style="font-style: italic; color: green;">Italic Green Text!</p>
```

### Summary

In the modern Web landscape, websites are styled by Stylesheets. They allow developers to extract the style concerns from the html concerns, putting them in two different files and linking them by convention. Our CSS rulesets use selectors and declarations, with properties and values, to specify what styling we want to apply to which elements.

[font-variants]: https://s3.amazonaws.com/horizon-production/images/article/intro-to-css/html-tags.png
[font-size-variants]: https://s3.amazonaws.com/horizon-production/images/article/intro-to-css/jvmAFue.png
[header-paragraph-blue]: https://s3.amazonaws.com/horizon-production/images/article/intro-to-css/DvVv1Lw.png
