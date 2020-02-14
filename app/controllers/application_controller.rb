class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  # Index page '/recipes'
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  post  '/recipes' do
  end
  
  # new page '/recipes/new'
  get '/recipes/new' do
    erb :new_recipe
  end
  
  # Show page '/recipes/:id'
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show_recipe
  end
  
  patch '/recipes/:id' do
  end
  
  delete '/recipes/:id' do
  end

  # edit page '/recipes/:id/edit'
  get '/recipes/:id/edit' do
  end
end
