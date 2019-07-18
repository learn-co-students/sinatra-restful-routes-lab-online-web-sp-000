class ChangeCookTimeToInteger < ActiveRecord::Migration[5.2]
  def up
    change_column :recipes, :cook_time, :string
  end

  def down
    change_column :recipes, :cook_time, :integer
  end 
end
