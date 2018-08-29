require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.co.uk');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.co');")

      bookmarks = Bookmark.all
  
      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.google.co.uk')
      expect(bookmarks).to include('http://www.google.co')
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.testbookmark.com')
      expect(Bookmark.all).to include('http://www.testbookmark.com')
    end

    it 'does not add an invalid url' do
      Bookmark.create(url: 'notarealbookmark')
      expect(Bookmark.all).not_to include('notarealbookmark')
    end
  end
end
