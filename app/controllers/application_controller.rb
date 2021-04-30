class ApplicationController < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes/new'
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    erb :index
  end

  post '/recipes' do

  end

end
