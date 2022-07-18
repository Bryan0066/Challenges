At this point, we're familiar with CSS syntax and how to apply some of our own styling. Now, let's take a look at how CSS is applied behind the scenes, and how it decides which styling rules to follow!

Note: All styling examples can be found in the `index.html` and `style.css` files found in the project directory if you `et get css-cascade-and-inheritance`. This is not necessary to follow along with the article, but it may be helpful to play around with!

## Cascade, Inheritance, and Specificity

As we know, CSS stands for Cascading Style Sheets. Let's take a closer look at how that _cascade_ applies in practice!

The meaning behind "cascading style sheets" is to indicate that styling rules that are applied will trickle down. Once we understand how the cascade works and makes decisions on what styles to apply, we can learn the ways to be specific about the _order_ in which we apply our styling, and the _method_ with which we apply it, so that we get the output we desire.

There are three main concepts that play into the way CSS gets applied to our HTML:

- **Cascade** refers to the order in which CSS rules are set up.
- **Inheritance** refers to rules from higher-order elements or selectors trickling down into child elements.
- **Specificity** refers to how specifically a given element is referred to, using the element type, class, or id.

Let's take a deeper dive into each below.

### Cascade

Cascade refers to the importance of the _order_ of different CSS rulesets. If there are two rules with equal specificity, the one that comes last will be used - it's as if it _overwrites_ the original specific property value that was set up.

As an example, let's say we had the below CSS code:

```css
ul {
  border-width: 1px;
  border-style: dashed;
  border-color: red;
}

ul {
  border-color: blue;
}
```

In the above example, we first apply a 1px dashed red border to our unordered list elements. Then, later in our CSS code, we have a second ruleset that applies a border color of blue. Since CSS allows the last-declared style to override all others, the resulting border will be blue!

Note that it is _only_ the specific property-value pairs that will be overridden -- not the entire ruleset! So our border will still be `1px` and `dashed` -- it is _only_ the color that gets overridden.

It is the order of the rulesets and styles in our CSS code that matter, not their order in our HTML. Let's take a look at another example:

HTML code:

```html
<h1 class="green orange">Header 1</h1>
<h1 class="orange green">Header 2</h1>
```

CSS code:

```css
.green {
  color: green;
}

.orange {
  color: orange;
}
```

Here, it doesn't matter in what order the classes were applied within our HTML code: `"green orange"` or `"orange green"`. As far as CSS is concerned, it knows that both headers have those classes, but doesn't pay attention to their order. Both headers will end up being **orange**, because that's the last CSS rule that was applied!

#### The Order of the Cascade Style Sheets

It is not just the order within one style sheet that matters when it comes to the cascade, but also the source order of all style sheets in our app. It may be the case that we load in a style sheet from an external source, and then also our own custom style sheet - say, both in `link` tags in the `head` of our HTML page. We would want to make sure we put our custom style sheet in the _second_ `link` tag, so that it gets loaded in second! That is to say, we would want it to look like this:

```html
<head>
  <link
    type="text/css"
    rel="stylesheet"
    href="http://www.externalstylings.biz/stylesheet.css"
  />
  <link rel="stylesheet" href="style.css" />
</head>
```

Also, remember that there's always more styling at play than our own custom CSS, because our webpages are initially styled by the browser-specific "user agent style sheets". These are the style sheets automatically applied by the browser which indicate the default styling if no other CSS is included in the application to override it (such as turning links blue pre-click and purple post-click). Then, we may even have what are called "user style sheets", which are styles that the user has applied to our browser separate from our application - think dark modes, accessibility tools, or other custom stylings that may affect our page. And finally, we have our "author style sheets" which are the style sheets we apply. The cascade _loads_ these different types of style sheets in the order below (which, recall, means it _prioritizes_ them in the reverse order). Just like with rulesets, the later style sheets in the list will override any conflicting styling in the earlier style sheets.

1. User agent style sheets
2. Normal declarations in user style sheets (applied by the user)
3. Normal declarations in author style sheets (applied by us, the developer)
4. Important declarations in user style sheets (stylings marked as `!important`, which we'll discuss in more detail below)
5. Important declarations in author style sheets

We can see that our custom CSS is loaded after any browser-based CSS, so that our author style sheets will be prioritized.

> Note: User agent style sheets can sometimes be the cause of issues when looking at our webpage in different browsers: because they set up different defaults! One possible solution to not have differences from browser to browser is to use something called a "Reset Style sheet", which provides a style sheet to override the typical "default" settings of the browser and make them consistent. [Reset CSS][reset-css] is a popular example.

### Inheritance

Inheritance refers to the styling that "trickles down" from a parent element to its child. There are some styling rules that are inherited by child elements, frequently those that apply to color and text. For example, we could have some code like this:

HTML code:

```html
<div class="our-section">
  <p>Hello world!</p>
  <ul>
    <li>This is a list item.</li>
  </ul>
</div>
```

CSS code:

```css
.our-section {
  color: blue;
}
```

Even though the blue color isn't directly applied to our paragraph or list item elements, our text on the page will appear in blue, because it is inheriting that styling from the surrounding `div`!

On the other hand, there are some styling rules that are not inherited, most of which seem fairly intuitive if we think about it. For example, styles like `width`, `margin`, `padding`, and `border` are not inherited. Imagine if we changed the above CSS to the below:

```css
.our-section {
  width: 50%;
  border: 2px solid red;
}
```

If these styles were inherited, our `div` would be half the width of the page, with a red border around it. But additionally, our `p` and `ul` elements inside that div would be half the width of the div (a quarter of the page), also with a red border. And our `li` elements inside of our `ul` would be half that width (one eighth of the page!) with a red border as well. That just would not make sense from a styling standpoint! As such, these rules are not inherited.

There are a few styling keywords we can use to change the behavior of inheritance, for example to defy the default behavior and turn inheritance on or off. They are listed in the table below.

| Keyword | Description | Usage | Behavior in above example |
| --- | --- | --- | --- |
| `inherit` | Used to tell a child element to inherit certain styling from its parent | `p { border: inherit; }` | The paragraph will inherit the 2px solid border from the div |
| `initial` | Used to unapply any author styling and simply use the styling from the user agent style sheets | `p { color: initial; }` | The paragraph will _not_ inherit the color blue, but instead return to the default paragraph color of black |
| `unset` | Acts as a sort of combination of the two above, depending on circumstance. If the property is inherited by default, it sets the property to the `inherit`ed value. If it does not inherit by default, it sets the property to its `initial` value | `p.regular { color: unset; }` | Here, since color's default behavior is to inherit, it will keep the color as blue |

### Specificity

Specificity is the final crucial concept to cover in order to understand how CSS determines which styling to apply to a given element. It refers to how _specifically_ we are referring to one specific element: it is basically a game of one-upping other styling rules to see which one wins! The more specifically we refer to one element when styling, the higher that styling rule is prioritized.

We know that we are able to use different _selectors_ in our CSS rulesets, such as the element type, a class name, or an id. CSS reads and orders these types of selectors as follows:

1. _Element type_: First, CSS will take a look at the element types and apply that styling.
2. _Class_: CSS then looks at the class-based styling and applies that. If any of this styling conflicts, the `class`-based styling wins out.
3. _Id_: Recall that an _id_ is supposed to be the most specific selector option: `id`s should only be applied to one single element, and should be unique to that element. As such, `id`-based styling is applied last, and prioritized above the other selectors.

Let's take a look at the below example:

HTML code:

```html
<p class="special">Hello World!</p>
```

CSS code:

```css
p {
  color: red;
  font-style: italic;
  font-weight: bold;
}

.special {
  color: blue;
}
```

In this case, we would expect our "Hello World!" text to show up in blue! This is because our `special` class is considered more specific than our `p` element with a color of red.

We can actually combine selectors to create even more specificity. For example, let's say we had the below code:

```html
<h1 class="special">Hey there!</h1>
<p class="special">Hello World!</p>
```

```css
p {
  color: red;
  font-style: italic;
  font-weight: bold;
}

p.special {
  color: orange;
}

.special {
  color: blue;
}
```

Here, even though the `.special` ruleset is last in our list, the `p.special` combined ruleset of the element type **and** the class is more specific. Therefore, we see a blue header of "Hey there!", but an orange paragraph saying "Hello World!"

In addition to our prioritization based on selector type, we also have an additional prioritization: inline styles (added directly in the HTML document) are considered more specific than styles added in our `.css` files.

If we dig down deep, specificity has some pretty intense rules surrounding how it prioritizes different styles. You can see MDN's listing of the [specifity scoring rules here][mdn-specificity-docs]. Your best bet for avoiding unexpected behavior and tricky calculations is to default to using classes to apply your styling, and avoid using ids, combinations, and inline styles unless you have a very specific reason to utilize them.

#### Importance

We do have one last trick up our sleeve, if we want need to override all of the calculation happening in our cascade: the `!important` keyword. It can be applied as so:

```css
p {
  color: red !important;
```

Adding the `!important` keyword to a property-value pair makes our CSS automatically consider that style rule the _most_ specific. However, if we choose to do this, we're completely circumventing the rules of the cascade. This means that down the road, we could run into some pretty gnarly debugging scenarios for ourselves or another developer, since we will no longer be able to guarantee that the cascade will calculate as expected!

Typically, if our styling isn't applying as we expect, it is far better to actually _fix_ the problem using our newfound knowledge of the _cascade_, _inheritance_, and _specificity_, rather than just masking it using the `!important` keyword.

### Wrapping Up

We now know how to take _cascade_, _inheritance_, and _specificity_ into account when writing our CSS, so that we can target the specific elements we want with particular styling! This knowledge will not just allow you to write well-organized CSS code, but most frequently, it will assist you in debugging situations where the styling you _expect_ to see is, for some reason, not being applied.

[mdn-specificity-docs]: https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/Cascade_and_inheritance#Specificity_2
[reset-css]: https://meyerweb.com/eric/tools/css/reset/
