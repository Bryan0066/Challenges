class Song

    attr_reader :title, :duration

    def initialize(title, duration, genre)
      @title = title
      @duration = duration
      @genre = genre
      @like_status = false
    end

    def like 
        @like_status = true
      return "You have liked #{@title}"
    end

end
