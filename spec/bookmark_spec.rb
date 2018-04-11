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
    it 'Should create a new bookmark into bookmarks table if the url is valid' do
      Bookmark.create(url: 'http://facebook.com')
      expect(Bookmark.all).to include 'http://facebook.com'
    end

    it 'Should raise error if the url is valid' do
      expect(Bookmark.create(url: 'this is not a valid url') ).to eq false
    end

    it 'Should return the title of the bookmark' do

      Bookmark.create(url: 'http://facebook.com', title: 'Facebook')
      expect(Bookmark.instance.title).to eq 'Facebook'
    end
  end

end
