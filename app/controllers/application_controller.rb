class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  
  get '/' do 
    erb :welcome
  end 

  # Index route - show all recipes 
  get '/recipes' do
    @recipes = Recipe.all 
   
    erb :index 
  end 
  
  # render the form to create new recipe 
  get '/recipes/new' do 
    
    erb :new
  end
  
  # create route to create recipe 
  post '/recipes' do 
    @recipe = Recipe.new(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    @recipe.save 
    
    redirect to "/recipes/#{@recipe.id}"
  end 
  
  # find recipe by id , render show page 
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
   
    erb :show 
  end 

  # delete recipe by id , redirect to index 
  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete 
    
    redirect to "/recipes"
  end
  
  
  get '/recipes/:id/edit' do # load edit 
    @recipe = Recipe.find_by_id(params[:id]) 
    
    erb :edit 
  end 
  
  
  patch '/recipes/:id/edit' do # edit form 
    @recipe = Recipe.find_by_id(params[:id]) 
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save 
    
    redirect to "/recipes/#{@recipe.id}"
  end 
  
end





