class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Index route - show all recipes 
  get '/recipes' do
    # assigns all recipes to instance var 
    @recipes = Recipe.all 
    # render index erb 
    erb :index 
  end 
  
  get '/recipes/:id' do
  end 
  
  # render the form 
  get '/recipes/new' do 
    
    erb :'/recipes/new'
  end
  
  # create route 
  post '/recipes' do 
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    
    
  end 
  
end
