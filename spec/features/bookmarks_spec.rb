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
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/')
    expect(page).to have_content 'Welcome to the Bookmark Challenge'
    expect(page).to have_content 'Bookmark List'
    expect(Bookmark.all).to include('http://www.google.com')
  end

  scenario 'test to add a bookmark to the list' do
    # set connection to the test database
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Use the Bookmark's functionality to insert new url's 
    Bookmark.add_bookmark("http://www.makersacademy.com")
    Bookmark.add_bookmark("http://www.destroyallsoftware.com")
    Bookmark.add_bookmark("http://www.google.com")
  
    visit('/')
    expect(page).to have_content 'Welcome to the Bookmark Challenge'
    expect(page).to have_content 'Bookmark List'
    expect(Bookmark.all).to include('http://www.google.com')

    # find_field('options').choose('Add')
    # # visit('/add')
    # fill_in 'url', with: 'https://thoughtbot.com/upcase/test-driven-rails-resources/capybara.pdf'
    # click_on 'Submit'
    # Bookmark.add_bookmark('https://thoughtbot.com/upcase/test-driven-rails-resources/capybara.pdf')
    # expect(page).to have_content 'Welcome to the Bookmark Challenge'
    # expect(page).to have_content 'Bookmark List'
    # expect(Bookmark.all).to include('https://thoughtbot.com/upcase/test-driven-rails-resources/capybara.pdf')
  end
end
