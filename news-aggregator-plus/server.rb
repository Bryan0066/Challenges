require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'csv'


set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
    redirect "/articles"
end

get "/articles" do
    @article = CSV.readlines('articles.csv', headers: true)
    erb :articles
end

get "/articles/new" do
    erb :articles_new
end

get "/error" do
    erb :error
end


post '/articles' do
    # Extract the relevant data from params
    new_title = params[:title]
    new_description = params[:description]
    new_url = params[:url]
    
    if new_title != "" && new_description != "" && new_url != ""
    #happy path
    CSV.open("articles.csv", "a") do |csv|
      csv << [new_title, new_description, new_url]
    end
    redirect "/articles"

    else
    #sad path
    redirect "/error"
    end

end