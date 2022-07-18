const createNewMeal = (name, ingredients) => {
  const meal = {
    name: name,
    ingredients: ingredients,

    isVegetarian: () => {
      let bool;
      meal.ingredients.forEach((element) => {
        if (element.category === "meat") {
          bool = false;
        } else {
          bool = true;
        }
      });
      return bool;
    },

    isDelicious: () => {
      let bool = false;
      meal.ingredients.forEach((element) => {

        if (element.category === "cheese") {
          bool = true;
        }
      });
      return bool;
    },
  };

  return meal;
};

export default createNewMeal;
