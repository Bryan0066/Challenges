require 'sinatra'
require 'pry'
require_relative 'config/application'
require "./app/models/song"

set :bind, '0.0.0.0'  # bind to all interfaces

enable :sessions

helpers do
  def seconds_to_time(sec)
    sec = sec.to_i
    minutes = sec / 60
    seconds = sec % 60
    "#{minutes}:#{seconds.to_s.rjust(2, '0')}"
  end
end

get "/" do
  redirect to("/songs")
end

get "/songs" do
  @songs = Song.all
  erb :songs
end
