require "sinatra"
require "pg"
require "pry" if development? || test?
require "sinatra/reloader" if development?
require_relative "./app/models/article"

set :bind, '0.0.0.0'  # bind to all interfaces
set :views, File.join(File.dirname(__FILE__), "app", "views")

configure :development do
  set :db_config, { dbname: "news_aggregator_development" }
end

configure :test do
  set :db_config, { dbname: "news_aggregator_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end


# Put your News Aggregator server.rb route code here

get "/" do
  redirect "/articles"
end
 
get "/articles" do
  @articles = Article.all
  erb :index
end

get "/articles/new" do
  erb :new
end


post '/articles/new' do
  # Extract the relevant data from params
  @new_title = params[:title]
  @new_url = params[:url]
  @new_description = params[:description]

  
  @articles = Article.all
  @articles_array = []
  @articles.each do |article|
    @articles_array << article.to_s
  end

  # if @new_description.strip.empty? || @new_url.strip.empty? || @new_title.strip.empty?
  #     #sad_path
  #     @error = "Please completely fill out form"
  #     erb :new
  # elsif  !@new_url.include?("http") 
  #       @error_http = "Invalid URL"
  #       erb :new
  # elsif @new_description.length < 20
  #       @error_description = "Your description MUST have more than 20 characters. Please try again."
  #     erb :new
  #     elsif @articles_array.include?(@new_url.to_s)
  #       @error_dupe = "Article with same url already submitted"
  #       erb :new

  #   else
  #     #happy path
  
    @articles = Article.create(@new_title,@new_url,@new_description)
  
    redirect "/articles"
    
  end

end
# get "/articles" do
#   articles = Article.new
  
#   binding.pry
  
# end

get "/articles/:id" do
  @article_id = params[:id]
  @articles = Article.find(@article_id)

  erb :id

end
