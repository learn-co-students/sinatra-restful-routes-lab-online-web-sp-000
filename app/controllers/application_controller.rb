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

get '/recipes/' do
  redirect to '/recipes'
end

get '/recipes/new' do
  erb :new
end

get "/recipes/:id" do
  @recipe=Recipe.find(params[:id])
  erb :show
end

post '/recipes' do
  @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
  redirect to '/recipes/#{@recipe.id}'
end

delete '/recipes/:id' do
  @recipe=Recipe.find(params[:id])
  recipe.destroy
  redirect to '/recipes'
end

get '/recipes/:id/edit' do
  @recipe=Recipe.find(params[:id])
  erb :edit
end





end
