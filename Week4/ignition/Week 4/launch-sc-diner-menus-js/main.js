console.log("Let's build a diner!");

// Part One

import createNewIngredient from "./createNewIngredient.js";

const egg = createNewIngredient("egg", "protein");
const tomato = createNewIngredient("tomato", "fruit");
const spinach = createNewIngredient("spinach", "vegetable");
const mushroom = createNewIngredient("mushroom", "vegetable");
const feta = createNewIngredient("feta", "cheese");
const cheddar = createNewIngredient("cheddar", "cheese");
const bacon = createNewIngredient("bacon", "meat");

/*
console.log(mushroom);
console.log(egg);
console.log(feta);
console.log(spinach);
*/

// Part Two

import createNewMeal from "./createNewMeal.js";

const greekOmelette = createNewMeal("Greek Omelette", [
  egg,
  tomato,
  spinach,
  feta,
]);
const baconCheeseOmelette = createNewMeal("Bacon and Cheese Omelette", [
  cheddar,
  egg,
  bacon,
]);
const mushroomOmelette = createNewMeal("Mushroom Omelette", [egg, mushroom]);

/*
console.log("baconCheeseOmelette", baconCheeseOmelette);
console.log("Is it vegetarian?");
console.log(baconCheeseOmelette.isVegetarian());
console.log("Is it delicious?");
console.log(baconCheeseOmelette.isDelicious());

console.log("mushroomOmelette", mushroomOmelette);
console.log("Is it vegetarian?");
console.log(mushroomOmelette.isVegetarian());
console.log("Is it delicious?");
console.log(mushroomOmelette.isDelicious());
*/

// Part Three
import createNewMenu from "./createNewMenu.js";

const breakfastMenu = createNewMenu("Breakfast", 7, 12);
breakfastMenu.addMeal(greekOmelette);
breakfastMenu.addMeal(baconCheeseOmelette);
breakfastMenu.addMeal(mushroomOmelette);
//breakfastMenu.printMenu();
//console.log(breakfastMenu.meals);

//Exceeds Part Two

const lunchMenu = createNewMenu("Lunch", 12, 16);
const dinnerMenu = createNewMenu("Dinner", 16, 24);
const currentMenus = [breakfastMenu, lunchMenu, dinnerMenu];

let time = new Date()

time = time.getHours()

const welcomeCustomer = () => {
  let menu = false;
  if (time < 12) {
    menu = breakfastMenu;
  }
  if (time > 12 && time < 16) {
    menu = lunchMenu;
  }
  if (time > 16) {
    menu = dinnerMenu;
  }
  if (menu) {
    console.log(
      `Welcome to our diner! Here's our ${menu.title} menu, which we will be serving until ${menu.endTime}`
    );
  } else {
    `Sorry! Kitchen is closed at this time. Please come back during normal business hours`;
  }
};

welcomeCustomer()