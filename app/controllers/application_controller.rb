class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    erb :index #shows all the recipes
  end

  get '/recipes/:id' do

  end

  get '/recipes/:id/edit' do

  end

  patch '/recipes/:id/edit' do

  end

  get '/recipes/new' do

  end

end
