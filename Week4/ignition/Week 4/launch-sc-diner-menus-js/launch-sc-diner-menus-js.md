We know it's a bit blasphemous to argue that New York can do ANYTHING better than Massachusetts, but there _are_ a few things that our New Yorkers miss - NY bagels, pizza, and classic diners, to name a few. The old-school diners are something that you just can't easily find in the New England area: you know the ones, they seem to be open at all hours of the day, with a menu 10 times the length of any reasonable expectation, and there's at least one in every town.

In an effort to replicate the joys of diner meals past, let's build a virtual diner with all of our dream meals!

## Getting Started

```no-highlight
et get launch-sc-diner-menus-js
cd launch-sc-diner-menus-js
node main.js
```

## Instructions

* Be sure to only uncomment the code in `main.js` when you get to that part of the instructions which explicitly tell you to.  After it is working you can leave it uncommented as you proceed to the next part.

### Meets Expectations

#### Part One - Ingredients

First, we'll want to set up our ingredients!

Add a file called `createNewIngredient.js` in the project directory. Inside it, add a new function `createNewIngredient` which takes in two arguments: `name` and `category`, and returns an object with those attributes.

Be sure to export your function at the bottom of the file and import it at the top of the `main.js` file.

When you've finished creating this module, go to the `main.js` file and comment in the code under the "Part One" section. Run `node main.js` to take a look at what we've created!

Sample Output for Part 1

```shell
Let's build a diner!
{ name: 'mushroom', category: 'vegetable' }
{ name: 'egg', category: 'protein' }
{ name: 'feta', category: 'cheese' }
{ name: 'spinach', category: 'vegetable' }
```

#### Part Two - Meals

Now that we have some ingredients, we can start cooking up some meals for our diner's endless menu.

Add a file called `createNewMeal.js` in the project directory. Inside it, add a new function `createNewMeal` which takes in two arguments:`name` and `ingredients`, and add them to an object (`ingredients` is expected to be an array full of ingredient objects from Part One).

Also in that object, add two methods:

- `isVegetarian` should iterate over the `ingredients` array, and determine if any of them has a category of "meat". If so, the method should return `false`, but if not, the method should return `true`.
- `isDelicious` should do the same kind of iteration over the `ingredients` array, but this time, it should check if any of the ingredients has a category of "cheese". If so, `isDelicious` should return `true`. If not, it should return `false`.

Return the object at the end of the function.

Be sure to once again export your function at the bottom of the file and import it at the top of the `main.js` file. Now, you can comment out the code in `main.js` under "Part Two" to see this code in action.

Sample Output for Part 2

```shell
baconCheeseOmelette {
  name: 'Bacon and Cheese Omelette',
  ingredients: [
    { name: 'cheddar', category: 'cheese' },
    { name: 'egg', category: 'protein' },
    { name: 'bacon', category: 'meat' }
  ],
  isVegetarian: [Function: isVegetarian],
  isDelicious: [Function: isDelicious]
}
Is it vegetarian?
false
Is it delicious?
true
mushroomOmelette {
  name: 'Mushroom Omelette',
  ingredients: [
    { name: 'egg', category: 'protein' },
    { name: 'mushroom', category: 'vegetable' }
  ],
  isVegetarian: [Function: isVegetarian],
  isDelicious: [Function: isDelicious]
}
Is it vegetarian?
true
Is it delicious?
false
```

#### Part Three - Menus

Finally, we have some meals planned! Let's figure out which meals we're going to offer at different times of the day, so as to not totally overwhelm our kitchen staff.

Add a file called `createNewMenu.js`, with a function `createNewMenu` inside. `createNewMenu`'s purpose is to generate a `menu` object. `createNewMenu` should take in one argument: `title`, which should be assigned as a property on the new menu object. A menu should also have a property of `meals` which initializes as an empty array. Finally, for this step you will also be defining a few methods on this new menu object, as detailed below.

Add a method called `addMeal` to your object. It should take in a new meal object, and add it to the `meals` array.

Finally, add an additional method called `printMenu` whose job it is to output the menu in a nice format. This menu should:

- Show the menu title.
- Add the name of each menu item on its own line.
- Print the full menu to the console.

For example the output should look similar to this:

```shell
Menu: Breakfast
Greek Omelette
Bacon and Cheese Omelette
Mushroom Omelette
```

Tip: iterate over the `meals` array to output each meal name.

By the end of this step, the `createNewMenu` function should return a `menu` object that has the following properties:

- title
- meals
- addMeal _(method)_
- printMenu _(method)_

Be sure to once again export your function at the bottom of the file and import it at the top of the `main.js` file.

You can now comment in the code under "Part Three" in `main.js`. We encourage you to test your code using a debugger.

Be sure to `et submit` your working _Meets_ code before moving on!

  <details>
    <summary markdown="span">Sample Output with All Parts Uncommented</summary>

    Let's build a diner!
    { name: 'mushroom', category: 'vegetable' }
    { name: 'egg', category: 'protein' }
    { name: 'feta', category: 'cheese' }
    { name: 'spinach', category: 'vegetable' }
    baconCheeseOmelette {
      name: 'Bacon and Cheese Omelette',
      ingredients: [
        { name: 'cheddar', category: 'cheese' },
        { name: 'egg', category: 'protein' },
        { name: 'bacon', category: 'meat' }
      ],
      isVegetarian: [Function: isVegetarian],
      isDelicious: [Function: isDelicious]
    }
    Is it vegetarian?
    false
    Is it delicious?
    true
    mushroomOmelette {
      name: 'Mushroom Omelette',
      ingredients: [
        { name: 'egg', category: 'protein' },
        { name: 'mushroom', category: 'vegetable' }
      ],
      isVegetarian: [Function: isVegetarian],
      isDelicious: [Function: isDelicious]
    }
    Is it vegetarian?
    true
    Is it delicious?
    false
    Menu: Breakfast
    Greek Omelette
    Bacon and Cheese Omelette
    Mushroom Omelette
  </details><br>

### Exceeds Expectations

#### Part One - Refactor

Our first step in exceeding expectations is to make sure our code is as neat as possible! Go through your code and see if there are any spots you can refactor. At a minimum, be sure to include the following refactors:

- Update your `createNewIngredient` function to use **property value shorthand** to make this object with as little repetition as possible.
- Make sure the logged output from `printMenu` is nicely formatted, with each bit of information on its own line.

#### Part Two - Using the `Date` object

Firstly, we want to add a start time and end time for each of our menus, so that our staff can use them to know which menus to give to the customers.

Add a `startTime` and `endTime` into the argument list for our `createNewMenu` function, and add them as properties in our menu object. We're going to simplify how we store "time" so that we can avoid some JavaScript trickiness: simply store the time as the hourly integer for military time. In other words, if you're creating the "Breakfast" menu, its `startTime` argument could be `7` and its `endTime` could be `12`. If you're creating the "Lunch" menu, its `startTime` argument could be `12` and its `endTime` could be `16`.

Next, comment in the code under "Exceeds Part Two" in `main.js`. Then, at the bottom of your `main.js` file, define a new _arrow function_ called `welcomeCustomer`. This function should first determine which menu is currently active. It can use the provided `currentMenus` array as its list of options.

In your function, you should use the `Date` object to determine the current time, and based on that time, figure out which menu is active using the `startTime` and `endTime` of each menu. You can take a look at the Date object documentation to learn more about the Date object and its functionalities: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date

Once the active menu has been determined, the function should `console.log` a message to the customer which says the following:

```no-highlight
Welcome to our diner! Here's our <name of menu> menu, which we're serving until <menu end time>.
```

Make sure to account for your edge cases! `console.log` a different and helpful message in the event that none of the current menus are active at the given time.

Finally, at the end of the file, _invoke_ `welcomeCustomer` to test out your functionality!

_Hint:_ You can test the different `if/else` cases by temporarily replacing your `Date` object with a date you create with a specific time. Just remember to change it back to use the current time before submitting!

[date-mdn]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date
