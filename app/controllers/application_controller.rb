require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/recipes' do 
    @recipe = Recipe.all
    erb :index
  end 

  post '/recipes' do 
    @recipie = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect to "/recipes/#{@recipes.id}"
  end 

  get 'recipes/:id' do 
    @recipie = Recipe.find_by_id(params[:id])
    erb :show
  end 

  delete '/recipes/:id' do 
    @recipie = Recipe.find_by_id(params[:id])
    @recipie.delete
    redirect to '/recipes'
  end




end
