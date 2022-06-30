We have the ability to make lists of things in many different programming languages. In JavaScript, we use `arrays` to keep track of our lists. These `arrays` can keep track of any assortment of values.

### Learning Goals

- Build a JavaScript array
- Explore indexing in arrays
- Use methods to add items to, remove items from, and otherwise manipulate arrays

## `Arrays` = Ordered Lists

An array is just an ordered list. You can add items to the list. You can remove items from the list.
And, because our list exists in the magical realm of the computer, we can do plenty of crazy and awesome things with the items in the list:
[reverse](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse) their
order,
replace a specific subset of the items,
[sort](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort) the items, and much more!

## Array Basics

You will learn the most in this lesson by typing in the examples provided. Open up the JavaScript console in your browser (command + opt + j) and follow along.

### Creating Arrays

```no-highlight
> const myArray = new Array
undefined
> myArray
[]
```

Notice that when we called `myArray;`, we received back opening and closing
square brackets: `[]`. Programmers use lists, __\*ahem\*__, arrays, all the
time. A set of empty brackets (`[]`) is the shorthand notation for an empty array.

`new Array` is just one way to create a new array -- we could also just set our new variable equal to `[]`. This is called *array literal notation*, and it's the preferred approach:

```no-highlight
> const myArray = []
undefined
> myArray
[]
```

An empty array is like a blank canvas. Let's create a new array with some tasks
for us to accomplish and assign the new array to a variable named `toDo`:

```no-highlight
> const toDo = ['fuel the rocketship', 'bring games', 'learn about arrays']
undefined
> toDo
["fuel the rocketship", "bring games", "learn about arrays"]
```

#### Array Length

We can find out how many items are in our array by accessing the `length` property.

```no-highlight
> toDo.length
3
```

### Accessing Items in Arrays

Arrays are a little bit funny about the way we access items. We can access an
item in the array by providing an `index`, but we need to remember that **indices start at zero**. We can ask an
array what exists at any particular index by passing it a number in square
brackets. For example:

```no-highlight
> toDo[1]
// what happens here?
```

This will result in us getting the *second* item in our array.

#### Indexing Arrays

Array indices start at zero, and go up to the length of the array minus one.
`toDo[0]` will return the first item in the array.
Because `toDo` contains three items, `toDo[2]` gives us the last item in the array.

We can visually represent our array like so:

```no-highlight
        +-----------------+-----------+-----------+
        |                 |           |           |
        |   "fuel         |   "bring  |  "learn   |
array:  |    the          |   games"  |   about   |
        |    rocketship"  |           |  arrays"  |
        |                 |           |           |
        +-----------------+-----------+-----------+
index:          [0]             [1]         [2]
```

What happens if we try to access `toDo[3]` in our array?

```no-highlight
> toDo[3];
undefined
```

We get `undefined`, which is JavaScript's way of saying that nothing is there.

### Adding Items

#### `push`

Our array of tasks to do is growing. Let's add a new task to the _end_ of our list using the `push` method:

```no-highlight
> toDo.push('read the news')
4
> toDo
["fuel the rocketship", "bring games", "learn about arrays", "read the news"]
```

The value `4` that you see in the console is the return value for this method. `push` will return the new length of the array we modified.

#### `unshift`

What if we have a really important task that belongs at the _beginning_ of our
list? Well, via the `unshift` method, we can add items to the front of the
array.

```no-highlight
> toDo.unshift('pay the rent!')
5
> toDo
["pay the rent!", "fuel the rocketship", "bring games", "learn about arrays", "read the news"]
```

Similar to `push`, `unshift` will also return the new length of the array we modified.

#### `splice`

What if after I learn about arrays, I want to learn more about JavaScript? Well, we can insert a task into our ordered list of things to do! `splice` can be used to insert new items into an array, remove items, or replace existing items with something different.

Let's first see how we would add a new element. To add an element to our array, `splice` will take at least 3 arguments: the index of the position to insert the item, the number of items to delete, and the new item to insert.

```no-highlight
> toDo.splice(4, 0, 'learn more JavaScript')
[]
> toDo
["pay the rent!", "fuel the rocketship", "bring games", "learn about arrays", "learn more JavaScript", "read the news"]
```

This reads as: at index 4, delete 0 items, and insert the string 'learn more JavaScript'. 

`splice` allows us to also add multiple items by providing more arguments. Say we forgot that _before_ we can fuel the rocketship we need to check for safe weather conditions and inspect the fuel gauge.

```no-highlight
> toDo.splice(1, 0, 'check weather conditions', 'inspect the fuel gauge')
[]
> toDo
["pay the rent!", "check weather conditions", "inspect the fuel gauge", "fuel the rocketship", "bring games", "learn about arrays", "learn more JavaScript", "read the news"]
```

You may notice an empty array is returned after we executed `splice` in these examples. This method will return an array with the items that have been removed, so when no items have been removed it will return to us an empty array.

**Note:** We can also use `splice` to remove or replace items in an array. We'll see this in action later in this article!

### Combining Arrays

We can combine arrays using the `concat` method:

```no-highlight
> const toDo1 = ['fuel the rocketship', 'bring games']
> const toDo2 = ['learn about arrays', 'read the news']
> const toDos = toDo1.concat(toDo2)
> toDos
["fuel the rocketship", "bring games", "learn about arrays", "read the news"]
```

Calling the `concat` method on `todo1` returns a NEW array that is the combination of `todo1` and `todo2` that we are saving to a new variable called `toDos`.

Notice that `concat` did **not** change (or *mutate*) our original arrays `toDo1` or `toDo2`.
We call this kind of method *non-mutative*.
If we want to use the result of a non-mutative method like `concat` later in our code, we need to assign its return value to a new variable (`toDos` in our example above).

One more note about `concat`: it can also take a string as input to add just one new item! See below:

```no-highlight
> toDos
["fuel the rocketship", "bring games", "learn about arrays", "read the news"]
> toDos.concat('another task')
["fuel the rocketship", "bring games", "learn about arrays", "read the news", "another task"]
```

This is also *non-mutative*, however, so if we now look at `toDos` again without having saved our output to a variable, we get our original array back:

```no-highlight
> toDos
["fuel the rocketship", "bring games", "learn about arrays", "read the news"]
```

*Ask yourself*: Referring back to the methods we learned above, are `push`, `unshift`, and `splice` mutative or non-mutative?

### The `indexOf` Method

What if I want to find out the location of an item in my array of things to do?
The `indexOf` method does that for us:

```no-highlight
> toDo.indexOf('pay the rent!')
0
> toDo.indexOf('read the news')
5
```

**Note:** This method will return the index of the _first_ element that matches what we're searching for.

```no-highlight
> const animals = ["zebras", "lions", "giraffes", "lions", "gorillas"]
> animals.indexOf("lions")
1
```

If there are no items that match, `-1` is returned.

```no-highlight
> animals.indexOf("leopard")
-1
```

### Reassigning Items in an Array

What if I don't need to *bring* games, I need to *build* new video games for my crew? We can reassign specific elements in the
array like so:

```no-highlight
> toDo[2] = 'build games'
"build games"
> toDo
["pay the rent!", "fuel the rocketship", "build games", "learn about arrays", "learn more JavaScript", "read the news"]
```

### Removing Items

#### `shift`

Fast forward.
It is the future, and we have accomplished some of our tasks.
We paid the rent and fueled the rocketship.
Let's start crossing items off of our virtual list.

First, refresh your terminal, and then reassign the `toDo` variable.

```no-highlight
> const toDo = ['pay the rent!', 'fuel the rocketship', 'build games', 'learn about arrays', 'learn more JavaScript', 'read the news']
```

Now let's use `shift` to remove the first array item:

```no-highlight
> toDo.shift()
"pay the rent!"
> toDo
["fuel the rocketship", "build games", "learn about arrays", "learn more JavaScript", "read the news"]
```

We can see that `shift()` both removes an item from our array and gives it *back* to us as our return value! We could assign this return value to a new variable if we wanted to use it later. Let's use `shift` again to remove fueling the rocketship from our list and save it to a variable:

```no-highlight
> const completedTask = toDo.shift()
undefined

> toDo
["build games", "learn about arrays", "learn more JavaScript", "read the news"]

> completedTask
"fuel the rocketship"
```

**Note:** Now that we've removed these items from our array, the index values update as well because this method is _mutative_.

Before calling `shift` in the last example:
```no-highlight
        +--------------+----------+-----------+-------------+----------+
        |              |          |           |             |          |
        |  "fuel       |  "build  |  "learn   |  "learn     |  "read   |
array:  |   the        |  games"  |   about   |   more      |   the    |
        |  rocketship" |          |  arrays"  | JavaScript" |   news"  |
        |              |          |           |             |          |
        +--------------+----------+-----------+-------------+----------+
index:        [0]          [1]         [2]         [3]           [4]
```

After calling `shift`:
```no-highlight
         +-----------+        +---------+---------+-------------+--------+
         |           |        |         |         |             |        |
         | "fuel     |        | "build  | "learn  | "learn      | "read  |
return:  |  the      | array: |  games" |  about  |  more       |  the   |
         |rocketship"|        |         | arrays" | JavaScript" |  news" |
         |           |        |         |         |             |        |
         +-----------+        +---------+---------+-------------+--------+
                        index:    [0]       [1]       [2]      [3]
```

The `shift` method allows us to remove an item from the front of our array.
Imagine all of the items being `shift`ed to the left by one place, with the
first item being the return value.

#### `pop`
The `pop` method removes and returns the last item from our array.

```no-highlight
> toDo.pop()
"read the news"

> toDo
["build games", "learn about arrays", "learn more JavaScript"]
```

You can think of `pop` as the opposite of `push`, since
`push` adds to then end of the array and `pop` removes from the end of the array.
Meanwhile, `unshift` and `shift` are opposites too, except that they operate on the
front of the array. To use an analogy: `push` is to `pop` as `unshift` is to
`shift`. Now you're talking like a programmer!


#### `splice`

**Note:** You're not crazy -- we previously used `splice` to _add items_ to an array. Let's see how we can also use this method to remove or replace items.

Sometimes we want to remove an item that's not necessarily at the beginning or end of the array. To do this, we first need to find its index. Then, we can use `splice` to remove it. In this context, `splice` takes one or two arguments: the index of the item we want to remove and the number of items we want to remove. Here, we just want to remove one item, so we run the following code:

```no-highlight
> const toDo = ['build games', 'learn about arrays', 'learn more JavaScript', 'read the news', 'be awesome']
> const itemIndex = toDo.indexOf('read the news')
> toDo.splice(itemIndex, 1)
["read the news"]
> toDo
["build games", "learn about arrays", "learn more JavaScript", "be awesome"]
```

If we had called `toDo.splice(itemIndex)` with just one argument instead, it would have removed everything onward beginning at index for `itemIndex` (`'read the news', 'be awesome'`), leaving us with `["build games", "learn about arrays", "learn more JavaScript"]`.

The last thing we can do with `splice` is replace items in our array. Now that we have some new knowledge on JavaScript arrays, we want to update our task "learn about arrays" to instead "practice with arrays". We _also_ want to make sure we complete the System Check, so let's add that to our list as well.

```no-highlight
> const itemIndex = toDo.indexOf("learn about arrays")
> toDo.splice(itemIndex, 1, "practice with arrays", "complete System Check")
> toDo
["build games", "practice with arrays", "complete System Check", "learn more JavaScript", "be awesome"]
```

We first found the index of the item we want to replace. The first argument to `splice` is that index we want to start at. In the second argument, we specify that we want to remove 1 item from the array (this will point to the item "learn about arrays"). The next 2 string arguments are the items we want to add that will replace the item we're removing. After we invoke the `splice` method, the item we removed should be returned in the console `["learn about arrays"]`. When we now check our `toDo` list, we should see our 2 new items have been added and replaced the item we removed.


### Summary

We've seen just a small number of the methods we have available to us for working with arrays.
Remember that it's not necessary to commit all of these methods to memory or to have an immediate command of these functions. Just know that they
exist and that you can find them in the
[JavaScript docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
if (when!) you need one of them in the future.

A final important note: the arrays we've looked at here have contained strings as items, but arrays can hold most anything:
integers, real numbers, or even other arrays!
