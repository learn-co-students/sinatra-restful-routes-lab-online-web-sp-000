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

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    
    @recipe = Recipe.create(params)
    redirect '/recipes/' + @recipe.id.to_s
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id].to_i)
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id].to_i)
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id].to_i)
    @recipe.title = params[:name]
    @recipe.content = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save 

    erb :show
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id].to_i)
    @recipe.destroy
  end
end
