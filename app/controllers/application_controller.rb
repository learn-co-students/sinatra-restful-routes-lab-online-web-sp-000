class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #redirects to index
  get '/' do
    redirect '/recipes'
  end

  #index action
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #show form for new recipe
  get '/recipes/new' do
    erb :new_recipe
  end

  #receives params from form, creates new recipe, and directs user to show page to see recipe
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{Recipe.last.id}"
  end

  #retrieve/show specific recipe
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show_recipe
  end

  #edit a specific recipe and render a form
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect "/recipes/#{@recipe.id}"
  end

  #deletes a recipe

  delete '/recipes/:id' do
    Recipe.destroy(params[:id])
    redirects '/recipes'
  end

end
