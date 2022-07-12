require "sinatra"
require "sinatra/reloader" if development?
require "pry" if development? || test?
require "csv"

set :bind, '0.0.0.0'  # bind to all interfaces


# when using CSV.readlines or CSV.open, please use this in place of your file path 
# for the best experience if you need clarification on setup, please address an EE.


def csv_file_path
  if ENV["RACK_ENV"] == "test"
    "grocery_list_test.csv"
  else
    "grocery_list.csv"
  end
end



get "/" do 
  redirect "/groceries"
end

get "/groceries" do
  @food_things = CSV.readlines(csv_file_path,headers: true )
  erb :index
end


get "/groceries/new" do
  erb :new
end

post '/groceries' do
new_item = params[:Name]
  
  # binding.pry
  
  if new_item != ''
    CSV.open(csv_file_path,'a') do |csv|
      csv << [new_item]
    end
    redirect  '/'
  else
    redirect '/groceries/new'
  end

end