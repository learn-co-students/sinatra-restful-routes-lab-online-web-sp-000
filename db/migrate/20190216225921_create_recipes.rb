class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :ingredients, null: false
      t.string :cook_time, null: false
      t.timestamps null: false
    end
  end
end