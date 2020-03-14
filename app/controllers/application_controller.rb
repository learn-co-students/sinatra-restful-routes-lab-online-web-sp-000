class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  get "/recipes" do
    erb :recipes
  end

  get "/recipes/new" do
    erb :new
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  delete "/recipes/:id" do
    Recipe.delete(params[:id])
    redirect "/recipes"
  end

  get "/recipes/:id/edit" do
    erb :edit
  end

  post "/recipes" do
    recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    redirect "/recipes/#{recipe.id}"
  end

  patch "/recipes/:id" do
    Recipe.find(params[:id]).update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    redirect "/recipes/#{params[:id]}"
  end

  helpers do
    def current_recipe
      Recipe.find(params[:id])
    end
  end
end
