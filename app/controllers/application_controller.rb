class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get 'recipes/new' do 
    erb :new 
    end

  get  '/recipes' do  
    @recipes = Recipe.all
    erb :index 
  end 

  post '/recipes' do 
    @recipe = Recipe.new(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
    end
  end

get '/recipes/:id' do 
  binding.pry
   @recipe = Recipe.find_by(params[:id]) 
  
   erb :show
end