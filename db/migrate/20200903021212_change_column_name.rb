class ChangeColumnName < ActiveRecord::Migration
  def change
  	change_table :recipes do|t|
  		t.rename :name, :recipe_name
  	end
  end
end
