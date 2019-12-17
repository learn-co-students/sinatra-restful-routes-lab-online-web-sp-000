#Placeholder for a model
class Recipe < ActiveRecord::Base
    @@all = []

   

    def delete
        Recipe.where(name: self.name).destroy_all
    end
end