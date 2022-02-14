
describe Bookmark do
  describe '#all method' do
    it 'tests all method exists and returns an Array' do
      expect(Bookmark.all).to be_instance_of Array
    end
  end
end
