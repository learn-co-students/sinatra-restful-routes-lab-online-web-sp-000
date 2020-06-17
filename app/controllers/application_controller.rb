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
    erb :create
  end

  post '/recipes' do
    Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{Recipe.last.id}"
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
    recipe = Recipe.find(:id)
    recipe.name = params[:name]
    recipe.ingredients = params[:ingredients]
    recipe.cook_time = params[:cook_time]
    recipe.save

    redirect "/recipes/#{:id}"
  end

  delete '/recipes/:id' do
    # binding.pry
    recipe = Recipe.find(params[:id])
    recipe.delete
    redirect '/recipes'
  end

  get '/recipes/:id/edit' do
    erb :edit
  end

end
