class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

get "/" do
  redirect to "/recipes/new"
end

get '/recipes/new' do
  erb :new
end

post '/recipes' do
  @recipe = Recipe.new(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
  redirect to '/recipes/new'
end

get '/recipes' do
  @recipes = Recipe.all
  erb :index
end

get '/recipes/:id' do
  @recipe = Recipe.find_by(params[:id])
  erb :show
end

get '/recipes/:id/edit' do
  @recipe = Recipe.find_by(params[:id])
  erb :edit
end
#not sure if I need the patch one
patch '/recipes/:id' do
  @recipe = Recipe.find_by(params[:id])
  @recipe.name = params[:name]
  @recipe.ingredients = params[:ingredients]
  @recipe.cook_time = params[:cook_time]
  @recipe.save
  redirect to "/recipes/#{@recipe.id}"
end

  # code actions here!

end
