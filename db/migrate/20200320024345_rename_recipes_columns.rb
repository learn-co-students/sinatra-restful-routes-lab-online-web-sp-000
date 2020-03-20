class RenameRecipesColumns < ActiveRecord::Migration
  def change
    rename_column :recipes, :name, :recipe_name
    rename_column :recipes, :ingredients, :recipe_ingredients 
    rename_column :recipes, :cook_time, :recipe_cook_time 
  end
end
