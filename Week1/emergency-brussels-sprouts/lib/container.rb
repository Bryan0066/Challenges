require 'pry'

class Container
  attr_reader :weight, :maximum_holding_weight, :ingredients

  def initialize(weight, maximum_holding_weight)
    @weight = weight
    @maximum_holding_weight = maximum_holding_weight
    @ingredients = []
  end

  def fill_with_ingredient(ingredient_object)
    no_of_ingredient = @maximum_holding_weight / ingredient_object.weight

    @ingredients.push(ingredient_object) while ingredients.length < no_of_ingredient

    @weight += no_of_ingredient * ingredient_object.weight

  end

  def which_ingredient
    @ingredients[0].name
  end

  def how_many_ingredients
    @ingredients.length
  end

  def remove_one_ingredient
    @ingredients.pop(1)
  end

  def empty
    @ingredients = []
  end
  
end
