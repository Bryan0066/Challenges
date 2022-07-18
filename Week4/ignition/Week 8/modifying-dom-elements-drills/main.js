//1 Print to the console the text of any elements with a class of oh-no
classOhNo = document.querySelectorAll(".oh-no")
classOhNo.forEach(element => {
    // we can use .textContent to get the text contained within this element
    console.log(element.textContent)
  })

//2 Print to the console the tag name of the element with an id of hashtag-inspiration
hashtaginspirationElement = document.getElementById("hashtag-inspiration")
hashtaginspirationElement.tagName

//3 Print to the console all of the HTML contained within any elements with a class of tv
tvClassE = document.querySelectorAll(".tv")
tvClassE.forEach( element => {console.log(element)})

//4 Reluctantly fix the typo "Never gonna run around and dessert you" to "Never gonna run around and desert you", where "desert" has one s
let rrelements = document.getElementsByClassName('rickroll')
rrelements[0].textContent = '\n          Never gonna run around and desert you\n' 

//5 Replace the text in the fourth child of the element with an id of purple-jaguar-eye with lyrics of your choosing
jagEyeId = document.getElementById('purple-jaguar-eye')
jagEyeId.childNodes[4].textContent = "Real G's move in silence like lasagna"

//6 Turn each <h2> into an <h3>. Hint: Be careful which method you use to access the elements. #getElementsByTagName will return a live HTMLCollection, and #querySelectorAll returns a non-live NodeList. Play around to see what works better, and see if you can identify why this is tricky!


//7 Add a class of scary-thoughts to the element with an id of woof
//8 Add an image of a fish as the last child of the element with an id of shes-the-one-for-me
//9 Delete the class rickroll from the div that also contains the class limerickroll
//10 Add your own lyrics to the element with an id of lyrics by adding one additional <p>
//11 Add a new paragraph explaining what your favorite song is as the last child of <body>
//12 Add an attribute called foo, with a value of bar, to each child of the element with a class of rickroll