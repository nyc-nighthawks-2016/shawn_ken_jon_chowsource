class DropTableRecipeIngredients < ActiveRecord::Migration
  def change
  	drop_table :recipe_ingredients
  end
end
