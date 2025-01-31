## Crypt Creation

Time capsules are important so we can remember what the world was like in case we get lost out in time and space. A well-known capsule is the [Crypt of Civilization](http://en.wikipedia.org/wiki/Crypt_of_Civilization) - Let's recreate it using Ruby arrays!

## Getting Started

```no-highlight
et get crypt-of-civilization
cd crypt-of-civilization
code .
```

Complete your work in the provided `code.rb` file.

### NOTE: At any time, you can include a `puts crypt_of_civilization` to see the status of your crypt.

Write a line of code that initializes an empty array called
`crypt_of_civilization`

<details>
<summary>Solution</summary>
<p>

```no-highlight
crypt_of_civilization = Array.new  # or
crypt_of_civilization = []
```

</p>
</details>
</br>

## Crypt Filling

Now let's start adding items to the `crypt_of_civilization`!

* Comptometer
* Box of phonographic records
* Plastic savings bank
* Set of scales
* Toast-O-Lator
* Sample of aluminum foil
* Donald Duck doll

What is a Toast-O-Lator you might ask?
[Video](https://www.youtube.com/watch?v=eS6HfCN2eLQ)

For a full inventory of the time capsule, take a look here:
[What's inside the Crypt of Civilization?](http://crypt.oglethorpe.edu/inventory/)

<details>
<summary>Solution</summary>
<p>

```no-highlight
crypt_of_civilization << "Comptometer"
crypt_of_civilization << "Box of phonographic records"
crypt_of_civilization << "Plastic savings bank"
crypt_of_civilization << "Set of scales"

# we can also use .push to add items
crypt_of_civilization.push("Toast-O-Lator")
crypt_of_civilization.push("Sample of aluminum foil")
crypt_of_civilization.push("Donald Duck doll")
```

</p>
</details>
</br>

## Crypt Combining

Oh no! We forgot to add a few things to `crypt_of_civilization`! We have another
array called `extra` that has the items we want:

```no-highlight
extra = ["Container of soda", "Lionel model train set", "Ingraham pocket watch"]
```

After defining the `extra` array like we've done above in your `code.rb` file,
write a single line of Ruby code that combines the contents of
`crypt_of_civilization` and `extra` into `crypt_of_civilization`.

<details>
<summary>Solution</summary>
<p>

```no-highlight
# provided code
extra = ["Container of soda", "Lionel model train set", "Ingraham pocket watch"]

crypt_of_civilization = crypt_of_civilization + extra  
# or...
crypt_of_civilization = crypt_of_civilization.concat(extra)
```

</p>
</details>
</br>

## Crypt Reference

Now let's grab a few values in the `crypt_of_civilization` variable.
Write a single line of code to answer each of the following questions:

* How many items are in the array?
* What is the first item in the array?
* What is the last item in the array?
* What is the second item in the array?
* What is the third item in the array?
* What is the second from last item in the array?
* What is the index of "Toast-O-Lator"?

<details>
<summary>Solution</summary>
<p>

How many items are in the array:

```no-highlight
crypt_of_civilization.length
```

What is the first item in the array?

```no-highlight
crypt_of_civilization[0]  
# or
crypt_of_civilization.first
```

What is the last item in the array?

```no-highlight
crypt_of_civilization[-1]  
# or
crypt_of_civilization.last
```

What is the second item in the array?

```no-highlights
crypt_of_civilization[1]
```

What is the third item in the array?

```no-highlight
crypt_of_civilization[2]
```

What is the second from last item in the array?

```no-highlight
crypt_of_civilization[-2]
```

What is the index of "Toast-O-Lator"?

```no-highlight
crypt_of_civilization.index("Toast-O-Lator")
```

</p>
</details>
</br>

## Crypt Checking

Let's find out if our array `crypt_of_civilization` contains some items!

Write Ruby code to answer the following questions:
* Does the array contain "Container of soda"?
* Does the array contain "Toast-O-Lator"?
* Does the array contain "Plastic bird"?

<details>
<summary>Solution</summary>
<p>

```no-highlight
crypt_of_civilization.include?("Container of soda")
crypt_of_civilization.include?("Toast-O-Lator")
crypt_of_civilization.include?("Plastic bird")
```

</p>
</details>
</br>

## Crypt Sorting

Right now, the elements in our array are in a rather random order. Let's try sorting them in a couple of different ways.

Write Ruby code to sort the array as follows:
* By word length
* In alphabetical order
* In reverse alphabetical order

<details>
<summary>Solution</summary>
<p>

```ruby
# sort by word length
crypt_of_civilization.sort_by { |item| item.length }

# sort in alphabetical order
crypt_of_civilization.sort

# two ways of sorting in reverse alphabetical order
crypt_of_civilization.sort { |a, b| b <=> a }
crypt_of_civilization.sort.reverse
```

</p>
</details>
</br>

## Crypt Check

Two hundred years have passed. Hoverboards STILL haven't been properly invented
yet, but at least we can open up our time capsule and check that the contents are still there!

Using a `while` loop, print out each element of the array `crypt_of_civilization`.

Then do the same with an `each` loop!

<details>
<summary>Solution</summary>
<p>

```no-highlight
# while loop

count = 0
while count < crypt_of_civilization.length
  puts crypt_of_civilization[count]
  count += 1
end


# each loop

crypt_of_civilization.each do |item|
  puts item
end
```

</p>
</details>
</br>

## Crypt Deletion

After opening the time capsule we discovered that half of this stuff is junk!
History won't mind if we get rid of a few relics.

Try to remove the following items from the array `crypt_of_civilization`:

* the first item
* the last item
* "set of scales"
* "sample of aluminum foil"

<details>
<summary>Solution</summary>
<p>

```no-highlight
crypt_of_civilization.shift  # removes the first item
crypt_of_civilization.pop    # removes the last item
crypt_of_civilization.delete("Set of scales")
crypt_of_civilization.delete("Sample of aluminum foil")
```

</p>
</details>
</br>
</br>

Good job, you've successfully preserved a record of our society (or at least some of it)!
