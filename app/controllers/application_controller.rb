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
  
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
  
  post '/recipes' do
    recipe = Recipe.create(params)
    redirect "/recipes/#{recipe.id}"
  end
  
  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.name = params[:name]
    recipe.cook_time = params[:cook_time]
    recipe.ingredients = params[:ingredients]
    recipe.save
    redirect "/recipes/#{recipe.id}"
  end
  
  delete '/recipes/:id' do
    Recipe.find(params[:id]).destroy
  end

end
