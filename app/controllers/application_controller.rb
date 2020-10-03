class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #CREATE

    # new action
    get '/recipes/new' do
      erb :new
    end

    post '/recipes' do
      recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
      redirect "/recipes/#{recipe.id}"
    end

  #READ

    get '/' do
      redirect '/recipes'
    end

    # index action
    get '/recipes' do
      @recipes = Recipe.all
      erb :index
    end

    # show action
    get '/recipes/:id' do
      @recipe = Recipe.find(params[:id])
      erb :show
    end

  #UPDATE

    # edit action
    get '/recipes/:id/edit' do
      @recipe = Recipe.find(params[:id])
      erb :edit
    end

    patch '/recipes/:id' do
      recipe = Recipe.find(params[:id])
      recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
      redirect "/recipes/#{recipe.id}"
    end

  #DELETE

    # delete action
    delete '/recipes/:id' do
      Recipe.destroy(params[:id])
      redirect "/recipes"
    end

end
