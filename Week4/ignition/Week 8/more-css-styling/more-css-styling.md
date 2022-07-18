Let's return to our old friend, the grocery list webpage! While making a grocery list might be boring, our styling doesn't have to be. Let's give this site some pizazz.

## Getting Started

```no-highlight
et get more-css-styling
cd more-css-styling
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

You should see a plain grocery list page in your browser. In your editor, open `index.html` and `style.css`.

As always, we want to start by reviewing the code we've been provided with. It looks like our `index.html` file has three main divs: a `groceries-section`, `pantry-section`, and `notes-section`. The `groceries-section` has a header and a `grocery-list` unordered list with list items. The `pantry-section` has a header and a `pantry-list` with list items of things in our pantry. And the `notes-section` has a header, a paragraph, and a link with our favorite recipe.

## Adding Some Color

Let's add some color to our webpage. First, we can add a background color! Add the following into `style.css`:

```css
body {
  background-color: #e6e6fa;
}
```

Hard-refresh your page by pressing `Command + Shift + r` and make sure your lavender background appears!

Next, let's add a text color to the entire body as well. Add the following into the same ruleset:

```css
color: #696969;
```

Notice that color and background color are styles that are _inherited_, so these styles are being applied to all of our text: our headers, lists, paragraph, and link.

What if we wanted to make just our headers a different color, like a darker grey? Add the below to your CSS file below your `body` ruleset:

```css
h1 {
  color: #2f4f4f;
}
```

## Separating Our Sections

Now, let's create some divisions between the different sections of our webpage.

First, we want to create the same border around each of our sections. We already have divs set up to wrap around our sections. Let's add the same class, `small-page-section`, to each of those divs so that we can apply the same border styling to them.

```html
<div id="groceries-section" class="small-page-section">
  ...
</div>

<div id="pantry-section" class="small-page-section">
  ...
</div>

<div id="notes-section" class="small-page-section">
  ...
</div>
```

Now that we have those divs updated, let's apply some styling to them! First, let's add a border:

```css
.small-page-section {
  border: 2px solid #5f9ea0;
}
```

If we hard-refresh our page, we can see a solid border around our sections. Fantastic! However, this border doesn't look great - it's reaching across our entire page. Let's update our width to make it look a little more styled.

```css
.small-page-section {
  border: 2px solid #5f9ea0;
  width: 75%;
}
```

After we add a width, we can update our page and see that our boxes are less wide, but still very... boxy. Let's add a `border-radius` to create some rounding on the corners! The `border-radius` property helps us to round the edges of our border to not be 90-degree angles. We can use a percentage, pixels, ems, or rems as our value. We can set circular corners using just one value, or elliptical corners if we provide two values. You can play around with some different options in the [border-radius docs][border-radius-mdn]. Let's add a `border-radius` as so:

```css
.small-page-section {
  border: 2px solid #5f9ea0;
  border-radius: 1.5em;
  width: 75%;
}
```

Great! We have three sections, each with their own border. But we have some issues with vertical alignment here: specifically, it doesn't look great having our 3 elements touching on the top and bottom, and our link at the bottom of our page looks super cramped against the bottom of that last border. Let's use our knowledge of padding and margin to fix this up.

Let's update our existing `.small-page-section` ruleset to have some bottom margin:

```css
.small-page-section {
  border: 2px solid #5f9ea0;
  border-radius: 1.5em;
  width: 75%;
  margin-bottom: 1em;
}
```

Remember that margin pushes the outside of our elements further away from each other. We can now see that there's some space between our divs. Then, we want to update the link to have some space under it before the border. Our first inclination may be to add a bottom margin to our anchor tag, but remember that an anchor tag is an inline element, not a block element, so the margin will be ignored by the border of our div block element. Instead, let's use `padding` on the notes section itself:

```css
#notes-section {
  padding-bottom: 1.35em;
}
```

This adds some padding space between the last element (our anchor tag) and the border. Looks great!

Recall that border, width, margin, and padding are all examples of non-inherited properties, so they're not being automatically applied to our child elements, such as our text elements!

## Make It Neat

Let's add some style to our font. What if we want to make all of our links appear in italics? We can add a ruleset for our anchor tags as so:

```css
a {
  font-style: italic;
}
```

Fantastic. We've added a little flair to our links.

Finally, all of this border styling is great, but our webpage still doesn't look professional with all of those elements aligned against the left side of the page. Let's work on centering our elements appropriately.

There are a few different ways to center items on our page. For text, it's fairly simple! If we wanted to center all of the text in our notes section, for example, we can add a `text-align` property to our existing ruleset:

```css
#notes-section {
  padding-bottom: 1.35em;
  text-align: center;
}
```

Let's also add text alignment to all of our `h1` elements by updating our existing ruleset there:

```css
h1 {
  color: #2f4f4f;
  text-align: center;
}
```

Looks great! Our final frontier is to center all of our small page sections on the page. Centering block elements like divs is a little trickier than center-aligning text. You can find some tips and tricks in [this great cheat sheet on CSS centering!][css-cheat-sheet-centering]

To center our small page section divs, we can use the `margin` attribute. Our `.small-page-section` ruleset already has a bottom margin of 1em. To center the element on the page, we'll want to add a right and left margin of `auto`. Rather than add two new attributes, we may remember that we can add a `margin` property and add the sizes in the order of top, right, bottom, and left.

Let's update our ruleset to the below:

```css
.small-page-section {
  border: 2px solid #5f9ea0;
  border-radius: 1.5em;
  width: 75%;
  margin: 0 auto 1em auto;
}
```

Once we refresh, we'll see that our page is beautifully centered and styled. Great work!

## Final Code Solution

We've update our styling to look like a professional webpage! Your `style.css` file should now look like this:

```css
body {
  background-color: #e6e6fa;
  color: #696969;
}

h1 {
  color: #2f4f4f;
  text-align: center;
}

.small-page-section {
  border: 2px solid #5f9ea0;
  border-radius: 1.5em;
  width: 75%;
  margin: 0 auto 1em auto;
}

#notes-section {
  padding-bottom: 1.35em;
  text-align: center;
}

a {
  font-style: italic;
}
```

## Make It Your Own!

Play around with any other styling you want to apply! You can use this [CSS cheat sheet][css-cheat-sheet] for ideas on styles to apply.

[border-radius-mdn]: https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius
[css-cheat-sheet]: https://css-tricks.com/guides/
[css-cheat-sheet-centering]: https://css-tricks.com/centering-css-complete-guide/
