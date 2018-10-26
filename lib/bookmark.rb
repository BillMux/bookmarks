require 'pg'

class Bookmark
  attr_reader :url, :title

  def self.all
    if ENV['ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| Bookmark.new(bookmark['url'], bookmark['title']) }
  end

  def self.create(url, title)
    if ENV['ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (url, title)
      VALUES('#{url}', '#{title}');"
    )
  end

  def initialize(url, title)
    @url = url
    @title = title
  end

  private

  def connect_to_db
    if ENV['ENV'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end
end
