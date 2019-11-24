class CreateRecipies < ActiveRecord::Migration
  def change
    create_table :recipies do |t|
      t.string :name
      t.string :ingredients
      t.integer :cook_time

      t.timestamps
    end
  end
end
