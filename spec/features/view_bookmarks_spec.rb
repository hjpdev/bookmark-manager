require 'pg'

feature 'View bookmarks' do
  scenario 'viewing bookmarks' do
    Bookmark.create(title: 'Google1', url: 'http://www.google.com')
    Bookmark.create(title: 'Google2', url: 'http://www.google.co.uk')
    Bookmark.create(title: 'Google3', url: 'http://www.google.co')

    visit('/bookmarks')
    expect(page).to have_link('Google1', href: 'http://www.google.com')
    expect(page).to have_link('Google2', href: 'http://www.google.co.uk')
    expect(page).to have_link('Google3', href: 'http://www.google.co')
  end
end
