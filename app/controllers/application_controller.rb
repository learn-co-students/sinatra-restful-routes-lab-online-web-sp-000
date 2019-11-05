class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
      @recipes = Recipe.all
      erb :index
    end

  get '/recipes/:id' do  #loads show page
     @recipes = Recipe.find_by_id(params[:id])
     erb :show
   end

   get '/recipes/:id/edit' do #loads edit form
     @recipes = Recipe.find_by_id(params[:id])
     erb :edit
   end

   patch '/recipes/:id' do  #updates a recipe
       @recipes = Recipe.find_by_id(params[:id])
       @recipes.name = params[:name]
       @recipes.ingredients = params[:ingredients]
       @recipes.cook_time = params[:cook_time]
       @recipes.save
       redirect to "/recipes/#{@recipes.id}"
     end

 post '/recipes' do
   @recipes = Recipe.create(params)
   redirect to "recipes/#{@recipes.id}"
 end

 delete '/recipes/:id' do #destroy action
   @recipes = Recipe.find_by_id(params[:id])
   @recipes.delete
   redirect to '/recipes'
 end

end
