require 'pg'

feature 'Bookmark testing' do
  scenario 'show the list of bookmarks' do
    visit('/list')
    expect(page).to have_content 'Welcome to the Bookmark Challenge'
    expect(page).to have_content 'Bookmark List'
  end

  scenario 'show the list of bookmarks' do
    # set connection to the test database
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data into table bookmarks
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/list')
    expect(page).to have_content 'Welcome to the Bookmark Challenge'
    expect(page).to have_content 'Bookmark List'
    expect(Bookmark.all).to include('http://www.google.com')
  end
end
