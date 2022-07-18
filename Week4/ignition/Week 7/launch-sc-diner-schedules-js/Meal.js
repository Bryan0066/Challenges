class Meal {
  constructor(name, ingredients) {
    this.name = name;
    this.ingredient = ingredients;
  }
  isVegetarian() {
    let noMeat = true;
    this.ingredients.forEach((ingredient) => {
      if (ingredient.category === "meat") {
        noMeat = false;
      }
    });
    return noMeat;
  }
  isDelicious() {
    let hasCheese = false;
    this.ingredients.forEach((ingredient) => {
      if (ingredient.category === "cheese") {
        hasCheese = true;
      }
    });
    return hasCheese;
  }
}

export default Meal;
