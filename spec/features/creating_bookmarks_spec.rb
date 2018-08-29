feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to the bookmark manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://testbookmark.com')
    click_button('Submit')
    expect(page).to have_content('http://testbookmark.com')
  end

  scenario 'The bookmark must have a valid url' do
    visit('/bookmarks/new')
    fill_in('url', with: 'notarealurl')
    click_button('Submit')
    expect(page).not_to have_content('notarealurl')
    expect(page).to have_content('Invalid URL')
  end
end
