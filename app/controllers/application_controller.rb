class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # Index route - show all recipes 
  get '/recipes' do
    # assigns all recipes to instance var 
    @recipes = Recipe.all 
    # render index erb 
    erb :index 
  end 
end
