In this lesson, you'll review more examples of **compound data structures** created by nesting Ruby arrays and hashes within each other.

## Learning Goals

* Review the importance of compound data structures and more realistic examples of their use
* Create compound data structures yourself by combining arrays and hashes

### Implementation Details

Arrays are useful for storing collections of items. These collections can be of an arbitrary size and are able to grow as needed. Hashes are useful for defining named attributes via key-value pairs when we want to group related information. We can nest these data structures within each other to create a **compound data structure**.

```ruby
favorite_movies = [
  { title: 'The Big Lebowski', year_released: 1998, director: 'Joel Coen', imdb_rating: 8.2 },
  { title: 'The Shining', year_released: 1980, director: 'Stanley Kubrick', imdb_rating: 8.5 },
  { title: 'Troll 2', year_released: 1990, director: 'Claudio Fragasso', imdb_rating: 2.5 }
]
```

Here we nested three hashes describing some movies within an array. We can iterate over this array to print out the name and rating of each movie.

```ruby
favorite_movies.each do |movie|
  puts "Title: #{movie[:title]}, Rating: #{movie[:imdb_rating]}"
end
```

The `each` method is taking each element of the array and storing it in the `movie` variable. Since each element is actually a hash, we can refer to `movie[:title]` and `movie[:imdb_rating]` to access the value associated with those keys.

**Quick Challenge:** Using the array of hashes above, output the titles, along with their year to achieve the following output.

```no-highlight
1998: The Big Lebowski
1980: The Shining
1990: Troll 2
```

We can take this a step further if we wanted to include more information about our movies. Consider adding a list of actors to a movie:

```ruby
movie = {
  title: 'The Royal Tenenbaums',
  year_released: 2001,
  director: 'Wes Anderson',
  cast: [
    'Gene Hackman',
    'Anjelica Huston',
    'Ben Stiller',
    'Gwyneth Paltrow',
    'Luke Wilson',
    'Owen Wilson'
    # ...
  ]
}
```

Now our hash is mapping an array containing the names of actors to the `:cast` key. Anytime we have an attribute that could store a varying number of elements an array should be the data type of choice. Every movie can have a different number of actors so we need something that can accommodate that.

What if we want to store information about the characters that each actor or actress portrays? We can keep nesting as much as we like as long as it makes sense to structure our data in such a way:

```ruby
movie = {
  title: 'The Nutty Professor',
  cast: [
    {
      name: 'Eddie Murphy',
      characters: [
        'Sherman Klump',
        'Buddy Love',
        'Lance Perkins',
        'Papa Klump',
        'Mama Klump',
        'Grandma Klump',
        'Ernie Klump'
      ]
    },
    {
      name: 'Jada Pinkett Smith',
      characters: [
        'Carla Purty'
      ]
    }
  ]
}
```

Here we have a hash (`movie`) that is nesting an array of hashes (`movie[:cast]`), each of which also contains its own array (`movie[:cast][0][:characters]`).

There isn't necessary a limit to how deep we can nest our data structures except our own good judgement. At some point we need to consider what data is relevant to our needs and design our data structures accordingly.

### Rules to Follow When *Building* Data Structures

#### Only Include What's Relevant

In the previous examples, we kept expanding our movie hash to include more information. However, when you create your own compound data structures, you'll want to consider whether that information is relevant to the problem at hand and even needed. The less bloated our data, the easier it is to identify what's important.


### Why This is Important

Combining data structures lets us model our information much more effectively than if we had to choose any one structure. Understanding how arrays and hashes can work together is an important part of understanding how to structure our data. And any architect will tell you that having the right structure is vital to building something extraordinary.
