class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get "/recipes" do
    erb :index
  end

  get "/recipes/new" do
    erb :new
  end

  get "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get "/recipes/:id/edit" do
    @recipe = Recipe.find_by(:id=>params[:id])
    erb :edit
  end

  post "/recipes" do
    @recipe = Recipe.new(:name=>params[:name], :ingredients=>params[:ingredients], :cook_time=>params[:cook_time])
    if @recipe.save
      redirect "/recipes/#{@recipe.id}"
    end
  end

  patch "/recipes/:id" do
    @recipe = Recipe.find_by(:id=>params[:id])
    @recipe.update(params)
    redirect "/recipes/#{@recipe.id}"
  end

  delete "/recipes/:id" do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect "/recipes"
  end


end
