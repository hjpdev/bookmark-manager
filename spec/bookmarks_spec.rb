require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns a list of all bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include('google.com')
      expect(bookmarks).to include('google.co.uk')
      expect(bookmarks).to include('google.co')
    end
  end
end
