In this lesson, you'll review more examples of **compound data structures** created by nesting JavaScript arrays and objects within each other.

## Learning Goals

- Justify the importance of compound data structures and more realistic examples of their use
- Create compound data structures yourself by combining arrays and objects

### Implementation Details

Arrays are useful for storing collections of items. These collections can be of an arbitrary size and are able to grow as needed. Objects are useful for defining named attributes via key-value pairs when we want to group related information. We can nest these data structures within each other to create a **compound data structure**.

```javascript
const favoriteMovies = [
  {
    title: "The Big Lebowski",
    yearReleased: 1998,
    director: "Joel Coen",
    imdbRating: 8.2
  },
  {
    title: "The Shining",
    yearReleased: 1980,
    director: "Stanley Kubrick",
    imdbRating: 8.5
  },
  {
    title: "Troll 2",
    yearReleased: 1990,
    director: "Claudio Fragasso",
    imdbRating: 2.5
  }
]
```

Here we nested three objects describing some movies within an array. We can iterate over this array to print out the name and rating of each movie.

```javascript
favoriteMovies.forEach(movie => {
  console.log(`Title: ${movie.title}, Rating: ${movie.imdbRating}`)
})
```

The `forEach` method is taking each element of the array and storing it in the `movie` variable. Since each element is actually an object, we can refer to `movie.title` and `movie.imdbRating` to access the value associated with those properties.

**Quick Challenge:** Using the array of objects above, output the titles, along with their year to achieve the following output.

```no-highlight
1998: The Big Lebowski
1980: The Shining
1990: Troll 2
```

We can take this a step further if we wanted to include more information about our movies. Consider adding a list of actors to a movie:

```javascript
const movie = {
  title: "The Royal Tenenbaums",
  year_released: 2001,
  director: "Wes Anderson",
  cast: [
    "Gene Hackman",
    "Anjelica Huston",
    "Ben Stiller",
    "Gwyneth Paltrow",
    "Luke Wilson",
    "Owen Wilson"
    // ...
  ]
}
```

Now our object is mapping an array containing the names of actors to the `cast` property. Any time we have an attribute that could store a varying number of elements an array should be the data type of choice. Every movie can have a different number of actors so we need something that can accommodate that.

What if we want to store information about the characters that each actor or actress portrays? We can keep nesting as much as we like as long as it makes sense to structure our data in such a way:

```javascript
const movie = {
  title: "The Nutty Professor",
  cast: [
    {
      name: "Eddie Murphy",
      characters: [
        "Sherman Klump",
        "Buddy Love",
        "Lance Perkins",
        "Papa Klump",
        "Mama Klump",
        "Grandma Klump",
        "Ernie Klump"
      ]
    },
    {
      name: "Jada Pinkett Smith",
      characters: ["Carla Purty"]
    }
  ]
}
```

Here we have an object (`movie`) that is nesting an array of objects (`movie.cast`), each of which also contains its own array (`movie["cast"][0]["characters"]`).

There isn't necessarily a limit to how deep we can nest our data structures except our own good judgement. At some point we need to consider what data is relevant to our needs and design our data structures accordingly.

**Quick Challenge:** Using the compound data structure above and what you know of iteration, build an array of all characters. This routine should work for any arbitrary movie, with any number of cast members.

### Rules to Follow When _Building_ Data Structures

#### Only Include What's Relevant

In the previous examples, we kept expanding our movie object to include more information. However, when you create your own compound data structures, you'll want to consider whether that information is relevant to the problem at hand and even needed. The less bloated our data, the easier it is to identify what's important.

### Why This is Important

Combining data structures lets us model our information much more effectively than if we had to choose any one structure. Understanding how arrays and objects can work together is an important part of understanding how to structure our data. And, any architect will tell you that having the right structure is vital to building something extraordinary.
