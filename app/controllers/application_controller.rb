class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do
    @recipes = Recipe.all
  
    erb :index
  end
  
  get '/recipes/:id' do
    
    @recipe = Recipe.all.find_by(params[:id])
    # binding.pry
    erb :show
  end

end
