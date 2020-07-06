class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @new_recipe = Recipe.create(params)
    redirect to "/recipes/#{@new_recipe.id}"
  end

  delete '/recipes/:id' do
    @delete_recipe = Recipe.find_by_id(params[:id])
    @delete_recipe.delete
    redirect to '/recipes'
  end

  get '/recipes/:id/edit' do
    @edit_recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end


  get '/recipes/:id' do
    @show_recipe = Recipe.find(params[:id])
    erb :show
  end

  patch '/recipes/:id' do
    @patch_recipe = Recipe.find_by_id(params[:id])
    @patch_recipe.name = params[:name]
    @patch_recipe.ingredients = params[:ingredients]
    @patch_recipe.cook_time = params[:cook_time]
    @patch_recipe.save
    redirect to "/recipes/#{@patch_recipe.id}"
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

end
