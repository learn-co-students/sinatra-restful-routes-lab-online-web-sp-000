class CreateRecipes < ActiveRecord::Migration[4.2]

  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.float :cook_time
    end
  end
end

