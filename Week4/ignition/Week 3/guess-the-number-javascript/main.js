// YOUR CODE HERE
//alert('Does this work?')

// Generate a random number between 1 and 10
//- Get the user's name
//- Ask the user to enter a number
//- If the number equals the random number let the user know that they've won, otherwise let them know that they lost



let randomNum = Math.floor((Math.random() * 10) + 1)
let name = ''
let guess = 0

console.log(randomNum)

name = prompt(`Welcome to the guessing game! What is your name?`)
guess = prompt(`Enter your guess from 1-10.`)


if(randomNum == guess){
    console.log(`Congradulations ${name} you won!`)
} else {
    console.log(`Oh no ${name}, you lost!`)
    console.log(`The number was ${randomNum}`)
}

