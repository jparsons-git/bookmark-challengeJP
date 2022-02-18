
describe Bookmark do

  describe '#all method' do
    it 'tests all method exists and returns an Array' do
      expect(Bookmark.all).to be_instance_of Array
    end

    it 'returns all bookmarks' do
      Bookmark.add_bookmark('http://www.makersacademy.com','makers')
      Bookmark.add_bookmark('http://www.destroyallsoftware.com','destroy')
      Bookmark.add_bookmark('http://www.google.com','google')

      bookmarks = Bookmark.all

      this_bookmark = bookmarks.first
      
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq this_bookmark.id
      expect(bookmarks.first.title).to eq 'makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end 

  end

  describe '#add bookmark method' do
    it 'tests add a new bookmark' do
      bookmark = Bookmark.add_bookmark('http://www.example.org', 'Example').first
      expect(bookmark['title']).to eq 'Example'
    end
  end

  describe '#delete bookmark method' do
    it 'tests delete a bookmark' do
      Bookmark.add_bookmark('http://www.example.org', 'Example')
      Bookmark.add_bookmark('http://www.google.com','google')
      this_bookmark = Bookmark.all.first
      expect(Bookmark.all.length).to eq 2
      Bookmark.delete(this_bookmark.id)
      expect(Bookmark.all.length).to eq 1
    end
  end

end
