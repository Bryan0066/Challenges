/*
# Learning Goal

- Understand the contextual nature of `this`

*/

const Pet = require('./Pet')
const Owner = require('./Owner')

let fang = new Pet('Fang', 'dog', 'woof', 'rock cakes')
let crookshanks = new Pet('Crookshanks', 'cat', 'meow', 'spiders')

console.log(fang.praise())
console.log(crookshanks.praise())

let hagrid = new Owner('Hagrid', 'Groundskeeper')
let hermione = new Owner('Hermione', 'student')

hagrid.addPet(fang)
hermione.addPet(crookshanks)
