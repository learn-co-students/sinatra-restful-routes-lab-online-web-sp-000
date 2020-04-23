
require_relative '../models/recipe'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    new_recipe = Recipe.create(params)
    redirect "/recipes/#{new_recipe.id}"
  end

  get '/recipes/:id' do
    @selected_recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes' do
    @all_recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id/edit' do
    @selected_recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id/edit' do
    selected_category = Recipe.find(params[:id])
    selected_category.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{selected_category.id}"
  end

  delete '/recipes/:id' do
    recipe_for_deletion = Recipe.find(params[:id])
    recipe_for_deletion.destroy
    redirect '/recipes'
  end

end
