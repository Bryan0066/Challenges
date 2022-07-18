import Person from "./Person.js";
import Car from "./Car.js";
import Plane from "./Plane.js";
import Card from "./card.js";
import Deck from "./deck.js";
import Book from "./Book.js";
import Author from "./author.js";
import Player from "./player.js";
import Potion from "./Potion.js";

const mario = new Person("Mario", 26);
console.log(mario);
console.log(`${mario.name} is ${mario.age}`);
mario.celebrateBirthday();
console.log(`${mario.name} is ${mario.age}`);

// add our "Toyota Camry" with a mileage of 5000
const car = new Car("Toyota", "Camry", 5000);
console.log(car);
console.log(`Our car's mileage is ${car.mileage}`);
car.drive(467);
console.log(`Our car's mileage is ${car.mileage}`);

// add our "Launch 783" plane with a capacity of 2
const plane = new Plane("Launch", "783", 2);
console.log(plane);
plane.board();
plane.board();
plane.board();

// add cards to deck
const card = new Card("10", "diamonds");
console.log(card);
const deck = new Deck();
console.log(deck);
deck.addCard(card);
console.log(deck);
console.log(deck.cards);

const author = new Author("Bob", "Bobby", "Fiction");
console.log(author);
const book = new Book("The worst book", "45", "1990");
console.log(book);
author.writeBook("The best Book");
console.log(author.anthology);

const player = new Player();
console.log(player);
const potion = new Potion("Health", "+25");
console.log(potion);
player.addToInventory(potion.name);
console.log(player.inventory);
player.useHealthPotion();
console.log(player.health);
