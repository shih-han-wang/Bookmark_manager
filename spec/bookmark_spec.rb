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
      expect(Bookmark.all.to_s).to include "<a href = http://makersacademy.com>Makers Academy</a>"
      expect(Bookmark.all.to_s).to include "<a href = http://google.com>Google</a>"
      expect(Bookmark.all.to_s).to include "<a href = http://destroyallsoftware.com>Destroy All Software</a>"
    end
  end

  describe '#self.create' do
    it 'Should create a new bookmark into bookmarks table if the url is valid' do
      Bookmark.create(url: 'http://facebook.com', title: 'Facebook')
      expect(Bookmark.all.to_s).to include "<a href = http://facebook.com>Facebook</a>"
    end

    it 'Should raise error if the url is valid' do
      expect(Bookmark.create(url: 'this is not a valid url') ).to eq false
    end

    it 'Should return the title of the bookmark' do

      Bookmark.create(url: 'http://apple.com', title: 'Apple')
      expect(Bookmark.instance.title).to eq 'Apple'
    end
  end

  describe '#self.instance' do

    it 'Should return the URL of the bookmark' do

      Bookmark.create(url: 'http://lynda.com', title: 'Lynde')
      expect(Bookmark.instance.url).to eq 'http://lynda.com'
    end
  end

  describe '#self.delete' do

    it 'Should let user be able to delete the bookmark' do
      Bookmark.create(url: 'http://wikipedia.com', title: 'Wikipedia')
      Bookmark.delete(url: 'http://wikipedia.com')
      expect(Bookmark.all.to_s).not_to include "<a href = http://wikipedia.com>Wikipedia</a>"
    end
  end

end
