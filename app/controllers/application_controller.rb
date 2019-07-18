class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  exclude_routes = %w[recipes/new recipes]
  before do
    @recipe = Recipe.find_by(id: get_id_from_path(request.path_info)) unless exclude_routes.include?(request.path_info)
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    recipe = Recipe.new(params)
      if recipe.save
        redirect to "/recipes/#{recipe.id}"
      else
        redirect '/recipes/new'
      end  
  end

  get '/recipes/:id' do
    erb :show
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id/edit' do 
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe.update(article_params(params))
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe.destroy
    redirect to '/recipes'
  end

  private
    def get_id_from_path(path)
      #if an edit request than is different than any other request.
      if path.include?("edit")
        path.split('/')[-2].to_i
      else
        path.split('/').last.to_i
      end
    end
  
end
