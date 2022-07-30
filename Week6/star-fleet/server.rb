require 'sinatra'
require_relative 'config/application'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

# Any classes you add to the models folder will automatically be made available in this server file

get '/' do
  redirect '/starships'
end

get '/starships' do
  # Use a custom Starship class that inherits from ActiveRecord to retrieve your database objects
  # You should be using ActiveRecord CRUD methods to aid you.
  # E.g. Planet.where(planet_type: "gas giant"), etc.
  
  @ships = Ship.all

  erb :'starships/index'
end


get '/starships/new' do
  erb :'starships/new'
end

post '/starships/new' do
  @ships = Ship.all
  @ship_array = []
  @ships.each do |ship|
    @ship_array << ship.to_s
  end
  
  @new_name = params[:name]
  @new_class = params[:ship_class]
  @new_location = params[:location]
  
  if @new_name.strip.empty? || @new_class.strip.empty? || @new_location.strip.empty?
    @error = "You did not fill in ALL of the forms. Please try again."
    erb :'starships/new'
  else
   @new_ship =  Ship.create(name: @new_name, ship_class: @new_class, location: @new_location)
   @new_ship.save
      flash[:notice] = 'Ship was successfully created.'
    redirect "/starships"
  end
end


get '/starships/:id' do

  @ship = Ship.find(params[:id])
  erb :'starships/show'
end