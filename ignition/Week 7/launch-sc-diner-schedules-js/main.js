console.log("Welcome to the diner!");

import Ingredient from "./Ingredient.js";
import Meal from "./Meal.js";
import Menu from "./Menu.js";
import Shift from "./shift.js";
import Server from "./server.js";

// Part One

let egg = new Ingredient("egg", "protein");
let tomato = new Ingredient("tomato", "fruit");
let spinach = new Ingredient("spinach", "vegetable");
let mushroom = new Ingredient("mushroom", "vegetable");
let feta = new Ingredient("feta", "cheese");
let cheddar = new Ingredient("cheddar", "cheese");
let bacon = new Ingredient("bacon", "meat");

let greekOmelette = new Meal("Greek Omelette", [egg, tomato, spinach, feta]);
let baconCheeseOmelette = new Meal("Bacon and Cheese Omelette", [
  cheddar,
  egg,
  bacon,
]);
let mushroomOmelette = new Meal("Mushroom Omelette", [egg, mushroom]);

let breakfastMenu = new Menu("Breakfast", 7, 12);
breakfastMenu.addMeal(greekOmelette);
breakfastMenu.addMeal(baconCheeseOmelette);
breakfastMenu.addMeal(mushroomOmelette);
breakfastMenu.printMenu();

console.log(`At 1PM, the active menu is the ${Menu.whichMenu(13)} menu.`);

// Part Two

let shift1 = new Shift(7, 16);
let shift2 = new Shift(10, 19);
let shift3 = new Shift(16, 24);
let shift4 = new Shift(16, 2);
console.log("We need to fill the following shifts:");
console.log(shift1);
console.log(shift2);
console.log(shift3);
console.log(shift4);

// Part Three

let ruthie = new Server("Ruthie");
let kelly = new Server("Kelly");
let larry = new Server("Larry");

kelly.assignShift(shift1);
console.log(
  "Kelly should not be available for Shift 2, because she's already working Shift 1. But she could pick up Shift 3."
);
console.log(kelly.shifts);
console.log("Is Kelly available for shift 2?");
console.log(kelly.available(shift2));
console.log("Is Kelly available for shift 3?");
console.log(kelly.available(shift3));
console.log("Is Ruthie available for shift 2?");
console.log(ruthie.available(shift2));
