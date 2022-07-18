import Pet from "./pet.js";
import Owner from './Owner.js';

const fang = new Pet('Fang', 'dog', 'woof', 'rock cakes')
const fluffy = new Pet('Fluffy', 'dog', 'growl', 'trespassers')
const nagini = new Pet('Nagini', 'snake', 'hiss', 'humans')
const crookshanks = new Pet('Crookshanks', 'cat', 'meow', 'spiders')

console.log(fang.praise());
console.log(fluffy.praise());
console.log(nagini.praise());
console.log(crookshanks.praise());

console.log(`${fang.name} says: ${fang.speak(2)}`)
console.log(`${fluffy.name} says: ${fluffy.speak(1)}`)
console.log(`${nagini.name} says: ${nagini.speak(1)}`)
console.log(`${crookshanks.name} says: ${crookshanks.speak(3)}`)

const hagrid = new Owner('Hagrid', 'Groundskeeper')
const voldemort = new Owner('Voldemort', 'Dark Lord')
const hermione = new Owner('Hermione', 'student')

hagrid.addPet(fang)
hagrid.addPet(fluffy)
voldemort.addPet(nagini)
hermione.addPet(crookshanks)

console.log(`${hagrid.name} says: ${hagrid.callPets()}`)
console.log(`${voldemort.name} says: ${voldemort.callPets()}`)
console.log(`${hermione.name} says: ${hermione.callPets()}`)