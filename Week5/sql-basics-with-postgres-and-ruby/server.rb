# server.rb
require "sinatra"
require "pg"

set :bind, '0.0.0.0'  # bind to all interfaces

# server.rb
require "sinatra"
require "pg"

set :bind, '0.0.0.0'  # bind to all interfaces

def db_connection
  begin
    connection = PG.connect(dbname: "pet_db")
    yield(connection)
  ensure
    connection.close
  end
end

get "/pets" do
    # Retrieve the name of each pet from the database
    @pets = db_connection { |conn| conn.exec("SELECT id, name FROM pets") }
    erb :index
  end
  
  post "/pets" do
    pet = params["pet_name"]
  
    # Insert new pet into the database
    db_connection do |conn|
      conn.exec_params("INSERT INTO pets (name) VALUES ($1)", [pet])
    end
  
    redirect "/pets"
  end