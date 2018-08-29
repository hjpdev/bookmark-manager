require 'pg'

feature 'View bookmarks' do
  scenario 'viewing bookmarks' do
    Bookmark.create(url: 'http://www.google.com')
    Bookmark.create(url: 'http://www.google.co.uk')
    Bookmark.create(url: 'http://www.google.co')

    visit('/bookmarks')
    expect(page).to have_content('google.com')
    expect(page).to have_content('google.co.uk')
    expect(page).to have_content('google.co')
  end
end
