You work has been stellar lately. INTERstellar. Given your expertise, we want you to help get the company's "About Us" page working!

## Getting Started

```no-highlight
et get launch-sc-space-industries-inc-js
cd launch-sc-space-industries-inc-js
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

This should open the `index.html` document in your browser. Your code will be placed in `main.js`, `index.html`, and `style.css`.

## Meets Expectations Requirements

#### Markup

Completing this section won't make your page look fancy, but it will get all the required content on the page. Be sure to meet the listed objectives prior to moving on, by adding HTML code directly into your `index.html` file. _You are encouraged to use made-up information if you like._

Your company page should display the following:

- An image of the company logo -- you can use the "launch-logo.png" file in the "images" folder or provide your own!
- The page title, which should be the name of the company "Space Industries Inc." This should be in a "heading 1"
- A section for company contact information, which should minimally include your company's phone number, email and address
- A section for Social Media Links with a list of links to company social media sites -- you can make up these URLs
- An About Us section with a paragraph that briefly describes the company
- A Core Values section that provides an unordered list of three core values for the company
- A Slogan section that has a quote in it with the company's slogan
- All sections should have a "heading 2" at the top (not applicable to the image)

#### Styling

Style your page so that...

- it has a background color of `#E3F3F3`
- it has the company name in the `#2d2d2d` color
- your image's size is appropriate for the page
- the company image appears at the top center of your page
- the "heading 2s" for each of the sections are bold and have text color `#5cab75`
- the "headings" (both 1 and 2) are also centered
- the slogan section has a border around it
- each individual section of the page (the company contact section, the social media section, the About Us section, the Core Values section, and the Slogan section) has a margin of 10 pixels on all sides

The image below shows one example of how your company page could be styled. This is an example of a **Meets Expectations** page, but yours does not have to look exactly like this so long as it satisfies the requirements specified above!

![Styling example][example]

Include all of your styling in the `style.css` file. The criteria above are minimum requirements -- feel free to get creative if you have the time!

#### Page Behavior

The provided code includes an `Edit me!` button in the HTML, and some code in `main.js` which executes the code in the `makeEdits` function when the `Edit me!` button is clicked. Add your code in the `makeEdits` function! _Note that you should not need to change the event listener to make this work: you will just add logic inside of the function._ Remember that you can refresh your page to return it to its initial state.

For this section, feel free to add any necessary classes or ids directly to your existing HTML.

When `Edit me!` is clicked...

- the background color of the page changes to some other color of your choosing
- a new slogan of your choosing should appear within the slogan section, and should replace the original slogan (only your new slogan should be present)
- the first core value is deleted from the page

## Exceeds Expectations Requirements

We want to create a little more interaction with our page.

Add functionality and styling such that:

- when the user hovers over the company image, the slogan that is currently visible on the page pops up in an alert box. If the user has not clicked "Edit Me!" yet, the original slogan is in the alert. If the user _has_ clicked "Edit Me!", the updated slogan appears in the alert.
- when a user hovers over each of the individual Core Values, they turn a different color than they were originally for as long as the user is hovered over the item. Upon moving their mouse away, the core value reverts back to its original color
- add a button to the bottom of the page which says "Sing a Song!"
- when a user clicks on the "Sing a Song!" button, an alert box should pop up with lyrics from your favorite song inside

Oh no...we've been hacked! Add a second JavaScript file called `hacked.js` which updates the address on the page to `4 Privet Drive, Little Whinging, Surrey` and the phone number to `867-5309`. Connect this JavaScript file to your webpage so that it enacts change on the page after loading.

[example]: https://s3.amazonaws.com/horizon-production/images/challenge/launch-sc-space-industries-inc-js/revised-example-page.png
