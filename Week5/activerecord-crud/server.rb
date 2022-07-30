require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require "sinatra/reloader" if development?
require "pry" if development? || test?
require 'faker'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

configure do
  set :views, 'app/views'
end

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
  also_reload file
end

get '/articles' do
  @articles = Article.all 
  # binding.pry
  erb :index
end

get '/one_article' do
  # with create
  # @article = Article.create(subject: "Google has a new logo", story: "Check it out!")

    # with new and save
  # @article =  Article.new(subject: "Everybody loves cats", story: "https://www.youtube.com/watch?v=LNWjZcbv2uI#nf" )
  # @article.save
  # binding.pry
  erb :index
end

get "/other_crud" do 
  # experiment with other crud methods here if you like! 

  return "this endpoint is for experiment with CRUD in the server.rb"
end
