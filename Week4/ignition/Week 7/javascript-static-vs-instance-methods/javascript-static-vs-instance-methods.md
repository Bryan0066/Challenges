At this point, we've been introduced to JavaScript classes and how to store state, as attributes, and behavior, as methods, within them. However, there's actually another type of method that can be employed as well. These are our `static` methods, and they work a little differently than the instance methods we've been working with.

Specifically, static methods allow us to call a function on a class, rather than the object created by a class. This allows us to do things such as generate helpful utility methods, alternative constructors for our objects and more!

### Instance vs. Static Methods

First, let's have a refresher on instance methods:

```javascript
class Recipe {
  constructor(name, ingredients, instructions) {
    // takes in a name, an array of ingredients as strings,
    // and an array of instructions as strings
    this.name = name
    this.ingredients = ingredients
    this.instructions = instructions
    // sets the number of instructions completed to 0
    this.instructionsCompleted = 0
  }

  showNextInstruction() {
    const numberOfInstructions = this.instructions.length

    // checks if we've made it through all of the instructions
    if (this.instructionsCompleted === numberOfInstructions) {
      console.log("That's it! You're done!")
    } else {
      // logs the next instruction from the instructions array
      console.log(this.instructions[this.instructionsCompleted])
      // increments which step we're on
      this.instructionsCompleted += 1
    }
  }
}
```

In order to use the `showNextInstruction` method, we first need to create an instance of a recipe:

```javascript
const ingredients = ["orange juice", "champagne"]
const instructions = ["Mix orange juice and champagne to taste", "Enjoy!"]
const ourRecipe = new Recipe("Mimosas", ingredients, instructions)
ourRecipe.showNextInstruction()
// 'Mix orange juice and champagne to taste'
ourRecipe.showNextInstruction()
// 'Enjoy!'
ourRecipe.showNextInstruction()
// "That's it! You're done!"
```

We first need to call `new Recipe` to create the `ourRecipe` object. Once that is done, we call `showNextInstruction` function directly on that object.

Notice that within our `showNextInstruction` method, the `this` keyword is pointing at the specific instance of the class that we're working with. So by calling `this.instructions` on the recipe object, we're able to access the instructions specifically for our Mimosas recipe.

Now let's take a look at a static method:

```javascript
class Coffee {
  constructor(roaster, name, roast, tastingNotes) {
    this.roaster = roaster
    this.name = name
    this.roast = roast
    this.tastingNotes = tastingNotes
  }

  static listRoasts() {
    return ["light", "medium", "medium-dark", "dark"]
  }
}
```

The `static` keyword is what indicates to our program that we intend for our method to be `static` rather than an instance method.

But what does a `static` method help us do? Methods defined with the `static` keyword aren't tied to one specific instance of our class. The `listRoasts` function does not rely on any properties of our object in order to perform its function. Instead, it performs a utility that is relevant to coffee put not a specific instance of coffee: a list of possible coffee roasting styles.

This also means that we don't have to create an instance of the class with `new Coffee` in order to be able to call this function. Rather, we just call it on the class itself, like so:

```javascript
const roasts = Coffee.listRoasts()
console.log(roasts)
// ['light', 'medium', 'medium-dark', 'dark']
```

### When to Use a Static Method

Generally, we'll often employ static methods for common behaviors: **utility methods** and **alternate constructors** (though there are sometimes other use cases that we won't dig into here).

#### Utility Methods

Utility methods are methods that run some logic or return information that is related to the domain of a specific class, but that isn't tied to a specific instance of that class. For example, our `listRoasts` function above is a utility method: it returns information that has to do with the concept of `Coffee` at large, but isn't altered by looking at one specific bag of coffee.

Utility methods can help us stay organized, and make it easier to recall what functions correlate with certain types of objects. For example, JavaScript contextualizes a series of [Mathematical functions][math-functions] inside a Math constant.

```javascript
Math.round(30.4)
Math.max(1, 4, 10, 7)
```

`Math` provides the `round` and `max` methods (in addition to many others) as an aid for computing otherwise complex or tedious mathetmical operations.

Let's take a look at another utility method that may be useful in our `Coffee` class. Often, hard-core coffee enthusiasts will measure their ingredients by gram, including their water. But what if we wanted a quick function to be able to convert grams to water, in case we were missing our scale?

We could add a static function to our `Coffee` class like this:

```javascript
class Coffee {
  constructor....

  static convertWaterGramsToOunces(grams) {
    return (grams * 0.035)
  }
}
```

This function does not rely on any instance variables, it simply takes in a number of grams, and converts it to ounces. We could see this in action by running the below:

```javascript
Coffee.convertWaterGramsToOunces(355)
// 12
```

We wouldn't create a cup of coffee and _then_ call `convertWaterGramsToOunces`. The conversion itself has nothing to do with a cup of coffee, but it is useful to us if we were making a coffee brewing application, and it may be the concern of the coffee class to perform this function.

#### Alternate Constructors

Another common reason for using static methods is in the case of alternate constructors, sometimes called _factory functions_. We may wish to generate an object with different parameters based on the data at hand. This is where an alternate constructor can aid us. Depending on how it's written, an alternate constructor can do some setup of the object behind-the-scenes before using the class's standard built-in constructor

For example, let's say we have a `TeamMember` class like this:

```javascript
class TeamMember {
  constructor(name, role) {
    this.name = name
    this.role = role
  }
}
```

We want to create a bunch of team members, one manager and three employees. We could do that with the following code:

```javascript
const teamMember1 = new TeamMember("Elizabeth", "manager")
const teamMember2 = new TeamMember("Frank", "employee")
const teamMember3 = new TeamMember("Susan", "employee")
const teamMember4 = new TeamMember("Steve", "employee")
```

As you can see, there's a lot of repetition, which is generally a good sign that there could be a better implementation. This is where an alternate constructor can help. We can add a `static` `createEmployee` method into our `TeamMember` class to make a team member with role 'employee':

```javascript
class TeamMember {
  constructor...

  static createEmployee(name) {
    return new TeamMember(name, 'employee')
  }
}
```

We can now refactor our code to quickly and efficiently make employees in our program without repetition!

```javascript
const teamMember1 = new TeamMember("Elizabeth", "manager")
const teamMember2 = TeamMember.createEmployee("Frank")
const teamMember3 = TeamMember.createEmployee("Susan")
const teamMember4 = TeamMember.createEmployee("Steve")
```

Note: instead of the class name itself (`TeamMember`), we can use the `this` keyword to call other static methods inside of our current static method as well. In this case, the context of the "this" keyword is different than in a standard instance method. In instance methods, `this` refers to the particular instance of the class (e.g. one specific employee), and can be used to access attributes and other instance methods on that object. With `static` methods, `this` points to the constructor of our `TeamMember`. As such, `new this(name, 'employee')` is effectively `new TeamMember(name, 'employee')`. For example:

```javascript
class TeamMember {
  constructor...

  static createEmployee(name) {
    return new this(name, 'employee')
  }

  static anotherStaticMethod() {
    // we could do any separate logic in here
    // but if we wanted to call our static `createEmployee` method:
    return this.createEmployee('Moira')
  }
}
```

But if we wanted to call our static method inside of an **instance** method, we will _have_ to use the class name itself:

```javascript
class TeamMember {
  constructor...

  static createEmployee...

  anInstanceMethod() {
    // we could do any separate logic in here
    // but if we wanted to call our static `createEmployee` method:
    return TeamMember.createEmployee('Moira')
  }
}
```

In order to use the `anInstanceMethod` instance method we must call it on an instance of the object:

```javascript
const newEmployee = teamMember1.anInstanceMethod()
console.log(newEmployee)
```

If we simply tried to call `TeamMember.anInstanceMethod()` we would get:

```bash
TypeError: TeamMember.anInstanceMethod is not a function
    at Object.<anonymous> (/Users/arkhamsrazor/challenges/javascript-static-vs-instance-methods/TeamMember.js:30:12)
```

For this reason, whether we're in a static or an instance method, we'll typically just stick to using the class name (rather than the `this` keyword) to keep things straightforward, readable, and clear.

### Important Distinctions between Instance vs Static methods

To recap, below are a few of the important distinctions between how we use and write _instance_ methods vs _static_ methods:

| Instance Methods                                                    | Static Methods                                                   |
| ------------------------------------------------------------------- | ---------------------------------------------------------------- |
| No keyword needed to define function                                | `static` keyword needed to define function                       |
| Called on the instance of the class                                 | Called directly on the class itself                              |
| Outputs or updates information related to the instance of the class | More commonly used for utility methods or alternate constructors |
| `this` refers to the specific object, or instance of the class      | `this` refers to the class itself                                |

## Why This Matters

Static methods contribute to the overall organization of our code. Again, our intent with object oriented programming is to create an _abstraction_ or metaphor for the problem domain we're addressing. Static methods provide us with another option when trying to keep things neat, tidy, and in line with our object design.

[math-functions]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math
