class Article

  attr_reader :title, :url, :description

  def initialize(title, url, description)
    @title = title
    @url = url
    @description = description
  end

  # The `db_connection` method is already defined in server.rb giving you access to it here without needing a require statement

  def self.all
    articles = db_connection { |conn| conn.exec("SELECT * FROM articles")}

    return articles
  end

  def self.create(title,url,description)
    
    new_article = db_connection {|conn| conn.exec("INSERT INTO articles ( title, url, description) VALUES('#{title}','#{url}','#{description}')")} 
    
    return new_article
    # - utility class method AND alternate constructor: creates a new article record in our database
    # - accepts the parameters needed for a new Article record (this should come in from your form)
    # - uses an INSERT statement to create a new article record
    # - should return the newly persisted article object
  end

  # Non-Core
  def self.find(id)

    find_article = db_connection {|conn| conn.exec("SELECT * FROM articles WHERE (articles.id = #{id})")}
    return find_article
    # - this is an alternative constructor class method
    # - accepts an id as an argument
    # - uses a SELECT statement with a WHERE clause
    # - should returns a single article object whose id matches the given id
  end
end
