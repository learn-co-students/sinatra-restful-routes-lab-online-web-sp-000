class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get "/" do
    :index
  end
  
  get "/new" do
    :new
  end

  post "/recipes" do
    redirect "/"
  end

end
