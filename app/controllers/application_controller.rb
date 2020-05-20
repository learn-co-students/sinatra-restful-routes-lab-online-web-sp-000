class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect "/recipes"
  end

  # Create Routes
	get '/recipes/new' do
		erb :new
	end
  
  post '/recipes' do
    # @recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    @recipe = Recipe.new(params)
		@recipe.save
		redirect "/recipes/#{@recipe.id}"
	end	


  # Read/Retrieve Routes
	get '/recipes' do
		@recipes = Recipe.all
		erb :index
	end
  
  get '/recipes/:id' do
		@recipe = Recipe.find(params[:id])
		erb :show
	end


  # Update Routes
	get '/recipes/:id/edit' do
		@recipe = Recipe.find(params[:id])
		erb :edit
	end

	patch '/recipes/:id' do
		@recipe = Recipe.find(params[:id])
		
		@recipe.name = params[:name] if params[:name] !=""
		@recipe.ingredients = params[:ingredients] if params[:ingredients] !=""
		@recipe.cook_time = params[:cook_time] if params[:cook_time] !=""
		
		@recipe.save
			
		redirect "recipes/#{@recipe.id}"
	end


  # Destroy Routes  
	delete '/recipes/:id' do
		Recipe.destroy(params[:id])
	  redirect "/recipes"
  end
end
