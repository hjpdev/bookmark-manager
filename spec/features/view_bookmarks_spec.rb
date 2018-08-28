feature "View bookmarks" do
  scenario "Test" do
    visit('/')
    expect(page).to have_content("Hello!")
  end

  scenario 'viewing bookmarks' do
    visit('/')
    click_button('View all')
    expect(page).to have_content('google.com')
    expect(page).to have_content('google.co.uk')
    expect(page).to have_content('google.co')
  end 
end
