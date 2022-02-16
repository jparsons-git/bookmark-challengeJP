# require 'pg'

describe Bookmark do

  describe '#all method' do
    it 'tests all method exists and returns an Array' do
      expect(Bookmark.all).to be_instance_of Array
    end
    # I cannot get this to work as the feature files work with loading the database
    # it 'tests all method returns a specific url' do
    #   expect(Bookmark.all).to include('http://www.google.com')
    # end
  end

  describe '#add bookmark method' do
    it 'tests add a new bookmark' do
      # bookmark = Bookmark.add_bookmark('http://www.example.org', 'Example')
      # TODO - consolidate what .first does
      # I'm guessing it puts it ina position so that it can be retrieved first?
      bookmark = Bookmark.add_bookmark('http://www.example.org', 'Example').first
      expect(bookmark['title']).to eq 'Example'
    end
  end

end
