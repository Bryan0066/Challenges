As we've been learning how to write JavaScript classes, we have talked about ways to best separate our concerns; organize our code, state, and behavior; and handle for different needs and types of functionalities. All along, whether we've directly verbalized it or not, we've been implementing some _best practices_ for object-oriented programming in JavaScript! In this article, we will go over some of the high-level design concepts that we've been implementing: **coupling**, **cohesion**, and **encapsulation**.

### Why This Matters

It's important to learn not just how to _write_ code, but how to _talk_ about it! Being able to understand and apply the terms below will help you articulate the reasoning behind your code and walk through it with your peers in the industry. In particular, being able to speak eloquently about your code will be crucial in job interviews!

There are many different opinions on the best ways to write and organize your JavaScript code, but this article will review those design concepts generally agreed upon as being best practices in code development and organization.

## Coupling and Cohesion

Two of the design concepts we have been incorporating behind the scenes are those of **Coupling** and **Cohesion**. These two concepts can serve as guidelines for how to best scope and separate our different JavaScript classes.

#### Coupling

Coupling refers to how much one class knows about, and is tied to, another class. For example, if we have a `Pet` class and an `Owner` class, coupling refers to how closely we knit those two classes together. In this case, we wouldn't want the `Owner` class to be responsible for instantiating new `Pet`s in any of its methods - but we _could_ store a list of pets belonging to an owner inside of a `this.pets` array instance variable.

#### Cohesion

Cohesion refers to how much a class has a single, well-focused purpose. This is strongly related to the concept of a Separation of Concerns, as well as a very similar software engineering principle called the [_Single Responsibility Principle_][single-responsibility-principle]. While there are some distinctions between the two, both concepts concern the idea of making sure each class is only responsible for one job, one "responsibility", or one "concern". While Separation of Concerns can sometimes be a little more high-level and architectural, the Single Responsibility Principle tends to look at each individual object and make sure it's only holding logic for _one_ responsibility or idea. If we notice more than one responsibility emerging as an object evolves, we want to separate that logic into two or more objects.

#### Best Practices

When building an object-oriented program, we generally want our objects to be _loosely coupled and highly cohesive_. Many different design patterns and principles used widely in software development are based around this goal, such as the [Model-View-Controller pattern][model-view-controller]. If our objects are _highly cohesive_, we know that we are abiding by the Separation of Concerns pattern and the Single Responsibility Principle. We can trust that our objects are well-scoped, each taking on one core concern of our program and not being overloaded with extraneous logic. And so long as our objects are _loosely coupled_, we can trust that our objects are not overly dependent on each other. We should be able to make changes to one object without breaking the functionality of one, or many, other objects in our application.

The ability to create healthy coupling and cohesion between our objects relies on using good _encapsulation_, another buzzword on our list!

## Encapsulation

Encapsulation in OOP is the practice of storing and _protecting_ certain data, or state, inside of an object. In our JavaScript classes, this means that we will store our data, as attributes or instance variables, in our object, as well as any necessary methods and behaviors. Specifically, we will protect all of that information by only making some of the functionality _public_ for other classes to use, providing a safe interface to work with that object. You'll often hear this interface referred to as an "API", or "Application Programming Interface" - this simply refers to a set of rules set up for how to interact with this class via public functions.

So what can this actually look like? One fantastic way to practice encapsulation is to set up methods that are responsible for updating our state (instance variables). We've seen this in the past: for example, if we have an `Owner` class with a `this.pets` array, we may also set up an `adoptPet` method which is responsible for adding pets to our array, rather than just calling `this.pets.push` directly on our array anywhere outside of our class. One of the really important benefits of encapsulation is that it makes it easier to change our implementation later. Let's look at an example of why this would be easier with encapsulation.

Let's say we have a `Character` class that stores a character's `name` and their `title`.

```javascript
class Character {
  constructor(name, title) {
    this.name = name
    this.title = title
  }
}
```

Right now, our `Character` class allows us to create a character, and hand in a name and title for that character.

What if we want to update the title of our character? We could do something like the below:

```javascript
const bran = new Character('Bran Stark', 'The Broken')
bran.title = 'The Three-Eyed Raven'
```

We've directly updated the `title` attribute by using the built-in accessor for our `this.title` attribute. However, the concept of encapsulation actually argues that rather than accessing and updating our state directly via our attribute accessor, it is better to create a "public method" which is responsible for updating that title, by re-writing our code as follows:

```javascript
class Character {
  constructor(name, title) {
    this.name = name
    this.title = title
  }

  updateTitle(newTitle) {
    this.title = newTitle
  }
}

const bran = new Character('Bran Stark', 'The Broken')
bran.updateTitle('The Three-Eyed Raven')
```

Here, we can see that we are functionally having the same outcome, but we've "protected" our `title` attribute by giving the `Character` class responsibility for changing its value.

The benefit of this practice really comes if we want to change the functionality of the way we update our title. For example, let's say that we've decided that when a character obtains a new title, we don't want to REPLACE their old title, but instead add to it:

```javascript
class Character {
  constructor(name, title) {
    this.name = name
    this.title = title
  }

  updateTitle(newTitle) {
    this.title += `, ${newTitle}`
  }
}

const dany = new Character('Daenerys Targaryen', 'The First of her Name')
dany.updateTitle('Queen of the Andals and the First Men')
dany.updateTitle('The Unburnt')
dany.title
// "The First of her Name, Queen of the Andals and the First Men, The Unburnt"
```

If we had directly been updating the title using `character.title =` in all different parts of our code, we would have to change every single one of those parts of our code to instead have our new `character.title += ...` code. However, since we practiced good encapsulation and used an `updateTitle` method, we only have to change that _one_ section of our code, `updateTitle`, to have the new logic in it.

Encapsulation allows us to effectively practice _loose coupling and high cohesiveness_ between our objects. So long as our objects are well-encapsulated, anywhere that we interact with those objects outside of our class, we should be interacting with the _interface_ or _API_ we've created, rather than the state of our class directly. As such, we can safely make updates to our objects in one concrete place, without worrying that we'll be breaking the functionality wherever that object is interacted with elsewhere in our code.

#### Getters and Setters

Another common way to implement encapsulation is to use "getters" and "setters". We will not expect you to implement these just yet, but it's good syntax to be familiar with!

As you know, we have the ability to "get" and "set" attributes directly thanks to the "accessor" functionality of instance variables. That is to say, in the above example, we _could_ access `this.title` by calling it directly on our character:

```javascript
const tyrion = new Character('Tyrion Lannister', 'Master of Coin')
// GET the title
console.log(tyrion.title)
// 'Master of Coin'

// SET the title
tyrion.title = 'Hand of the King'
// GET again
console.log(tyrion.title)
// 'Hand of the King'
```

However, we've already learned that that's not best practice. As such, we have syntax and conventions available to even further protect our data, to make sure other developers know not to access it directly.

Conventionally, we can use an underscore("`_`") to indicate that something is meant to be _private_ to a class. We can do this with method names, and we can also do it with our instance variables:

```javascript
class Character {
  constructor(name, title) {
    this._name = name
    this._title = title
  }
}
```

This indicates to all other developers that we don't intend for those attributes to be _directly_ accessed outside of the class.

We already saw one way we can then provide access to update the title: using a "behavioral method", as we did with our `updateTitle` method in the example above. However, we also have what are called "getter" and "setter" syntax to expose only those functionalities we desire.

Let's say we wanted the user to be able to _get_, or _read_, the name of the character, but not update it. We could set up a "getter" as so:

```javascript
class Character {
  constructor(name, title) {
    this._name = name
    this._title = title
  }

  get name() {
    return this._name
  }
}
```

We've basically created a wrapper syntax around `this._name` to expose it to the public. The cool thing about `get` syntax is that we don't need to use the parentheses we usually need in order to invoke methods:

```javascript
console.log(tyrion.name)
// 'Tyrion Lannister'
```

One of the great aspects of "getters" is that we can set them up to be called, and return, whatever we want. What if we didn't want the public to be able to see just the name, but the full name and title? We could set up our getter like this:

```javascript
class Character {
  constructor(name, title) {
    this._name = name
    this._title = title
  }

  get fullName() {
    return `${this._name}, ${this._title}`
  }
}

console.log(tyrion.fullName)
// 'Tyrion Lannister, Hand of the King'
```

Likewise, we can use "setters" to allow public access to _set_, or _update_, our attributes. Our setters need to take in an argument, so that they know what to update to, and use the `=` sign just like our unprotected writing did. That implementation and usage looks like this:

```javascript
class Character {
  constructor(name, title) {
    this._name = name
    this._title = title
  }

  set title(newTitle) {
    this._title = newTitle
    return this._title
  }
}

tyrion.title = 'Hand of the Queen'
```

JavaScript provides us with getter and setter syntax so that we can protect our data (typically using the convention of including an underscore "`_`") and still set up our classes to use the same kind of syntax as we are used to to update or read our data.

### Summary

In this article, we discussed many of the best practices used in object-oriented programming in JavaScript: coupling, cohesion, and encapsulation. Continuing to use these skills and patterns to your advantage will make your code scalable and stable as your application grows.

You will often have to ask yourself how to best set up and manage your objects. You'll gain some instinct here as you do more and more object-oriented programming: you will start to recognize when a class feels too big or like it's doing too many things (and not adhering to the _Single Responsibility Principle_!). As you begin, however, it will take some extra mindfulness to make sure you're separating your concerns effectively. Remember to think of the metaphor of classes: that we can relate our JS classes to objects or concepts in the real world, such as pets and owners. When your metaphorical object feels overloaded, that's a good sign that you may need to extract some of the logic out into its own object, sometimes called a "subordinate object". In our pet/owner example, storing the owner's name and other data or behavior specific to the human inside of the `Pet` class leads us to realize that we may just need a second class - our `Owner` class. Since our `Owner` keeps track of an array of (potentially multiple) `pets`, we would consider the `Pet` class a subordinate object to our `Owner` class.

[single-responsibility-principle]: https://en.wikipedia.org/wiki/Single-responsibility_principle
[model-view-controller]: https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller
