class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

get '/recipes' do
  @recipes = Recipe.all
  erb :index
end

get '/recipes/:id' do
  @recipe = Recipe.find_by(params[:id])
  erb :show
  #display's recipe's name, ingredients, and cook_time
  #has a delete button
end

get '/recipes/:id/edit' do

end
#not sure if I need the patch one
patch '/recipes/:id' do

end

get '/recipes/new' do

end

  # code actions here!

end
