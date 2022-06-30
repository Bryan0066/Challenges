require 'sinatra'

require "pry" if development? || test?
require "sinatra/reloader" if development?
require 'csv'


set :bind, '0.0.0.0'  # bind to all interfaces

get '/ingredients' do
  # binding.pry
  @ingredients = CSV.readlines('ingredients.csv')
  erb :index
end

post '/ingredients' do
  ingredient = params['ingredient']

  File.open('ingredients.csv', 'a') do |file|
    # 'a' = append
    file << ingredient
  end

  redirect '/ingredients'
  # refreshes the page to see new data
end
