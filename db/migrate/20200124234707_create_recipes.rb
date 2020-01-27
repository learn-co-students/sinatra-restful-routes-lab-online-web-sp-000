class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes |do|
    t.string :ingredients
    t.string :cook_time
  end
end

end