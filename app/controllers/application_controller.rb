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
    recipe = Recipe.create(params)
    redirect "/recipes/#{recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  delete '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect '/recipes'
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    new_info = {name: params[:name], cook_time: params[:cook_time], ingredients: params[:ingredients]}
    @recipe.update(new_info)
    redirect "/recipes/#{@recipe.id}"
  end
end
