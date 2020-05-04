class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

	# => Index action
	get '/recipes' do
		@recipes = Recipe.all
		erb :index
	end

	# => Create new recipes
	get '/recipes/new' do

		erb :new
	end

	post '/recipes' do
		@recipe = Recipe.create(params)
		redirect "/recipes/#{@recipe.id}"
	end

	# => Read one recipe
	get '/recipes/:id' do
		@recipe = Recipe.find(params[:id])

		erb :show
	end

	# => Update a recipe
	get '/recipes/:id/edit' do
		@recipe = Recipe.find(params[:id])

		erb :edit
	end

	patch '/recipes/:id' do
		@recipe = Recipe.find(params[:id])

		@recipe.update(params[:recipe])

		redirect "/recipes/#{@recipe.id}"
	end

	# => Delete a recipe
	delete '/recipes/:id' do
		Recipe.destroy(params[:id])

		redirect "/recipes"
	end

end
