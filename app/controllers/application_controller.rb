class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get "/" do
    erb :index
  end

  get "/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get "/new" do
    :new
  end

  get "/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  post "/recipes" do
    Recipe.new(params)
    if recipe.save
      redirect "/"
    end
  end

  patch "/:id" do

  end

  delete "/:id" do

  end


end

end
