class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Render a form to create a new recipe. This controller action
  # should create and save this new recipe to the database
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(
        :name => params[:name],
        :ingredients => params[:ingredients],
        :cook_time => params[:cook_time]
      )
      redirect "/recipes/#{@recipe.id}"
  end

  # create a controller action that uses RESTful routes to display a single recipe
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  # renders a form to edit a single recipe.
  # This controller action should update the entry in the database
  # with the changes, and then redirect to the recipe show page.
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save

    redirect "/recipes/#{recipe.id}"
  end

  # Create a controller action (index action) that displays all the recipes in the database
  get '/recipes' do
    @recipe = Recipe.all
    erb :index
  end

  # deletes the entry from the database and redirects to the index page
  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect "/recipes"
  end



end
