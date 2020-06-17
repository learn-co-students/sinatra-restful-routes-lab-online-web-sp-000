class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do 
    redirect to "/recipes"
  end 

  # Show all recipes in index
  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end 

  # Form to create a new recipe
  get '/recipes/new' do 
    erb :new
  end 

  # Post the new recipe 
  post '/recipes' do 
    @recipe = Recipe.create(params)
    puts params
    redirect to "/recipes/#{@recipe.id}"
  end 
    
  # Show new recipe
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  # Edit the recipe
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    puts params
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect to '/recipes'


  end

end
