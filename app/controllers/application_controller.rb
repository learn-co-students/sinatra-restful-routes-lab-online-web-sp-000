class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
end

get '/recipes/new'  do #loads new form .erb
  erb :new
end

post '/recipes' do  #creates a recipe
  @recipe = Recipe.create(params)
  redirect to "/recipes/#{@recipe.id}" #show page
end

get '/recipes' do #loads index page .erb
  @recipes  = Recipe.all
  erb :index
end

get '/recipes/:id' do #loads show page .erb
  @recipe = Recipe.find_by_id(params[:id])
  erb :show
end

get '/recipes/:id/edit' do #loads edit form
  @recipe = Recipe.find_by_id(params[:id])
  erb :edit
end

patch '/recipes/:id' do  #updates a recipe
  @recipe = Recipe.find_by_id(params[:id])

  @recipe.name = params[:name]
  @recipe.ingredients = params[:ingredients]
  @recipe.cook_time = params[:cook_time]

  @recipe.save

  redirect to "/recipes/#{@recipe.id}" #redirect to show
end


delete '/recipes/:id' do #destroy action 
  @recipe = Recipe.find_by_id(params[:id])
  @recipe.delete
  redirect to '/recipes' #index page
end

end
