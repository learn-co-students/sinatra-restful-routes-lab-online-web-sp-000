require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do 
    erb :new
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id].to_i)
    erb :edit
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id].to_i)
    #binding.pry
    erb :recipe 
  end

  delete "/recipes/:id" do
    @recipe = Recipe.find(params[:id].to_i)
    @recipe.delete
    redirect to '/recipes'
  end

  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
   # binding.pry
    redirect to "/recipes/#{@recipe.id}"
  end

  post '/recipes/new' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
   # binding.pry
    redirect to "/recipes/#{@recipe.id}"
  end

  patch "/recipes/:id/edit" do
    @updated = Recipe.find(params[:id])
    @updated.name = params[:name]
    @updated.ingredients = params[:ingredients]
    @updated.cook_time = params[:cook_time]
    @updated.save
   # binding.pry
    redirect to "/recipes/#{@updated.id}"
  end

end
