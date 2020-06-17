class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |g|
      g.string :name
      g.string :ingredients
      g.string :cook_time
    end
  end
end
