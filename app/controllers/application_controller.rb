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

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id].to_i)
    #binding.pry
    erb :recipe 
  end

  get '/recipes/new' do 
    erb :new
  end

  post '/new' do
    recipe = Recipe.create(:name => params[:name], :ingredients => params[:in], :cook_time => params[:cookTime])
    redirect "/recipes/#{recipe.id}"
  end

  get '/recipes/edit/:id' do
    @recipe = Recipe.find(params[:id].to_i)
    erb :edit
  end

  post "edit" do
    
  end

  get "/delete/:id" do
    @recipe = Recipe.find(params[:id].to_i)
    @recipe.delete
    redirect '/recipes'
  end

end
