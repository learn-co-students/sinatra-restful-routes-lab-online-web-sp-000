class CreateRecipes < ActiveRecord::Migration[5.2]
  def up
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.string :cook_time
    end
  end
 
  def down
    drop_table :recipes
  end
end
