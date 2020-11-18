class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  #renders form to create new recipe, should create and save this new recipe to the database.
  get '/recipes/new' do
    erb :new
  end

  #RESTful routes to display a single recipe.
  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  #RESTful routes and renders a form to edit a single recipe
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  #(index action) that displays all the recipes in the database.
  get '/recipes' do
    erb :recipes
  end

end
