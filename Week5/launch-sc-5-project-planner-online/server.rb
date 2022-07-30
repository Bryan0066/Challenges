require 'sinatra'
require_relative 'config/application'
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions


get "/" do
  redirect "/projects"
end

get "/projects" do
  @projects = Project.all
  erb :index
end


get "/projects/:id" do
  @project = Project.find(params[:id])
  @users = @project.users
  erb :show
end