require 'bookmark'

describe Bookmark do
  it 'initializes with url and title' do
    bookmark = Bookmark.new('bookmark.com', 'Bookmark 1')
    expect(bookmark.title).to eq 'Bookmark 1'
    expect(bookmark.url).to eq 'bookmark.com'
  end

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url)
        VALUES('http://www.makersacademy.com'),
        ('http://www.google.com');"
      )
      bookmarks = Bookmark.all
      expect(bookmarks[0].url).to eq('http://www.makersacademy.com')
      expect(bookmarks[1].url).to eq('http://www.google.com')
    end
  end

  describe '.create' do
    it 'should add a new bookmark to database' do
      Bookmark.create('http://www.makersacademy.com', 'Makers Academy')
      bookmarks = Bookmark.all
      expect(bookmarks[0].url).to eq('http://www.makersacademy.com')
    end
  end


end
