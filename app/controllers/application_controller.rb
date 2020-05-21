class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

get '/' do 
end 

get '/recipes/new' do
  erb :new
end

post '/recipes' do
@recipes=Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
@recipes.name=params[:name]
@recipes.ingredients=params[:ingredient]
@recipes.cook_time=params[:cook_time]
redirect to "/recipes/#{@recipes.id}"
end

get '/recipes' do 
  @recipes=Recipe.all
  erb :index
end

get '/recipes/:id' do 
  @recipes=Recipe.find_by_id(params[:id])
  erb :show
end

get '/recipes/:id/edit' do
  @recipes=Recipe.find_by_id(params[:id])
  erb :edit
end

patch '/recipes/:id' do
  @recipes=Recipe.find(params[:id])
  @recipes.update(params[:recipe])
  @recipes.save
  redirect "/recipes/#{@recipes.id}"
 end
 
 delete '/recipes/:id' do
  @recipes=Recipe.find_by_id(params[:id])
  @recipes.destroy
  redirect '/recipes'
 end


end
