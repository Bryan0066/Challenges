// main.js
// 1.) Find An element with an id of `woof`
document.getElementById("woof")

//1. An element with an id of i-love-educated-lizards
document.getElementById("i-love-educated-lizards")

//2. All elements with a class of recipe-idea
document.getElementsByClassName("recipe-idea")

//3. Using the result from #2, access the second element with this class
document.getElementsByClassName("recipe-idea")[1]

//4. All <div> elements
document.getElementsByTagName("div")

//5. All <h2> elements with a class of lyrics
document.getElementsByClassName("lyrics")

//6. The parent of the element whose id is purple-jaguar-eye
jaguar = document.getElementById("purple-jaguar-eye")
jaguar.parentElement

//7. The children of the element whose id is purple-jaguar-eye
jaguar.children

//8. Using the result from #7, the sixth child of that element
jaguar.children[6]

//9. The element with classes of both recipe-idea and intentional-misspelling-of-desert (using just one line of code)
document.getElementsByClassName("intentional-misspelling-of-desert","recipe-idea")

//10. Tell me how many elements are children of the element with a class of limerickroll
0