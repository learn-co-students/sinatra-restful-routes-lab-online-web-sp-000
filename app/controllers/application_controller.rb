class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

get "/" do 
  redirect to "/recipes"
end

get '/recipes' do
  erb :index
end

get "/recipes/:id" do
  erb :show
end

get '/recipes/:id/edit' do
  erb :edit
end

get '/recipes/new' do
  erb :new
end



end
