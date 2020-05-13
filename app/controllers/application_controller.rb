class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes/new' do 
    erb :new
  end

  post '/recipes' do 
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do 
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit
  end

  # update 
  patch '/recipes/:id' do 
    recipe = Recipe.find(params[:id])
    params.delete("_method")
    recipe.update(params)
    redirect "/recipes/#{params[:id]}"
  end

  get '/recipes' do 
    @recipes = Recipe.all
    erb :index 
  end

  # delete 
  delete '/recipes/:id' do 
    Recipe.destroy(params[:id])
    redirect '/recipes'
  end

end
