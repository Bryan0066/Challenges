require "sinatra"
require "sinatra/json"
require "json"

require "pry" if development? || test?
require "sinatra/reloader" if development?

set :bind, '0.0.0.0'  # bind to all interfaces

CURRENT_FILE_PATH = File.dirname(__FILE__)

def parsed_books_json_data
  data = File.read(CURRENT_FILE_PATH + "/books.json")
  JSON.parse(data)
end

def get_next_book_id
  books = parsed_books_json_data["books"]
  book_with_highest_id = books.max_by { |book| book["id"] }
  highest_book_id = book_with_highest_id["id"]
  highest_book_id + 1
end

def update_books_json_data(books)
  data = { books: books }
  json_formatted_data = JSON.pretty_generate(data, indent: '  ')
  File.write(CURRENT_FILE_PATH + '/books.json', json_formatted_data)
end

before do
  headers({ "Access-Control-Allow-Origin" => "*" })
end

get "/" do
  erb :index
end

get "/books.json" do
  status 200
  json parsed_books_json_data
end

post "/books.json" do
  parsed_data = JSON.parse(request.body.read)
  book_name = parsed_data["book"]["title"]
  if !book_title.empty?
    book = {
      id: get_next_book_id,
      title: book_title
    }
    books = parsed_books_json_data["books"]
    books.push(book)
    update_books_json_data(books)

    status 201
    json({ book: book })
  else
    status 422
    json({ title: ["Can't be blank"] })
  end
end

get "/api/v1/books" do
  status 200
  json(parsed_books_json_data)
end
