require 'bookmark'

describe Bookmark do

  # it 'Should initialize an array' do
  #   expect(subject.list).to eq []
  # end

  describe '#self.all' do
    it 'Should return the hardcoded bookmark array' do
      Bookmark.create(url: 'http://makersacademy.com')
      Bookmark.create(url: 'http://google.com')
      Bookmark.create(url: 'http://destroyallsoftware.com')
      expect(Bookmark.all).to include 'http://makersacademy.com'
      expect(Bookmark.all).to include 'http://google.com'
      expect(Bookmark.all).to include 'http://destroyallsoftware.com'
    end
  end

  describe '#self.create' do
    it 'Should create a new bookmark into bookmarks table' do
      Bookmark.create(url: 'this is testing')
      expect(Bookmark.all).to include 'this is testing'
    end
  end

end
