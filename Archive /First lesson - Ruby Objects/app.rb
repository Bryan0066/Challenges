require "pry"

require_relative "Song"
require_relative "Album"

song_one = Song.new("The Wonderful Wall - Pank Fllood","4:00","Rock")
song_two = Song.new("the ugly awning - Pank Fllood","3:00","Rock")

album_one = Album.new("The Experiement")

album_one.add_track(song_one)
album_one.add_track(song_two)




binding.pry
