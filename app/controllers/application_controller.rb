class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get"/" do
    redirect "/recipes"
  end

  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  post "/recipes" do
    if !!params[:recipe]
      @recipe = Recipe.create(params[:recipe])
    else
      @recipe = Recipe.create(params)
    end
    redirect "/recipes/#{@recipe.id}"
  end

  get "/recipes/new" do
    erb :new
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  patch "/recipes/:id" do
    recipe = Recipe.find(params[:id])
    recipe.update(params[:recipe])
    redirect "/recipes/#{recipe.id}"
  end

  delete "/recipes/:id" do
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect "/recipes"
  end

end
