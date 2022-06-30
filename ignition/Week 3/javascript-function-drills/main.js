// YOUR CODE, HERE

//Part 1 

const greaterThanZero = (x) => {
    if (x < 0) {
        return false
    } else {
        return true
}}


console.log(`1. Greater than zero: ${greaterThanZero(-1)}`)

//Part 2

const multipleOfFive = (x) => {
    if (x % 5 == 0) {
        return true
    } else {
        return false
}}

console.log(`2. Multiple of Five: ${multipleOfFive(10)}`)

//Part 3


const fullName = (first, last) => {
    return `${last}, ${first}`
}
console.log(`3. Full name: ${fullName('Bryan','Genest')}`)


//Part 4


const upToAdd = (x) => {
    newNumber = 0
    sumArray = []
    while (newNumber < x){
        newNumber += 1
        sumArray.push(newNumber)   
    }
    return sumArray.reduce((a,b)=> a+b,0) 
}

console.log(`4. Sum: ${upToAdd(4)}`)

//Add each element of the array together ^

//Part 5----------------------------

index5 = 0
const occur = (letter, word) => {  
    for (let char of word) {
        if (char == letter) {
            index5 ++
        }
      }
    return index5
}

console.log(`5. Letter in word count:  ${occur('l','apples')}`)

//Part 6----------------------------

let numberArray = [1,3,2,4,3,6,2,9,10,12,13]

const sorty = (a, b) => {
    return a - b 
}

numberArray.sort(sorty)
console.log(`6. Sorted array (hopefully): ${numberArray}`)


//Part 7---------------------------


const nameArray = (num, name) => {
    let index = 0
    let array = []
    while (index < num){
        array.push(name)
        index += 1
    }
    return array
}

console.log(`7. Name Array: ${nameArray(5,'sally')}`)

//--------------------------------
//Part 8


const minToSec = (minutes) => {
    return minutes * 60
}

console.log(`8. Minutes to Seconds: ${minToSec(4)}`)

//Part 9

arrayOg = ['first', 'second', 'last']
const firstLast = (oldArray) => {
    array = []
    array.push(oldArray.shift())
    array.push(oldArray.pop())
    return array
}
console.log(`9. First and Last: ${firstLast(arrayOg)}`)

//Part 10
/*Create your own function challenge! Based on the problems above, 
create a new challenge and submit 2 potential solutions. */

/*Create a function that returns every other odd number up to a given number */


const oddNum = (x) => {
    let number = 0
    let array = []
    let flip = 1
    while (number <= x){

        if (number % 2 ) {
            flip += 1 
            if (flip % 2 == false ){
                array.push(number)
            }
        }
        number += 1
    }
    return array
}

console.log(`10. Every other Odd number: ${oddNum(45)}`)


const oddNum2 = (x) => {
    let index = 0
    array = []
    y = 0

    while(y < x) {
        index += 1
        y = ((4 * index) - 3)
        array.push(y)
     }
    return array
}

console.log(`10. Every other Odd number (2): ${oddNum2(45)}`)