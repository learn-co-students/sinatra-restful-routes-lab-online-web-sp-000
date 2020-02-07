class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  
  get "/recipes" do 
    @recipes = Recipe.all
    erb :index
  end
  
  get "/recipes/new" do 
    erb :new
  end
  
  
  post "/recipes" do 
    name = params[:name]
    ingredients = params[:ingredients]
    cook_time = params[:cook_time].to_i
    @recipe = Recipe.new(name: name, ingredients: ingredients, cook_time: cook_time)
    @recipe.save
    redirect "/recipes/"
  end
  

end
