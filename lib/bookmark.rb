require 'pg'

class Bookmark
  attr_reader :title, :url

  def self.all
    if ENV['ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| Bookmark.new(bookmark['title'], bookmark['url']) }
  end

  def self.create(title, url)
    if ENV['ENV'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("INSERT INTO bookmarks (title, url)
      VALUES('#{title}', '#{url}');"
    )
  end

  def initialize(title, url)
    @title = title
    @url = url
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
