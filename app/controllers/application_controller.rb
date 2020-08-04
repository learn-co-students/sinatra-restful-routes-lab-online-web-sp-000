class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all()
    erb :index
  end

  # Render form to create new recipe
  get '/recipes/new' do
    erb :new
  end

  # create & save recipe
  post '/recipes' do
    @recipe = Recipe.create(params)
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.name = params[:name]
    @recipe.cook_time = params[:cook_time]
    @recipe.ingredients = params[:ingredients]
    @recipe.save
    puts @recipe.id
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end

  
  # Create a controller action (index action) that 
  # displays all the recipes in the database.

end
