class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  # render a form to create a new recipe
  get '/recipes/new' do
    erb :new
  end

  # create and save recipe to database
  post '/recipes' do
    @recipe = Recipe.create(params)
    # (:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end



  # display a single recipe
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  # render form to edit
  get '/recipes/:id/edit' do  #load edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  # updates and entry in database, then redirects to recipe show page
  patch '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @article.ingredients = params[:ingredients]
    @article.cook_time = params[:cook_time]
    @article.save
    redirect to "/recipes/#{@recipe.id}"
  end

  # display all recipes
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # delete a recipe
  delete '/recipes/:id' do #delete action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
