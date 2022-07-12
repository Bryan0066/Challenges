import React, { useState } from "react";
import RandomSprout from "./RandomSprout";
import SproutsIndex from "./SproutsIndex";

const SproutsContainer = (props) => {
  const [recipe, setRecipe] = useState("");
  const [recipes, setRecipes] = useState([]);

  const getRandomRecipe = async () => {
    try {
      const response = await fetch("/api/v1/random-recipe");
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`;
        const error = new Error(errorMessage);
        throw error;
      }
      const dish = await response.json();
      setRecipes([]);
      setRecipe(dish);
    } catch (err) {
      console.error(`Error in fetch: ${err.message}`);
    }
  };

  const getAllRecipes = async () => {
    try {
      const response = await fetch("api/v1/recipes");
      if (!response.ok) {
        const errorMessage = `${response.status} (${response.statusText})`;
        const error = new Error(errorMessage);
        throw error;
      }
      const recipes = await response.json();
      setRecipe();
      setRecipes(recipes);
    } catch (err) {
      console.error(`Error in fetch: ${err.message}`);
    }
  };

  const handleRandomClick = () => {
    getRandomRecipe();
  };

  const handleIndexClick = () => {
    getAllRecipes();
  };

  return (
    <div className="container">
      <h1>Sprout Fetcher</h1>
      <RandomSprout recipe={recipe} />
      <SproutsIndex recipes={recipes} />

      <div className="buttons">
        <button onClick={handleRandomClick} className="btn">
          Get Random Recipe
        </button>

        <button onClick={handleIndexClick} className="btn">
          See All Recipes
        </button>
      </div>
    </div>
  );
};

export default SproutsContainer;
