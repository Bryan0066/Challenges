Let's get some practice with separating our concerns in a class.

### Getting Started

```no-highlight
et get javascript-separation-of-concerns-practice
cd javascript-separation-of-concerns-practice
node main.js
```

You should see the output for each soccer player print to the terminal.

### Instructions

In `Player.js`, you'll find a `Player` class defined. This `Player` class is keeping track of each player's name, number, position and stats, but also the team name and the head coach's name.

### Part One

Refactor the `Player` class to no longer be responsible for their team information. Remove the `team` and `coach` argument from the constructor method as well as the instance variable being set.

Create a `Team` class in a new `Team.js` file which is responsible for storing the information of the team name and coach. These should both be arguments in the constructor.  

The `Team` class should also store a `players` array as an instance variable.  This should initialize as an empty array.  

Include a `signPlayer` method which takes in a `player` as an argument and adds that player to the `players` array.  

Finally import your `Team` class into the `main.js` file, and update the code in this file to correctly instantiate the refactored players.  Create the teams and add players to them in any order you would like. Use `console.log` statements and `debugger`'s to test and make sure your teams have the proper players added.

The following code should now be valid
```javascript
const chelsea = new Team("Chelsea", "Frank Lampard")
const barcelona = new Team("Barcelona", "Quique Setién")
const juventus = new Team("Juventus", "Maurizio Sarri")

chelsea.signPlayer(drogba)
chelsea.signPlayer(alonso)
barcelona.signPlayer(messi)
juventus.signPlayer(ronaldo)
```

### Part Two

Our `Team` class is still storing information for a separate concern: our `Coach`es! In the example above we pass the name of a coach to the `Team` constructor like so, `new Team("Chelsea", "Frank Lampard")`.  Instead we will initialize the `coach` instance variable as `null` and create a new method to update that with an instance of a new `Coach` class!

Add a separate `Coach` class in its own `Coach.js` file. Take in the coach's `name` and `firstYear` as arguments and store them as instance variables. Also add a `stats` object as an instance variable: but this one will store the following stats:

```javascript
{
  wins: 0,
  losses: 0,
  draws: 0,
  matchesPlayed: 0
}
```

Add a `gameOver` method to the `Coach` class which takes in an argument of `W`, `L`, or `D`. This method should look at the input and conditionally determine if it should add a win, loss, or draw to the stats. It should then increment the `matchesPlayed`. Feel free to add any fun output you would like!

Finally add a `hireCoach` method to the `Team` class. This should accept an argument of a coach object and assign it to the `coach` instance variable.

Notice that we did not make a `Human` class to encompass both our Players and Coaches. This is important, because they need to keep track of different information!

The following code should now work
```javascript
const frankLampard = new Coach("Frank Lampard", 2019)
const quique = new Coach("Quique Setién", 2020)
const maurizio = new Coach("Maurizio Sarri", 2019)

const chelsea = new Team("Chelsea")
const barcelona = new Team("Barcelona")
const juventus = new Team("Juventus")

chelsea.hireCoach(frankLampard)
barcelona.hireCoach(quique)
juventus.hireCoach(maurizio)
```

### Part Three

Time to simulate some stats! Add some wins, losses or draws to the available coaches through the `gameOver()` method.  Ensure the players also have some stats of their own through the `score()`, `assist()` and `redCard()` methods!

Add a `printSummary` method to the `Team` class that will return a formatted string containing information about the coach, the coaches stats and information about each of the players on the team.

Sample output for `chelsea`.

```javascript
// main.js
console.log(chelsea.printSummary());
```

Terminal output should look something like this.
```no-highlight
Frank Lampard is the head coach for Chelsea
Frank Lampard stats: 
wins: 2
losses: 1
draws: 1
matchesPlayed: 4

Players:
Name: Didier Drogba
Number: 11
Position: Striker
Stats:
goals: 2
assists: 1
ejections: 0

Name: Marcos Alonso
Number: 3
Position: Left back
Stats:
goals: 1
assists: 0
ejections: 0
```

* Hint: It may be easiest to create smaller `printSummary` methods on the `Player` and `Coach` class and then use them here!