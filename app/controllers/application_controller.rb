class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    new_recipe = Recipe.create(params)
    redirect "/recipes/#{new_recipe.id}"
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
    patched_recipe = Recipe.find(params[:id])
    patched_recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{patched_recipe.id}"
  end

  put '/recipes/:id' do
    patched_recipe = Recipe.find(params[:id])
    patched_recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{patched_recipe.id}"
  end

  delete '/recipes/:id' do
    deleted_recipe = Recipe.find(params[:id])
    deleted_recipe.delete
    redirect '/recipes'
  end
end
