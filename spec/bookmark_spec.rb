require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      Bookmark.create(title: 'Google1', url: 'http://www.google.com')
      Bookmark.create(title: 'Google2', url: 'http://www.google.co.uk')
      Bookmark.create(title: 'Google3', url: 'http://www.google.co')

      bookmarks = Bookmark.all
      bookmark = Bookmark.all.first
  
      expect(bookmarks.length).to eq 3
      expect(bookmark).to be_a(Bookmark)
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq('Google1')
      expect(bookmark.url).to eq('http://www.google.com')
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(title: 'Test Bookmark', url: 'http://www.testbookmark.com')
      expect(bookmark).to be_a(Bookmark)
      expect(bookmark).to respond_to(:id)
      expect(bookmark.title).to eq 'Test Bookmark'
    end

    it 'does not add an invalid url' do
      bookmark = Bookmark.create(title: 'Not Real', url: 'notarealbookmark')
      expect(bookmark).not_to be_a(Bookmark)
    end
  end
end
