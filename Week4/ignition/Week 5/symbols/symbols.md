In your Ruby travels, you might have seen syntax like this:

```ruby
:name
```

These are known as **symbols**. Though they share commonalities with the `String`,
symbols are a different type of object entirely.

## Learning Goals

* Understand the difference between a symbol and a string
* Explore what can and cannot be done with a symbol
* Understand why a symbol would be used

### Symbols in Ruby

Symbols are the most basic Ruby object you can create. We use symbols as a means to identify **unique** sequences of characters. Because they are unique, they cannot be changed, replaced, or redefined.  Symbols don't contain values or objects, like variables do. Instead, they're used as a consistent name within code which can save both memory and time.

Symbols are created by putting a colon `:` before the object to work with.

Consider the following Array that represents the typical crew positions on a space flight.

```ruby
crew = [
  :captain,
  :first_mate,
  :second_mate,
  :navigator,
  :first_engineer,
  :info_systems_tech,
  :environmental_control_tech,
  :lead_maintenance,
  :first_medical,
  :first_food_ops
]
```

The code above articulates the contents of an average space flight. Because each role will _always be that role_ we can use symbols to represent each one. Throughout the life of our program, each role will exist only once no matter how many times it's called. No new objects must be created or stored when referencing a role.   

> Should they be stored as variables or hashes, `role_1 = "captain"` or `{role_1: "captain"}`, every mention of `role_1` would create a new object stored in memory.

We could represent adding additional roles to the crew using the "shovel" (`<<`) operator:

```ruby
crew << :combat_systems_officer
```

So, symbols are yet another grammatical tool we can use when designing our programs.
Let's experiment with symbols and explore their nuances in further detail.

Open a Pry session (`pry`, or `irb`) and try the following:

```ruby
:name.class
```

You'll see that `Symbol` instances have their own class, and therefore have different [behaviors](http://ruby-doc.org/core-2.3.0/Symbol.html)

```ruby
:name == 'name'
```

Given this returns `false`, you can see that string values are not equal to their symbolic counterparts.

```ruby
:name + :another_symbol
```

This should raise a `NoMethodError`. In fancy Computer Science terms, we say that symbols are **immutable**. All this means is that they cannot be changed, and therefore we can't manipulate them in this way.

### Like Strings, But Different

Put in its simplest terms, symbols are similar to strings, but they are not strings.
In this section, we'll explore how they are different.

Once symbols are declared, they cannot be modified. Recall how we can change, or mutate, an existing string.

```ruby
my_variable = "pine"
my_variable << "apple"
# changes the value of my_variable to "pineapple"
```

The example above changes the value of `my_variable`. The same shovel operator used for arrays can also be used to combine the values of strings.

Notice how that method is *not* available for `Symbol` instances.

```ruby
my_variable = :pine
my_variable << :apple
# raises NoMethodError
```

The code above results in a `NoMethodError`, because Ruby does not allow us to modify symbols.

### Symbols Generally Are Underscored

When a symbol represents a multiword string, we typically separate the words with an underscore. (Note that Ruby variable naming follows this convention as well!)
Consider the following, incorrect example.

```ruby
#causes a syntax error
:first mate
```

In the code above, the Ruby interpreter thinks we're representing the symbol `:first` and then a variable `mate`.
In order to represent a multiword symbol, we can use the underscore.

```ruby
:first_mate
```

### Symbols Are Constant and Exist Only Once In Memory

It can be helpful to briefly explore how variables are stored in the memory of a computer system.

Open up a pry session and invoke the following, identical lines:

```ruby
'a string'.object_id
'a string'.object_id
```

Though these strings are equal, they have different object ids.
This is Ruby's way of telling us that they exist in two different memory places, or addresses. Therefore, they are two distinct things to our computer.

Now, try the same thing with an identical symbol:

```ruby
:a_symbol.object_id
:a_symbol.object_id
```

Equivalent symbols always exist in the same memory space, because they are *always* the same object!
For this reason, symbols provide many speed and memory related performance benefits.

To drive home this point, imagine a street of vacant houses.
Every time we create a new string, we have to place each string in one of the homes on that street.
Eventually, if we're not careful, all of the houses will become occupied and
there will be no more room for the strings we create.
Even if the strings are identical, we still need to find a new home for each instance.
If we're using symbols, each unique symbol will only occupy one home,
making for more efficient use of the real estate.

### Switching From Strings to Symbols

Sometimes, we do want to perform type coercion on symbols, such as transforming them into strings. To continue with our crew example:

```ruby
crew = [
  :captain,
  :first_mate,
  :second_mate,
  :navigator,
  :first_engineer,
  :info_systems_tech,
  :environmental_control_tech,
  :lead_maintenance,
  :first_medical,
  :first_food_ops
]

random_crew_selection = crew.sample
puts "I will page #{random_crew_selection} to draft that report."
```

We can use standard **string interpolation** to change a symbol to a string.
Alternatively, we can call `to_s` on the symbol.

```ruby
:first_mate.to_s
```

### These Are Confusing. Why do They Exist?

### Symbols are Time-Saving

Internally, the interpreter interprets the symbol as a number, whereas strings are interpreted as strings.
Computers are generally better at keeping track of numbers than strings, so symbols take advantage of this fact. It is much faster for a computer to hunt down the requested symbol than it would be for its string counterpart.

### Symbols are Memory Efficient

We can use symbols to conserve memory usage.  As exemplified above, there will only ever be one instance of any symbol at runtime.  In this way, we avoid having to duplicate the same values a different memory address.

When we have a need to compare strings that will never change for the life of our programs, symbols provide the best, most performant option.

### Summary

You've already been introduced to the Array data type. There's a more complicated data type coming called a Hash, which *frequently* makes use of symbols.
