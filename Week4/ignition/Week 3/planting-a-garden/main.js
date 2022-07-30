const allSeeds = [
  "arugula",
  "kale",
  "romaine",
  "iceberg",
  "beet",
  "potato",
  "carrot",
  "garlic",
  "onion",
  "strawberry",
  "raspberry",
  "blackberry",
  "blueberry",
  "roma tomato",
  "acorn squash",
  "ugly tomato",
  "cherry tomato",
  "butternut squash",
  "jalapeno pepper",
  "cayenne pepper",
  "banana pepper",
  "poblano pepper"
]

const fruits = [
  "strawberry",
  "raspberry",
  "blackberry",
  "blueberry",
  "roma tomato",
  "ugly tomato",
  "acorn squash",
  "cherry tomato",
  "butternut squash",
  "jalapeno pepper",
  "cayenne pepper",
  "banana pepper",
  "poblano pepper"
]

const vegetables = [
  "beet",
  "potato",
  "carrot",
  "garlic",
  "onion"
]

const leafyGreens = [
  "arugula",
  "kale",
  "romaine",
  "iceberg"
]

const myGarden = []

/*Part 1: 
  ...write a line of code to return every kind of tomato seed 
  you can order from the allSeeds array, then add those seed 
  names to the array myGarden.*/

const getSeeds = (word) => {allSeeds.forEach((x) => {
  if (x.includes(word)) {
      myGarden.push(x)
    }
})}

getSeeds("tomato")

console.log(`tomatos :`, myGarden)

/*Part 2:
  Write a line of code to return every berry seed in the allSeeds 
  array, then add those seed names to the array myGarden.*/
getSeeds("berry")

console.log(`tomatos+berrys:`, myGarden)

/*Part 3:
  Write a line of code that will return every pepper in the 
  allSeeds array that does NOT have the word "cayenne" in it. 
  Also add those names to myGarden. */

allSeeds.forEach((x) => {
  if (x.includes('pepper')) {
    if(x.includes('cayenne')){
    } else {
      myGarden.push(x)
    }
  }
})

console.log(`tomatos+berrys+peppers-cayenne:`, myGarden)

/*Part 4:
  Write a line of code that will return an alphabetized list 
  of all the seeds available, but does not include any of the 
  seeds currently inside myGarden. */

//found .filter() online, makes sense to me. 
allSeedsAtoZ = allSeeds.map((x)=>{
    if (myGarden.includes(x) == false) {
      return x
    }
  }).filter(notUndefined => notUndefined !== undefined)

console.log(`allSeeds-myGarden-atoz:`, allSeedsAtoZ.sort())

/*Part 5:
  Write some code that removes all the tomatoes, 
  peppers, and squash from the fruits array and adds them to 
  the vegetables array. */


let i=0
while (i<fruits.length){
    index = fruits[i]
    if (index.includes("pepper") || index.includes("tomato") || index.includes("squash")){

      vegetables.push(fruits[i])
      fruits.splice(i,1)
      
    } else {i += 1 }
  }

console.log('fruit sans peppers squash and tomato: ', fruits)
console.log('vegetables with peppers squash and tomato: ', vegetables)

/*Part 6:
  Write some code that  deletes that option (iceberg) from all of the 
  arrays that contain it.*/

y = allSeeds.indexOf('iceberg')
allSeeds.splice(y,1)

z = leafyGreens.indexOf('iceberg')
leafyGreens.splice(z,1)

console.log('All seeds - iceberg: ', allSeeds)
console.log('leafygreens - iceberg: ', leafyGreens)

/*Part 7:
  Write some code to find the first squash in the allSeeds 
  array, then add that to myGarden.*/
  i = 1
  const squash = (word) => {allSeeds.forEach((x) => {
    if (x.includes(word) && i == 1) {
        myGarden.push(x)
        i += 1
      }
  })}

squash('squash')
console.log('my garden + one squash: ',myGarden)

/*Part 8:
  Write some code that logs each item from your myGarden 
  array, then tells you how many plants you've selected in 
  total.*/

myGarden.forEach((x) =>{
  console.log(x)
})

console.log("My Garden length:",myGarden.length)