class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all

    erb :index
  end

  post '/recipes' do
    recipe = Recipe.new(params)
    recipe.save

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

  patch '/recipes/:id' do
    id = params[:id]

    new_params = Hash.new
    old_object = Recipe.find(id)
    new_params[:name] = params[:name]
    new_params[:ingredients] = params[:ingredients]
    new_params[:cook_time] = params[:cook_time]
    old_object.update(new_params)

    redirect "/recipes/#{id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect "/recipes"
  end
end
