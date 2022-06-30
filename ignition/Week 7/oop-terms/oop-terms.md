This article is intended to be a quick reference sheet for common terms used when discussing object-oriented programming in JavaScript. You are not expected to memorize all of these immediately! We will go over some of these terms in detail in this week, but this is also intended to be used as a lookup resource throughout your coding journey.

## Key Terms

###### Abstract Class

A type of class that does not have objects instantiated from it (as compared to a Concrete Class). You would not create a `new` instance of this class.

###### Association

Objects are related (associated) to other objects: one object can have an _association_ with another.

###### Attribute

A piece of data or information that a class knows/keeps track of.

###### Class

A software abstraction of similar objects, a reusable template or blueprint from which objects are created.

###### Class Normalization

A process by which you reorganize the structure of your schema (what's stored in each specific class) in such a way as to improve how classes work together and their dependence on each other and to minimize or eliminate redundancy.

###### Composition

An OOP concept where one class uses object _association_ to reference and store objects from other classes as instance variables. A strong form of aggregation in which the “whole” is completely responsible for its parts and each “part” object is only associated to the one “whole” object.

###### Concrete Class

A class that has objects instantiated from it (as compared to an Abstract Class). You would create a `new` instance of this class.

###### Encapsulation

The concept of coupling and hiding information (data) within a set grouping of code and logic (such as a class or component). The data (_attributes_) within the class are _protected_ by only being made accessible outside of that class via methods specifically created for this purpose.

###### Inheritance

Represents “is a”, “is like”, and “is a kind of” relationships. When class “B” inherits from class “A”, it automatically has all of the attributes and operations that “A” implements (or inherits from other classes).

###### Instance

A single object is an instance of a class. An instance is created when you create a `new` instance of the class.

For example, `harryPotter` is an instance of the `Wizard` class.

###### Instantiate

To create a new instance of an object; we instantiate (create) `new` objects from classes.

###### Object

In the context of OOP, an object is an instance of a class. An object has state (data/information) and behavior (methods).

###### Persistence

Storing objects/data permanently (e.g., in a database), rather than just in memory.

###### Persistent object

An object that is saved to permanent storage.

###### Single inheritance

When a class directly inherits from only one class.
