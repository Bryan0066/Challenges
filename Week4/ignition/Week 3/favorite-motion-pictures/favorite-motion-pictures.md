### Getting Started

```no-highlight
et get favorite-motion-pictures
cd favorite-motion-pictures
code .
```

For Mac users

```no-highlight
open index.html
```

For PC users

```no-highlight
start index.html
```

> your work will go in `main.js`

In the browser, open up the JavaScript console. Using the `main.js` file provided, complete each of the steps below. You can refresh the page in order to see your changes, or use your browser console directly to test your JavaScript code.

### Meets Expectations Requirements

In the `main.js` file you will find an array of `tvShows` and an array of `movies`. Your task is to complete the following series of mini-challenges. Feel free to look at documentation, or back at previous articles and exercises for reference!

Make sure that when working on this challenge, you are defining JavaScript functions for each step. You should also be avoiding "hardcoding", such that if the order of the tvShows or movies were to change, your functions would still work.

#### 1. Add a new TV show or movie

Create a function called `addMotionPicture` that:
- first, prompts the user of they want to add a TV Show or a Movie.
- second, prompts the user for the title of the movie or tv show. 
- The supplied title should be added to the end of the correct array, either movies ot tvShows based on the first prompt.

Please try and match the below output to the best of your ability. Make sure before each prompt, that you are using `console.log` to first display a message, and then prompt the user. 

##### Example Output:

```no-highlight
Hello! Would you like to add a a new TV show or new movie?
> TV show
What is the title of the TV show?
> Game of Thrones
```

```js
addMotionPicture()

console.log(tvShows)

// => ['Community', 'The Office', 'Bojack Horseman', 'Buffy the Vampire Slayer', 'Game of Thrones']
```

#### 2. Display the favorite TV show title

The `tvShows` array and `movies` array are listed in order of their popularity (ranked by the Launch Academy team). Create a function called `favoriteTVShow` that displays the title of the top favorite TV show (the first show in the array).

This function should display the favorite TV Show in a descriptive message e.g. "The favorite TV show is Community". Use string interpolation or string concatenation to construct your message.

```js
console.log(favoriteTVShow())

// => The favorite TV show is Community
```

#### 3. Display the least favorite movie title

We also want to see the least favorite movie title. The movies are also listed by popularity, with the first element in the `movies` array being the favorite movie, and the last movie being the least favorite. Create a function called `favoriteMovie` to display the title of the favorite movie.

This function should display the least favorite movie with a descriptive message e.g. "The least favorite movie is The Godfather". Use string interpolation or string concatenation to construct your message.

```js
console.log(leastFavoriteMovie())

// => The least favorite movie is The Godfather
```

#### 4. Add a new favorite TV show

Create a function called `addFavoriteTVShow` that will add a new favorite TV show to the **start** of the `tvShows` array. This function should take an argument of the title of the TV show, and the title should be added to the **beginning** of the `tvShows` array as the first element.

```js
addFavoriteTVShow("Aggretsuko")
console.log(tvShows)

// => ["Aggretsuko", "Community", "The Office", "Bojack Horseman", "Buffy the Vampire Slayer"]
```

#### 5. Add a new favorite movie 

Let's now create a similar function called `addFavoriteMovie` that adds a new movie to the start of the `movies` array. The function should take an argument for the title of the new movie to be added.

```js
console.log(addFavoriteMovie("Toy Story"))
console.log(movies)

// => ["Toy Story", "Lord of the Rings", "The Dark Knight", "Forrest Gump", "The Godfather"]
```

#### 6. Check if a TV show is already listed

Create a function called `verifyTVShow` that takes an argument of a TV show title. This function should check if the supplied TV show is already in the array of `tvShows` and provide a message about the result.

```js
console.log(verifyTVShow("The Office"))

// => The TV Show The Office is already in the list of TV Shows

console.log(verifyTVShow("Futurama"))
// => The TV Show Futurama is not yet in the list of TV Shows
```

#### 7. Check if a movie is already listed

Create a function called `verifyMovie` to determine if a given movie is already in the `movies` array. The function should take the movie title as an argument, and provide a message about the result.

```js
console.log(verifyMovie("The Dark Knight"))

// => The movie The Dark Knight is already in the list of movies

console.log(verifyMovie("Almost Famous"))
// => The movie Almost Famous is not yet in the list of movies
```

#### 8. Display Favorites in Summary 

Lastly, create a function `allMotionPictures` that displays all of our favorite movie and TV Shows in an organized message. You should be using `.forEach` for this implementation. Make sure to match the output below: 

```javascript
console.log(allMotionPictures())
```

```no-highlight
Favorite TV Shows:
Community
The Office
Bojack Horseman
Buffy the Vampire Slayer

Favorite Movies:
Lord of the Rings
The Dark Knight
Forrest Gump
The Godfather
```

You do not need to include shows or movies that were added in previous steps (though you certainly can if you wish).

### Exceeds Expectations Requirements

Be sure that all Meets Expectations Requirements have been met before working on the Exceeds portion!

#### 1. List all TV shows and Movies

Update your `allMotionPictures` function to include the *ranks* of the shows. The output should include the title of the movie, and their ranking. The rank is determined by the position of the element in the array, first element being ranked as the top favorite.

```js
console.log(allMotionPictures())
```

##### Example Output:

```no-highlight
Favorite TV Shows
1. Community
2. The Office
3. Bojack Horseman
4. Buffy the Vampire Slayer

Favorite Movies
1. Lord of the Rings
2. The Dark Knight
3. Forrest Gump
4. The Godfather
```

#### 2. Add a new ranked favorite

Create a function called `addRankedMotionPicture` that is designed to add a TV show or movie to its respective list based on the provided rank. The function should take 3 arguments - first indicating whether to add a TV show or movie, second specifying the rank for the title, and lastly the title of the motion picture to add. Use the supplied rank to add the motion picture to the correct location in the array.

After adding the motion picture to the correct array, make sure to log a descriptive message at the end e.g. "The TV show Kipo and the Age of the Wonderbeasts was added with a rank of 3".

```js
console.log(addRankedMotionPicture("TV Show", 3, "Kipo and the Age of the Wonderbeasts"))
// => The TV show Kipo and the Age of the Wonderbeasts was added with a rank of 3

console.log(tvShows)
// => ["Community", "The Office", "Kipo and the Age of the Wonderbeasts", "Bojack Horseman", "Buffy the Vampire Slayer"]

console.log(addRankedMotionPicture("movie", 2, "The Shawshank Redemption"))
// => The movie The Shawshank Redemption was added with a rank of 2

console.log(movies)
// => ["Lord of the Rings", "Shawshank Redemption", The Dark Knight", "Forrest Gump", "The Godfather"]
```
