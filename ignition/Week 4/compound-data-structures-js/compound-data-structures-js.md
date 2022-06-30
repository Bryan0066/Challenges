So far, many of the programs we've written have been a bit contrived. Now that we have the power of arrays and objects, we can combine their strengths to make more powerful, functional software.

## Learning Goals

- Read and manipulate complex data structures, particularly
  - arrays of arrays and
  - arrays of objects
- Learn how to access specific elements within complex data structures

### Set Up

To follow along with this article, open up the Developer Tools in your browser and type the provided code into the console.

### Two-Dimensional Arrays (Arrays of Arrays)

If you're like us, most of the games you loved as children involve gameboards of some kind, like checkers, chess, or [tic-tac-toe][tic-tac-toe-article]. If we wanted to represent the rows and columns on these gameboards with JavaScript data types, we'd most likely want to use a **two-dimensional array**, otherwise known as a **nested array** or an array of arrays.

Let's imagine the following state of a tic-tac-toe board.

```no-highlight
|x|-|o|
|-|x|o|
|-|-|x|
```

Let's assemble this board by first creating the rows. Using what we know of arrays, we could represent the top row with the following data structure:

```javascript
const topRow = ["x", null, "o"]
```

Similarly, we could represent the middle and bottom rows as

```javascript
const middleRow = [null, "x", "o"]
const bottomRow = [null, null, "x"]
```

Next, let's place all of these rows in another array, creating a two-dimentional array:

```javascript
const board = [topRow, middleRow, bottomRow]
```

#### Accessing Data in a Two-Dimensional Array

Previously, we've seen that we can use the syntax `myArray[i]` to access the ith element of the array `myArray`. Let's see how we can expand on this syntax to access an element of a two-dimensional array:

```javascript
// board[rowIndex][columnIndex]

board[0][0] // top-left corner of the grid
=> 'x'
board[0][2] // top-right corner of the grid
=> 'o'
board[2][0] // bottom-left corner of the grid
=> null
board[2][2] // bottom-right corner of the grid
=> 'x'
board[1][1] // middle of the grid
=> 'x'
```

#### Making a Zelda Dungeon

While gameboards are fun, the staff at Launch Academy are classic video game fanatics. Most early games were two-dimensional, meaning that a player could move to left/right and up/down on the screen.

One of our favorites was **[The Legend of Zelda][zelda-wikipedia]**. In Zelda, you star as the game's protaganist, Link, who is determined to save the Princess Zelda from the evil thief, Ganon. To do so, you must navigate through a series of dungeons by collecting keys that unlock doors. Ultimately, the dungeon leads you to a final enemy to defeat, taking you one step closer to reaching the princess.

Using two-dimensional arrays, we can model dungeon screens like this one:

![Zelda Grid: Courtesy of Techrything][zelda-grid]

If you count the squares depicted, we have a 7x12 grid: seven squares high and twelve squares wide. If we imagine an empty room of the same size, we can represent it visually as so:

```no-highlight
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
```

In terms of data structures, we could say that the room is made up of an array of rows, with each row consisting of an array of columns. It would look like this:

```javascript
const dungeonScreen = [
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null]
]
```

Based on the screenshot and noting the open door, Link could enter at the 6th or 7th column of the bottom row. In our first movement, we could place Link in either of those places. Let's assume the 6th column for now.

```javascript
// refresh your browser to remove the previous dungeonScreen

const dungeonScreen = [
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, "L", null, null, null, null, null, null]
]
```

Notice the presence of the 'L' at the bottommost row to represent Link. Alternatively, we could assign Link to appear there after initializing the grid.

```javascript
// refresh your browser to remove the previous dungeonScreen

const dungeonScreen = [
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, "L", null, null, null, null, null, null]
]

// board[rowIndex][columnIndex]
dungeonScreen[6][5] = "L"
```

Using loops, we could initialize the grid differently:

```javascript
// refresh your browser to remove the previous dungeonScreen

const dungeonScreen = []
for (let rowIndex = 0; rowIndex < 7; rowIndex++) {
  dungeonScreen[rowIndex] = []
  for (let columnIndex = 0; columnIndex < 12; columnIndex++) {
    dungeonScreen[rowIndex][columnIndex] = null
  }
}

dungeonScreen[6][5] = "L"
```

In the example above, we're initializing 7 rows with 12 cells of data each. We start by creating a blank array and then append a row of 12 entries in what's referred to as a **nested loop**.

If we wanted to place the lava properly, represented by the character `=`, we could introduce some flow control.

```javascript
// refresh your browser to remove the previous dungeonScreen

const dungeonScreen = []
for (let rowIndex = 0; rowIndex < 7; rowIndex++) {
  dungeonScreen[rowIndex] = []
  for (let columnIndex = 0; columnIndex < 12; columnIndex++) {
    if (rowIndex === 2) {
      dungeonScreen[rowIndex][columnIndex] = "="
    } else {
      dungeonScreen[rowIndex][columnIndex] = null
    }
  }
}

// debugger
// when you hit this debugger, type in dungeonScreen and hit enter, expanding the dropdown, to see the output

dungeonScreen[6][5] = "L"
```

This would result in the following graphical representation, which is more true to the screenshot of Link moving through the dungeon.

```no-highlight
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|=|=|=|=|=|=|=|=|=|=|=|=|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|L|-|-|-|-|-|-|
```

Because we know the lava to exist horizontally in row 3, we can use the `rowIndex` of 2 to fill the grid with lava.

Working with the screenshot of Zelda provided, if we were to place the key with character 'K' and each of the two mummy enemies with character 'M', how could we modify the `dungeonScreen` variable to represent the presence of these graphical elements?

#### ***SOLUTION!***

```javascript
dungeonScreen[4][8] = "K"
dungeonScreen[1][4] = "M"
dungeonScreen[0][10] = "M"
```

The resultant array `dungeonScreen` would appear as:

```javascript
;[
  [null, null, null, null, null, null, null, null, null, null, "M", null],
  [null, null, null, null, "M", null, null, null, null, null, null, null],
  ["=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "=", "="],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, null, null, null, "K", null, null, null],
  [null, null, null, null, null, null, null, null, null, null, null, null],
  [null, null, null, null, null, "L", null, null, null, null, null, null]
]
```

Graphically, this would look like:

```no-highlight
|-|-|-|-|-|-|-|-|-|-|M|-|
|-|-|-|-|M|-|-|-|-|-|-|-|
|=|=|=|=|=|=|=|=|=|=|=|=|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|-|-|-|K|-|-|-|
|-|-|-|-|-|-|-|-|-|-|-|-|
|-|-|-|-|-|L|-|-|-|-|-|-|
```


### Arrays of Objects

While arrays of arrays provide us with an excellent way of representing two-dimensional spaces, arrays of objects give us the power to collect and manipulate rows of data that are similar. Consider the following list of voter addresses:

```no-highlight
Larry Launcher
33 Harrison Ave
Boston, MA 02111

Tom Menino
1 City Hall Square
Boston, MA 02201

Jim Irish
200 New Boston Dr
Canton, MA 02021

Freddie Fishman
1 Central Wharf
Boston, MA 02110

Cole Trickle
2 Claire Way
Boston, IN 47324
```

Using what we know of arrays and objects, we could represent this list as an array of objects:

```javascript
const addresses = [
  {
    name: "Larry Launcher",
    address: "33 Harrison Ave",
    city: "Boston",
    state: "MA",
    postalCode: "02111"
  },
  {
    name: "Tom Menino",
    address: "1 City Hall Square",
    city: "Boston",
    state: "MA",
    postalCode: "02201"
  },
  {
    name: "Jim Irish",
    address: "200 New Boston Dr",
    city: "Canton",
    state: "MA",
    postalCode: "02021"
  },
  {
    name: "Freddie Fishman",
    address: "1 Central Wharf",
    city: "Boston",
    state: "MA",
    postalCode: "02110"
  },
  {
    name: "Cole Trickle",
    address: "2 Claire Way",
    city: "Boston",
    state: "IN",
    postalCode: "47324"
  }
]
```

To determine the name of the first voter in the list, we could use the following syntax:

```javascript
addresses[0]["name"]
```

Let's parse this out a bit. We could break this statement down into two essential components.

```javascript
const firstAddress = addresses[0] // returns the first object in the array
firstAddress["name"] // returns the value of the "name" key in the first object
```

`addresses[0]["name"]` is just a shorthand way of accessing the same value.

Similarly, to determine the city of the last voter in the list, we could use similar syntax:

```javascript
const indexOfLastVoter = addresses.length - 1
addresses[indexOfLastVoter]["city"]
```

Now that we have a well structured list, we can start to do some really interesting things. Imagine a mayoral candidate has requested that we write letters to voters in this list from Boston, MA. Using what we know of iteration and data structures, we could write the following to automate how to introduce the letter:

```javascript
addresses.forEach(address => {
  if (address["city"] === "Boston" && address["state"] === "MA") {
    console.log(`Dear ${address["name"]},`)
  }
})
```

In the above example, we're looping through all of the supplied addresses, looking for entries that have the city of "Boston" and the state of "MA", and outputting a salutation for each recipient.

Your output should look like:

```no-highlight
Dear Larry Launcher,
Dear Tom Menino,
Dear Freddie Fishman,
```

Note that these are the only entries that are from Boston, MA.

### Summary

We've seen how to create and navigate arrays of arrays and arrays of objects. These complex data structures will come in handy as we begin to work with increasingly realistic data sets.

[zelda-wikipedia]: http://en.wikipedia.org/wiki/The_Legend_of_Zelda_(video_game)
[zelda-grid]: https://s3.amazonaws.com/horizon-production/images/key1.png
[tic-tac-toe-article]: http://en.wikipedia.org/wiki/Tic-tac-toe
