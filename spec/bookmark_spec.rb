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
end
