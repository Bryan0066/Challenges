In this article, we will investigate some of the limitations of JavaScript's object-literal notation, and further review the concepts of Object-Oriented programming and JavaScript's ES6 class syntax.

## Learning Goals

- Demonstrate the shortcomings of object-literal notation.
- Define the blueprints for a custom type of object using a **class**.
- Dive deeper into the idea of **Object-Oriented Programming**, and how it is implemented in the JavaScript language.

### Modeling Ships with Objects

Here is an example of one way to model a ship in the JavaScript programming language.

```javascript
const ship = {
  name: 'Serenity',
  captain: 'Malcolm Reynolds',
  captainsAnnouncement() {
    return `${this.name} will be captained by ${this.captain} for the flight.`
  },
  launchShip() {
    return `${this.name} has launched into orbit!`
  }
}

console.log(ship.captainsAnnouncement())
// 'Serenity will be captained by Malcolm Reynolds for the flight.'
console.log(ship.launchShip())
// 'Serenity has launched into orbit!'
```

We have created one `Ship` object with the following properties and methods: `name`, `captain`, `captainsAnnouncement()`, and `launchShip()`.

If we wanted to create another `Ship` object, we could simply copy and paste, and change some values:

```javascript
const ship2 = {
  name: 'Millennium Falcon',
  captain: 'Han Solo',
  captainsAnnouncement() {
    return `${this.name} will be captained by ${this.captain} for the flight.`
  },
  launchShip() {
    return `${this.name} has launched into orbit!`
  }
}

console.log(ship2.captainsAnnouncement())
// 'Millennium Falcon will be captained by Han Solo for the flight.'
console.log(ship2.launchShip())
// 'Millennium Falcon has launched into orbit!'
```

This is a valid solution. However, what if we needed to model an entire fleet? We would end up with code that was quite a bit repetitive. Also, if we wanted to add some functionality to the concept of a `Ship` object, we would have to add it **in every place** we defined one. This violates a core principle of skilled programming: ["Don't repeat yourself (DRY)."](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)

A **Class** gives us the ability to define a type of object. Using JavaScript classes, we can factor out the common elements of our `Ship` objects and create a reusable blueprint.

```javascript
// ES6 Class Syntax

class Ship {
  constructor(name, captain, fuel) {
    this.name = name
    this.captain = captain
    this.fuel = fuel
  }
}

const ship = new Ship('Serenity', 'Malcolm Reynolds', 100)

console.log(ship.name) // 'Serenity'
console.log(ship.captain) // 'Malcolm Reynolds'
console.log(ship.fuel) // 100
```

`new Ship('Serenity', 'Malcolm Reynolds', 100)` states that we would like to create a new `Ship` object, with the name of `'Serenity'`, who has a captain of `'Malcolm Reynolds'`, and a fuel supply of `100`.

The statement `new Ship('Serenity', 'Malcolm Reynolds', 100)` invokes the `Ship` class and creates an empty object based on the `Ship` blueprint. Once the object is created, the `constructor` method takes in the arguments `('Serenity', 'Malcolm Reynolds', 100)` and assigns them as name, captain, and fuel properties of the `Ship` object. The object is then returned and stored in the variable we provided: `ship`.

So what's happening with the `this` keyword in our constructor? Here, we're setting up _instance variables_, using the keyword `this`. Before these instance variables were assigned, `name`, `captain`, and `fuel` were simply local variables that were scoped to only our constructor method. But by setting them up as _instance variables_ using `this`, we're allowing those variables to be accessible anywhere else within other methods in our class, as well as outside of our class. We can see that we automatically have the ability to _read_ our instance variables, as we do when calling `ship.name` in our `console.log`.

The simple formula to remember here is this:

```no-highlight
new ClassName(arguments)
// ^ returns a new object built from the ClassName blueprint.
// It calls the constructor method of that blueprint
```

Now if we want to create another `Ship` object, we can simply call `new Ship` again. Much more DRY.

```javascript
const ship2 = new Ship('Millennium Falcon', 'Han Solo', 10)

console.log(ship2.name) // 'Millennium Falcon'
console.log(ship2.captain) // 'Han Solo'
console.log(ship2.fuel) // 10
```

We can even set up a default value for our instance variables like so:

```javascript
class Ship {
  constructor(name, captain, fuel) {
    this.name = name
    this.captain = captain
    this.fuel = fuel || 200
  }
}
```

Now if we create a ship and don't pass in an argument for `fuel`, it will assign `this.fuel` as `200` by default.

```javascript
const ship3 = new Ship('Heart of Gold', 'Zaphod Beeblebrox')

console.log(ship3.name) // 'Heart of Gold'
console.log(ship3.captain) // 'Zaphod Beeblebrox'
console.log(ship3.fuel) // 200
```

### Adding Behavior

You may have noticed that our class is missing the `captainsAnnouncement` and `launchShip` methods from before. We can add **behavior** to our objects by defining these methods in our class blueprint.

```javascript
class Ship {
  constructor(name, captain, fuel) {
    this.name = name
    this.captain = captain
    this.fuel = fuel
  }

  captainsAnnouncement() {
    return `${this.name} will be captained by ${this.captain} for the flight.`
  }

  launchShip() {
    return `${this.name} has launched into orbit!`
  }
}
```

We can now interact with these "ship objects" as we did earlier in our program.

```javascript
const ship = new Ship('Serenity', 'Malcolm Reynolds', 100)
console.log(ship.captainsAnnouncement())
// 'Serenity will be captained by Malcolm Reynolds for the flight.'
console.log(ship.launchShip())
// 'Serenity has launched into orbit!'
```

### Object-Oriented Programming

The idea of **Object-Oriented Programming, or OOP**, exists as a way for us to more easily model the physical world, within the realm of software. It gives us the power to describe code using the language of everyday things. It allows us to wrap up state and behavior (data and functions), into reusable pieces of code.

One important aspect to keep in mind is that, to use OOP properly, we should borrow the real-world established terminology of the objects we are trying to model.

Let's say we're building a banking application. Because people have been balancing accounts for millennia, a vocabulary _already exists_ that will help us model this system.

We would need to be familiar with the following terms **before** we even started writing code:

- Balance - The amount of money (or debt) in a bank account
- Transaction - An event that adds or removes funds from an account
- Credit - Money added to an account
- Debit - Money removed from an account

We wouldn't want to create our own identifiers for that checkbook class. money_entered, money_amounts, etc, are unnecessary when common vocabulary already exists. Naming decisions, as always, are an important part of writing great and understandable code.

OOP is a way of **thinking**, as much as it is a way of coding. Through practice, you will become better at using this process to its full potential.

### External Resources

- [Introduction to Object-Oriented JavaScript - MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Introduction_to_Object-Oriented_JavaScript#The_class)
- [ES6 Classes - Google Chrome](https://googlechrome.github.io/samples/classes-es6/)
- [JavaScript Factory Function vs. Constructor Functions vs. Classes](https://medium.com/javascript-scene/javascript-factory-functions-vs-constructor-functions-vs-classes-2f22ceddf33e)
