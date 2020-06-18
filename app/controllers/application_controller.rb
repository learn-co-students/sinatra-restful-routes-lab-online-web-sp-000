class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    # create and save this new recipe to database

  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    
    erb :show
  end

  get '/recipes/:id/edit' do
    # update entry in the database
    # then redirect to the recipe show page
    @recipe = Recipe.find_by_id(params[:id])

    erb :edit
  end

  get '/recipes' do
    @recipes = Recipe.all
    
    erb :index
  end

  delete '/recipes/:id' do
    #deletes the entry from database
    # redicts to the index page
  end

end
