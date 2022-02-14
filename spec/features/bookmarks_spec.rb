feature 'Bookmark testing' do
  scenario 'show the list of bookmarks' do
    visit('/list')
    expect(page).to have_content 'Welcome to the Bookmark Challenge'
    expect(page).to have_content 'Bookmark List'
  end
end
