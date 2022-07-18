require "sinatra"
require "sinatra/json"
require "json"
require "sinatra/reloader" if development?
require "pry" if development? || test?

set :bind, '0.0.0.0'

get "/api/v1/random-number" do 
  randomNumber = rand(1..15)
  json randomNumber
end

get "*" do 
  erb :home
end