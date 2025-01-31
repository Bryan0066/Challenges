### Getting Started

From your `challenges` folder, type the following command:

```
et get snow-shoveler
cd snow-shoveler
code .
```

All your work should be done in the `code.rb` file. You can run your code in the terminal with:

```
ruby code.rb
```

### Introduction

You'll be landing on an icy planet next week, and need to hire a space contractor to fly in and remove the snow from the landing pad. In order to estimate what this might cost you, you've decided to write a program to help
you build a quote.

In order to test your new program, the first quote you build will be for your own launch pad area.
The contractor charges clients by the cubic foot of snow. The launch pad is 8 ft wide and 20 ft long. The last snowstorm dropped 8 inches of snow in total.

Here is your initial pricing chart:

```no-highlight
0 - 49 cubic ft:  $20
50 - 149 cubic ft: $50
150 - 299 cubic ft: $100
300+ cubic ft: $150
```

### Problem Statement

Write a program that displays how many cubic ft of snow dropped
on a launch pad and how much it will cost for you to have the snow cleared out.

- cubic ft is measured: side X side X side
- when converting inches to ft make sure to use Floats

Example Output:

```no-highlight
Cubic Feet: 106.66666666666666
Quote Price: $50
```


### A Note on Edge Cases

What should happen if the amount of snow calculated is 49.4 cubic feet?
Should we charge $20 or $50?

This is a common scenario when solving problems with code. Oftentimes, it will work most of the time, but there will be a few select instances when it does not work as expected.  We call these **edge cases**.  Accounting for edge cases usually takes a bit more creative planning and problem solving.  In this scenario, we have an edge case that is not described by the pricing chart, and it is up to us to determine how to handle it.

A reasonable solution here is to round to the nearest cubic foot. Take a
look a the `round` method, which is defined on the
[Float class](http://ruby-doc.org/core-2.1.2/Float.html#method-i-round).


* You will need to utilize a complex `if` / `else` statement to set the
  appropriate price after the cubic feet is calculated.  Don't be afraid to use `elsif`!

