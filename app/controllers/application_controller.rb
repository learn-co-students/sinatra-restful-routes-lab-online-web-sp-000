class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #Index
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #New
  get '/recipes/new' do
    erb :new
  end

  #Create
  post '/recipes' do

  end

  #Show
  get '/recipes/:id' do

  end

  #Edit
  get '/recipes/:id/edit' do

  end

  #Update
  patch '/recipes/:id' do

  end

  #Destroy
  delete '/recipes/:id' do

  end
  



end
