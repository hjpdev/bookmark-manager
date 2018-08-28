feature 'View bookmarks' do
  scenario 'viewing bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content('google.com')
    expect(page).to have_content('google.co.uk')
    expect(page).to have_content('google.co')
  end
end
