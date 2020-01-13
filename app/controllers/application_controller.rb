class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #Index
  get '/' do
    @recipes = Recipe.all
    erb.index
  end


end
