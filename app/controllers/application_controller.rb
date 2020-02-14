class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # # code actions here!
  # get '/recipes' do
  #   erb :index
  # end
  
  # Index page '/recipes'
  get  '/recipes' do
  end
  
  post  '/recipes' do
  end
  
  # new page '/recipes/new'
  get '/recipes/new' do
  end
  
  # Show page '/recipes/:id'
  get '/recipes/:id' do
  end
  
  patch '/recipes/:id' do
  end
  
  delete '/recipes/:id' do
  end

  # edit page '/recipes/:id/edit'
  get '/recipes/:id/edit' do
  end
end
