### Learning Goals

- Learn why we might want to validate our HTML
- Become familiar with the W3C HTML validation tool
- Understand the importance of writing accessible HTML and a few ways to do so

## Getting Started

```no-highlight
et get html-validation-and-accessibility
cd html-validation-and-accessibility
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

### Why This Matters

1. Why write bad-but-functional HTML when you can write _good_-and-functional HTML? We'll see a tool that will help you quickly check that your HTML is happy.
2. We'll use this opportunity to dive into the importance of accessibility and what that means for you as a developer!

## Validate me!

You should have `index.html` open in your code editor and your browser. Looking at the file, we can see that our HTML really doesn't look great... right off the bat, we're missing things like the `<html>`, `<head>`, and `<body>` tags, and there are other issues as well. Looking at the browser, everything looks right except that our image is missing. Let's look at a tool that will help us get our HTML into fighting shape!

W3C (the World Wide Web Consortium) is responsible for creating the standards that define what HTML should look like; this way, there's a single definition of what "good" HTML is, regardless of the developer writing the HTML or the browser rendering it. To help developers follow their recommendations, they provide an [HTML validation tool][validator] that lets us enter a URL, upload a file, or paste in some HTML to validate it.

Open the validator and click on `Validate by Direct Input`. Paste the content of index.html into the text box and click `Check`. You should see roughly 13 errors and warnings.

Let's start with the _errors_, from the top of the list down. We see the following:

1. Start tag seen without seeing a doctype first. Expected <!DOCTYPE html>.
2. Element head is missing a required instance of child element title.
3. Bad value some text for attribute id on element div: An ID must not contain whitespace.
4. Element boldface not allowed as child of element p in this context. (Suppressing further errors from this subtree.)'

along with other errors that we'll address later on. To resolve these, make the following changes to your document:

1. Add `<!DOCTYPE html>` to the top of the document, then set up `<html>`, `<head>`, and `<body>` elements properly
2. Add a `<title>` to the `<head>`
3. Change both occurrences of `id="some text"` to `id="some-text"`

Rerun the validation with your updated HTML, which should yield roughly 11 errors and warnings. The topmost errors include

1. Element boldface not allowed as child of element p in this context. (Suppressing further errors from this subtree.)
2. Duplicate ID some text.
3. Attribute 123 not allowed on element div at this point.

Our validator has noticed that we tried to use a `<boldface>` element and reports that it is not a valid child of `<p>`. In fact, what we really intended was a `<strong>` element, so go ahead and replace `boldface` with `strong`.

The validator has also recognized that we've duplicated an `id` and that we tried to put a nonsense attribute on a `div`. Let's fix those -- go ahead and make both ids unique, and then get rid of the nonsense attribute.

Rerun your code -- we're getting so much closer! Only one warning and three errors. All three errors relate to our `<img>`:

- Attribute href not allowed on element img at this point.
- Element img is missing one or more of the following attributes: alt, src.
- An img element must have an alt attribute, except under certain conditions. For details, consult [guidance on providing text alternatives for images][guidance].

First off, this reveals the bug in our HTML that was preventing us from seeing the image: we mistakenly used an `href` attribute (used in `<a>`) instead of an `src` attribute (used in `<img>`). It reports that to us twice, really: both that the `href` doesn't belong there and that the `src` attribute is missing.

The other error is telling us that we've forgotten to include an `alt` attribute on our image. This is an _accessibility concern_, which we'll talk more about in the next section. For now, we'll just fix it!

Change `href` to `src`, add an `alt` attribute with the text `llama llama llama llama`, reload `index.html` in your browser, and rerun the validator.

At this point, you should only see a warning,

- Consider adding a lang attribute to the html start tag to declare the language of this document.

In web development, _warnings_ and _errors_ are quite different. An error generally **needs** to be addressed, whereas a warning is more of an FYI/nice-to-have. But, we are conscientious coders, so let's address this warning! Change `<html>` to `<html lang="en">` to clarify that the page is in English (or, feel free to translate the text into Swedish and set `lang="se"`).

When you rerun the validator one last time, you should see a green text bar saying that our HTML is valid! Yay!

## Accessibility

Let's circle back to the error we got when we had an `alt`-less `<img>`. The `alt` attribute provides _alternative text_ that is intended to describe what the image is, in case the user can't see the image.

When is this helpful? First and foremost, it's helpful for users who require accessibility tools to navigate the web and consume content. For example, for a visually impaired user, an article will make a lot more sense if their screen reader (which converts webpages into audio) can inform them of what images are on a page. In the case of `index.html`, the alt text is the only way a screen reader can inform the user that there's a picture of a llama on the page. Other useful alt-text examples could be "Graph showing a strong negative correlation between average global temperature and number of pirates" and "Image of sad Keanu Reeves sitting alone on a park bench".

Providing alt-text is far from the only way to make your webpages more accessible. The MDN site has a great article, ["HTML: A good basis for accessibility"][html-accessibility-mdn], with additional advice. For example, it's important to use the more appropriate HTML tag for your text structure -- do not use `<p>` instead of `<li>`, or it will be difficult for accessibility tools to properly convey the content.

Finally, accessible HTML can also make it easier for developers to create new apps that help us digest the internet in better (or, at least different) ways. For example, the [Pocket app][] lets you store articles from the web for reading later and presents them in a clean, ad-free format. These tools require good HTML in order to accurately reproduce the content of the webpage.

### Resources

- [W3C HTML validator][validator]
- ["HTML: A good basis for accessibility" on the MDN website][html-accessibility-mdn]

### In Summary

In this article, we've seen how the W3C HTML validator can help us spot issues with our HTML that we couldn't spot simply by rendering the page. We also learned about the importance of accessibility and a few things we should bear in mind when writing HTML.

[guidance]: https://www.w3.org/wiki/HTML/Usage/TextAlternatives
[validator]: https://validator.w3.org
[html-accessibility-mdn]: https://developer.mozilla.org/en-US/docs/Learn/Accessibility/HTML
[pocket]: https://app.getpocket.com/
