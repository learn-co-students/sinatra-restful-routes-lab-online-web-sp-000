#Placeholder for a model
class Recipe < ActiveRecord::Base
  @@all = []

  def self.all
    @@all
  end

end
