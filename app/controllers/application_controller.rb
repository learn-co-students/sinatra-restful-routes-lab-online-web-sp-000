require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  # create a new recipe
  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    new_recipe = Recipe.new(params)
    if new_recipe.save
      redirect "/recipes/#{new_recipe.id}"
    else
      erb :error
    end
  end

  # display all recipes

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # delete a recipe
  delete '/recipes/:id' do
    Recipe.find(params[:id]).destroy
    redirect '/recipes'
  end

  # edit a recipe
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id/edit' do
    recipe = Recipe.find(params[:id])
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save
    redirect "/recipes/#{recipe.id}"
  end
  # display a recipe
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :recipe
  end

end
