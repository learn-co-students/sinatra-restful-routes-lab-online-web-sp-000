class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get  '/recipes/new' do
    #form to create a new recipe
    erb :new
  end

  post '/recipes' do
  #create new recipe and add to database
    newrecipe = Recipe.new(params)
    newrecipe.save
    #when everthings finished, this should redirect to show that recipe's show page
    #erb :temp
    redirect to "/recipes/#{newrecipe.id}"
  end

  get '/recipes/:id' do
    @therecipe = Recipe.find_by(id: params[:id])

    if @therecipe #if found
      erb :show
    else 
      "Recipe not found"
    end

  end

  get '/recipes/:id/edit' do
    @therecipe = Recipe.find_by(id: params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    therecipe = Recipe.find_by(id: params[:id])
    therecipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{therecipe.id}"
  end


  get '/recipes' do
    #list all recipes and link
    @recipes = Recipe.all 
    erb :index
  end

  delete '/recipes/:id' do
    therecipe = Recipe.find_by(id: params[:id])
    therecipe.destroy
    redirect '/recipes'
  end


  



end
