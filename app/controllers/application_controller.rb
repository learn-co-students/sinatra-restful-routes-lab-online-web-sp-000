class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

 get '/recipes' do
  @recipes = Recipe.all
  erb :index
 end
 
 
 get '/recipes/new' do 
    
    erb :new
  end
  
 get '/recipes/:id' do
   @recipe= Recipe.find_by(params[:id])
   erb :show
 end

  get '/recipes/:id/edit' do 
    @recipe= Recipe.find_by(params[:id])
    erb :edit
  end
  
  patch '/articles/:id' do #edit action
  @recipe = Recipe.find_by(params[:id])
  @recipe.ingredients = params[:ingredients]
  @recipe.cook_time = params[:cook_time]
  @recipe.save
  #redirect to "/recipes/#{@recipe.id}"
  end
  

  
  
  
  
  
  
  
  
  
  
  
end
