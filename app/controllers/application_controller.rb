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

  post '/recipes' do    #create action
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
  end

  #show action, display a single recipe
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  #renders a form to edit a single recipe
  get '/recipes/:id/edit' do     #load edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  #update the entry in the database with the changes
  patch '/recipes/:id' do   #edit action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  #(index action) that displays all the recipes in the database.
  get '/recipes' do
    erb :recipes
  end

  #Add to the recipe show page a form that allows a user to delete a recipe
  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end
