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
  @recipe=Recipe.find_by(params[:id])
  erb :show
end

delete '/recipes/:id' do
  @recipe=Recipe.find_by(params[:id])
  recipe.destroy
  redirect to '/recipes'
end

get '/recipes/:id/edit' do
  @recipe=Recipe.find_by(params[:id])
  erb :edit
end

get '/recipes/new' do
  erb :new
end

post '/recipes/new' do

end



end
