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
    # assigns all recipes to instance var 
    @recipes = Recipe.all 
    # render index erb 
    erb :index 
  end 
  
  # render the form * Static routes must be listed before Dynamic *
  get '/recipes/new' do 
    
    erb :new
  end
  
  # create route 
  post '/recipes' do 
    @recipe = Recipe.new(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    @recipe.save 
    redirect to "/recipes/#{@recipe.id}"
  end 
  
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
   
    erb :show 
  end 

  delete '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete 
    
    redirect to "/recipes/"
  end
  
end
