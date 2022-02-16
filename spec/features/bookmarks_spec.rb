require 'pg'

feature 'Bookmark testing' do
  scenario 'show the list of bookmarks' do
    visit('/')
    expect(page).to have_content 'Welcome to the Bookmark Challenge'
    expect(page).to have_content 'Bookmark List'
  end

  scenario 'show the list of bookmarks' do
    # set connection to the test database
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data into table bookmarks
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.makersacademy.com', 'Makers Academy');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.destroyallsoftware.com', 'Destroy Software');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")
    # TODO I DON'T UNDERSTAND the url: and title: below??? It doesn't seem to work for me
    # connection.exec("INSERT INTO bookmarks VALUES(url: 'http://www.makersacademy.com', title: 'Makers Academy');")
    # connection.exec("INSERT INTO bookmarks VALUES(url: 'http://www.destroyallsoftware.com', title: 'Destroy Software');")
    # connection.exec("INSERT INTO bookmarks VALUES(url: 'http://www.google.com', title: 'Google');")

    visit('/')
    expect(page).to have_content 'Welcome to the Bookmark Challenge'
    expect(page).to have_content 'Bookmark List'
    expect(page).to have_content 'Google'
  end

  scenario 'test to add a bookmark to the list' do
    # set connection to the test database
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Use the Bookmark's functionality to insert new url's 
    Bookmark.add_bookmark("http://www.makersacademy.com", "Makers Academy")
    Bookmark.add_bookmark("http://www.destroyallsoftware.com", "Destroy Software")
    Bookmark.add_bookmark("http://www.google.com", "Google")
  
    visit('/')
    expect(page).to have_content 'Welcome to the Bookmark Challenge'
    expect(page).to have_content 'Bookmark List'
    expect(page).to have_content 'Makers Academy'
  end
end
