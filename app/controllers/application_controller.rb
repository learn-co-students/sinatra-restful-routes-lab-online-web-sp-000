class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    # create and save this new recipe to database

  end

  get '/recipes/:id' do
    # display a single recipe
  end

  get '/recipes/:id/edit' do
    # update entry in the database
    # then redirect to the recipe show page
  end

  get '/recipes' do
    @recipes = Recipe.all
    # binding.pry
    erb :index
  end

  delete '/recipes/:id' do
    #deletes the entry from database
    # redicts to the index page
  end

end
