feature "View bookmarks" do
  scenario "Test" do
    visi('/')
    expect(page).to have_content("Hello!")
  end
end
