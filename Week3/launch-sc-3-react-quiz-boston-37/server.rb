require "sinatra"
require "json"
require "pry" if development? || test?
require "sinatra/reloader" if development?

set :bind, '0.0.0.0'  # bind to all interfaces
set :public_folder, File.join(File.dirname(__FILE__), "public")

get "/" do
  erb :home
end

get "/api/v1/question.json" do
  #For Exceeds Only
  #Use questions.json to pull a random question for your question data
end
