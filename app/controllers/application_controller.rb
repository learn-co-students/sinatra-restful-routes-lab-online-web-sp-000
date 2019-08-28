class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  post '/recipes' do
    @recipe = Recipe.create(params)

    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])

    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])

    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])

    @recipe.tap do |r|
      r.name = params[:name]
      r.ingredients = params[:ingredients]
      r.cook_time = params[:cook_time]
      r.save
    end

    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    recipe = Recipe.find_by(id: params[:id])
    recipe.destroy

    redirect '/recipes'
  end

end
