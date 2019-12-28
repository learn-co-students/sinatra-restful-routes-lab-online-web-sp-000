class ChangeCookTikeColumn < ActiveRecord::Migration
  def change
    rename_column :recipes, :cook_tike, :cook_time
end
end
