class FixStupidCookTime < ActiveRecord::Migration
    def change
        change_column :recipes, :cook_time, :text
    end
end