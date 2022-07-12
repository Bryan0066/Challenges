

class Album 

    attr_reader :name, :songs
    attr_accessor :description 

    def initialize(name, description = "Placeholder")
      @name = name
      @songs = []
      @description = description
    end

    # def description(new_description)
        # @description = new_description
    # end

    def add_track (song_object)
        @songs.push(song_object)
    end

    def like_all_songs
      @songs.each do |song|
        song.like
      end
    end

end
