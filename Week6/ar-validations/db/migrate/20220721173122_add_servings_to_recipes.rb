class AddServingsToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :servings, :integer , minimum: 1
  end
end
