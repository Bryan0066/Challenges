Let's revisit our [cheese-rolling][cheese-rolling] app using JavaScript classes!

### Getting Started

```no-highlight
et get cheese-rolling-classes-js
cd cheese-rolling-classes-js
code .
```

Your code should be run using `node main.js`. Don't forget to use `debugger`'s and `console.log`s to help you!

## Recap

Previously, we made an app for a cheese-rolling competition. Each contestant had a different cheese, and we created methods to determine whether the contestant would give in and eat their cheese before reaching the finish line (based on the contestant's hunger and the cheese's deliciousness) and to determine and store their race time. We then announced everyone's scores.

Now we'd like to rebuild our application using class syntax. Take a moment to think about what class or classes you might want to create for this challenge. After you've thought about it for a bit, expand the text below!

**Hint!**

We definitely want a **Contestant** class -- this class should be responsible for holding data about each contestant as well as methods to

- determine whether the contestant eats their cheese
- roll the cheese
- report the contestant's results

We should also add a class for a **Contest**. This contest will be responsible for

- registering contestants, analogous to the `createNewContestant` function you created previously
- running the contest, by having all contestants roll their cheeses three times
- announcing the results for all contestants

We _could_ create a class for a **Cheese** -- this class would hold the cheese's name and deliciousness. In fact, if a cheese's deliciousness is determined only by the name (type) of the cheese, then we could have the cheese constructor take in only the cheese name and calculate the cheese deliciousness using that information. **However,** we're going to omit this class for now to keep things a bit simpler. If you're looking for an extra challenge after this exercise, go ahead and refactor to use a `Cheese` class!


### Step One: Create a Contestant

1. Create a file for your `Contestant` class, define the class, and then export it and import it into `main.js`
2. The constructor should take in a name, hunger, a cheese name, and a cheese deliciousness and save these values as instance variables. It should also set a `disqualified` instance variable to `false` and a `results` instance variable to an empty array
3. Test your work by importing your contestant file into `main.js` and instantiating a test contestant in `main.js`. Use a `debugger` to check that the contestant object is structured like this example:

```javascript
{
  name: 'John C',
  hunger: 8,
  cheese: {
    name: 'Red Leicester',
    deliciousness: 9
  },
  disqualified: false,
  results: []
}
```

If this isn't what you're seeing, pop some `debugger`s into your constructors to figure out what's going wrong!

### Step Two: Give Your Contestant Behaviors

Now that our contestants have cheeses, let's add three methods to our contestants. The requirements for these methods are the same as in our pre-class-syntax app.

1. Create a method, `checkForCheeseEating`, that sets `disqualified` to `true` if the average of the contestant's hunger and the cheese's deliciousness is greater than or equal to 7, because they've certainly eaten the cheese
2. Create a method, `rollDatCheese`. If a contestant hasn't been disqualified, this method should randomly generate the time it takes the contestant to roll the cheese up the hill, then push this value into the contestant's results array. You can use the provided `generateRandomRolltime` function below!

```javascript
// generate a random integer between 10 and 60
const generateRandomRolltime = () => {
  return Math.floor(Math.random() * (60 - 10 + 1) + 10)
}
```

3. Create a method, `reportIndividualResults`, that reports the contestant's name, cheese name, whether they were disqualified, and results (in an appropriately formal and celebratory tone, using words of your choosing)

### Step Three: Create a Contest

Our contest class should be responsible for

- Registering contestants for the contest
- Running the contest itself: having each contestant roll their cheese
- Reporting the rests of the contest

1. Create a Contest class. You might be tempted to create a constructor that takes in `rawDataArray` -- however, we only need this data for registering contestants, which we're going to be performing in a method we call in `main.js`. In fact, we don't need a constructor for this class at all!
2. Create a `registerContestants` method. This method should take in `rawDataArray` and set a `contestants` instance variable to an array created by iterating through this data to instantiate new contestants
3. Create a `runContest` method that calls `rollDatCheese` on each contestant -- make sure to first check if they have eaten their cheese!
4. Create a `reportResults` method that calls `reportIndividualResults` on each contestant

### Step Four: Run a Contest!

In `main.js`,

1. Instantiate a new contest
2. Register your contestants
3. Run the contest
4. Report the contest results

If you see the results you expect, celebrate your accomplishment! If not, use your debugging skills to get to the root of the problem... and then celebrate!

### Extra Challenges

- Add a functionality that determines and reports the winner! Think about which methods you'll need and which classes they should belong to.
- Create a cheese class whose constructor takes in a cheese name; the cheese object should have a name and also a deliciousness set based on the name

[cheese-rolling]: https://en.wikipedia.org/wiki/Cooper's_Hill_Cheese-Rolling_and_Wake
