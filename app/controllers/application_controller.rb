class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  # Index page '/recipes'
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/" + @recipe.id.to_s
  end
  
  # new page '/recipes/new'
  get '/recipes/new' do
    erb :new_recipe
  end
  
  # edit page '/recipes/:id/edit'
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit_recipe
  end
  
  # Show page '/recipes/:id'
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show_recipe
  end
  
  patch '/recipes/:id' do
    recipe = Recipe.find_by_id(params[:id])
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save
    redirect "/recipes/" + @recipe.id.to_s
  end
  
  delete '/recipes/:id' do
    Recipe.find_by_id(params[:id]).delete
    redirect '/recipes'
  end
end
