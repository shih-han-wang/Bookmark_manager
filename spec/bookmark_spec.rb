require 'bookmark'

describe Bookmark do

  # it 'Should initialize an array' do
  #   expect(subject.list).to eq []
  # end

  describe '#self.all' do
    it 'Should return the hardcoded bookmark array' do
      Bookmark.create(url: 'http://makersacademy.com', title: 'Makers Academy')
      Bookmark.create(url: 'http://google.com', title: 'Google')
      Bookmark.create(url: 'http://destroyallsoftware.com', title: 'Destroy All Software')
      expect(Bookmark.all).to include 'Makers Academy'
      expect(Bookmark.all).to include 'Google'
      expect(Bookmark.all).to include 'Destroy All Software'
    end
  end

  describe '#self.create' do
    it 'Should create a new bookmark into bookmarks table if the url is valid' do
      Bookmark.create(url: 'http://facebook.com', title: 'Facebook')
      expect(Bookmark.all).to include 'Facebook'
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
