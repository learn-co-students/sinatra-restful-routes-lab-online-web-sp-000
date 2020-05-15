class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    @recipes = Recipe.all
    erb :recipes
  end
  
  get '/recipes/new' do
    erb :new
  end


  get '/recipes' do 
    @recipes = Recipe.all
    #  binding.pry
    erb :recipes
  end

  post '/recipes' do
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    redirect "/recipes"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/show' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end


end
