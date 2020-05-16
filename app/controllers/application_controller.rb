class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    "hello"
  end
  
  get '/recipes/new' do
    erb :new
  end


  get '/recipes' do 
    @recipes = Recipe.all
    # @recipe = Recipe.find_by_id(params[:id])
    #  binding.pry
    erb :recipes
  end

  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect "/recipes"
    
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  get '/recipes/:id:edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end


  # patch '/recipes/:id' do
  #   @recipe = Recipe.find(params[:id])
  #   @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    
  #   redirect to "/recipes/#{@recipe.id}"
  #   erb :show
  # end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    erb :show
  end

  get '/show' do
    erb :show
  end


end
