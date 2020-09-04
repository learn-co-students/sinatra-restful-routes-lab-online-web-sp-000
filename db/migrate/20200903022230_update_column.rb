class UpdateColumn < ActiveRecord::Migration
  def change
  	change_table :recipes do|t|
    t.rename :recipe_name, :name
  	end
  end
end
