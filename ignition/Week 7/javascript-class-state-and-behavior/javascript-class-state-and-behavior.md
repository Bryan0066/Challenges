Object-Oriented Programming (OOP) is a way of thinking about and designing our code. It allows us to structure our software in the language of the problem domain. OOP is also an organizational tool. It allows us to describe our system using different
_classes_ or types of objects, which we can then implement in **separate files**. Classes are a key concept of object-oriented design. They allow us to define the **state** and **behavior** which objects of that class will store and
exhibit.

## Learning Goals

* Learn how to define and interact with properties that store **state**.
* Learn how to define and interact with properties that store **behavior**.

### Introduction

Both state and behavior are stored as **properties** of a JavaScript object. A **property** is simply a key/value pair belonging to a JS object. What is unique to JavaScript however, is that the *value* in that key/value pair can also point to a method, which we will touch on later.

It's important to note that ES6 classes are largely (although not entirely) what
we call _syntactic sugar_ on top of previously existing JavaScript functionality.
That is to say, we're learning a new way to organize our JavaScript code in the
form of `class`es, but under the hood, the functionality is a lot of what we're
already familiar with from learning about `objects` as a data structure: among
other things, we're still working with `properties` and the `this` keyword in our classes!

Consider this example. Lets say we wanted to program a JavaScript spaceship. A spaceship might have attributes (aspects of its state) such as color and wingspan. That spaceship might also have certain behaviors (in the form of methods) such as flying, shooting and sonar-tracking. If I wanted to check what color a certain spaceship was, I would check its `color` property. If I wanted to see how it flies, I would check its `flying` property. Both **state** and **behavior** belong to the spaceship as **properties**.

### Storing State

**State** is the information we would like an object to keep track of. Think of state as information the object knows about itself.

> *NOTE: Sometimes properties that store state are also known as attributes*.

Let's take a look at what state an astronaut class might need to store:

```javascript
class Astronaut {
  constructor(name, yearsActive) {
    this.name = name
    this.yearsActive = yearsActive || 0
    this.skills = []
  }
}
```

The class defines a blueprint for building `Astronaut` objects. Right now our class is just describing the state of a Astronaut. We see here that objects of the `Astronaut` type will keep track of their `name`, `yearsActive`, and an array of `skills`. The skills property is an empty array when a astronaut is created, and does NOT have a corresponding argument like `name` and `yearsActive`. As you have observed throughout your learning, this skills array can be populated pretty quickly (and we will do so in the next section)!

It's important to note that we're using the `this` keyword here to create _instance  variables_: variables that will be accessible to us through the entire _instance_ of this class, or single astronaut _object_. Originally, when we take our `name` variable in as an argument to our constructor, this variable is _only_ accessible within, or scoped to, the `constructor` method itself. But we want to be able to tie that value to our object, and access it both outside of, and in other methods inside of, our class! By including the code `this.name = name`, we're setting up that value as a property in our object. Within classes, we can call this an _instance variable_ of our class -- a variable tied to that particular _instance_ of our class.

How do we create an instance of an `Astronaut`? We use the `new ClassName` syntax to
construct a new object from the class blueprints.

```javascript
const aubrey = new Astronaut('Aubrey')  // Create a new astronaut named 'Aubrey' with no experience
const dorothy = new Astronaut('Dorothy', 5)  // Create a new astronaut named 'Dorothy' with 5 years of experience
```

Both `aubrey` and `dorothy` keep track of the same properties. However, those property's values are distinct from object to object:

```javascript
console.log(`${aubrey.name} is an astronaut and has ${aubrey.yearsActive} years of experience.`)
//=> Aubrey is an astronaut and has 0 years of experience.
console.log(`${dorothy.name} is an astronaut and has ${dorothy.yearsActive} years of experience.`)
//=> Dorothy is an astronaut and has 5 years of experience.
```

Here, we have shown an example of interacting with an object built from a class
definition. We can expect all objects built from the `Astronaut` class
blueprints to keep track of the same attributes (`name`, `yearsActive`, and `skills`).

### Modifying Object Properties

Since `name`, `yearsActive`, and `skills` are all properties that store state, we can change them as we see fit. For example, Aubrey might actually prefer also using her middle name.

```javascript
aubrey.name = 'AubreyLynn'

// what is the output of the next line?
console.log(`${aubrey.name} is an astronaut and has ${aubrey.yearsActive} years of experience.`)
```

### Adding Behavior

Perhaps Dorothy has now added a new skill to her repertoire. As the creators of
this class, we know that `skills` is stored as an array. Ordinarily, we could
simply call the `push()` method on the `skills` array to add a new skill:

```javascript
dorothy.skills.push('Alien Tracking')
```

However, this is an opportunity to use _metaphor_ to describe the action of learning a new skill.

```javascript
class Astronaut {
  constructor(name, yearsActive) {
    this.name = name
    this.yearsActive = yearsActive || 0
    this.skills = []
  }

  learnSkill(skillName) {
    this.skills.push(skillName)
  }
}

const dorothy = new Astronaut('Dorothy')
dorothy.learnSkill('Alien Tracking')
```

Astronauts now have a `learnSkill()` behavior, defined as a method (or
function) on the Astronaut class. Compare this to having to
"push the Alien Tracking skill onto the skills array." As a user of this class,
how would you prefer to interact with objects of this type? As an outsider reading
this code, which seems more intuitive to read for your English-speaking human brain
(instead of "translating" to computer-speak)?

Being able to call `learnSkill()` on a `Astronaut` object has more semantic
weight. We are working with astronauts (or a computer's representation of
them). Metaphorically, it makes more sense for a astronaut to "learn a skill,"
than to "push a string into their skills array."

Being able to identify behaviors for the interface you are building, and name
them appropriately, is an important skill to practice and develop. This way,
programming with objects becomes a way to clearly communicate intent
with other developers.

### Adding Experience

Another useful method here would be the ability to increment the number of years
an astronaut is active when they celebrate their workiversary.

```javascript
class Astronaut {
  constructor(name, yearsActive) {
    this.name = name
    this.yearsActive = yearsActive || 0
    this.skills = []
  }

  learnSkill(skillName) {
    this.skills.push(skillName);
  }

  celebrateWorkiversary() {
    console.log('Party!');
    this.yearsActive += 1;
  }
}

const dorothy = new Astronaut('Dorothy', 5);
console.log(dorothy.yearsActive);
//=> 5
dorothy.celebrateWorkiversary()
//=> Party!
console.log(`${dorothy.name} is an astronaut and has ${dorothy.yearsActive} years of experience.`)
//=> Dorothy is an astronaut and has 6 years of experience.
```

Being able to update the information an object knows about itself, via methods
named after behaviors exhibited by the object, is a key idea of OOP and
interface building.

Specifically, the kind of methods we're declaring here are called _instance methods_. This is because they are methods that are called specifically one instance of the class, as we see when calling `celebrateWorkiversary()` directly on our `dorothy` object. Instance methods impact that one particular object specifically (this will change the `yearsActive` for `dorothy`, but not for `aubrey`!) Their output may also change specific to that particular instance (as we will see an example of below).

### Determining Experience

Based on the number of years an astronaut has been active, we can determine
their level of experience.

```javascript
class Astronaut {
  constructor(name, yearsActive) { ... }
  learnSkill(skillName) { ... }
  celebrateWorkiversary() { ... }

  jobTitle() {
    const level = ''
    if (this.yearsActive < 2) {
      level = 'Junior'
    } else if (this.yearsActive >= 2 && this.yearsActive < 5) {
      level = 'Midlevel'
    } else {
      level = 'Senior'
    }
    return `${level} Astronaut`
  }
}

console.log(`${dorothy.name} is a ${dorothy.jobTitle}.`)
//=> Dorothy is a function jobTitle() { ... }.
```

Oops, there is something wrong here! Dorothy is not a `function jobTitle() { ... }`! We do not see a job title, but rather we see function definition output instead!

To fix this, we need to _invoke_ the method (with `()`) in order to get its return value.

```javascript
console.log(`${dorothy.name} is a ${dorothy.jobTitle()}.`)
// => Dorothy is a Senior Astronaut.
```

This illustrates the final point of this lesson. Even though it does not appear to be syntactically, `jobTitle` is a property. Instead of that property storing a string or an integer value, it stores a function definition value! Since the property stores a function, we can consider this property part of the **behavior** of this class.
What we need to be careful to do when calling on this function property is to _invoke_,
or run, the function when we're ready to, using the parentheses as so: `dorothy.jobTitle()`.

### Summary

In this article, we explored how to define state and behavior on our objects.
Using object properties, we can define data that an object should track. Using properties to store functions, we can define behaviors to utilize, modify, and report what an object knows about itself.
