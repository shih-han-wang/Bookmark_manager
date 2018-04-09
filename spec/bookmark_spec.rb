require 'bookmark'

describe Bookmark do

  it 'Should initialize an array' do
    expect(subject.list).to eq []
  end

  describe '#self.all' do
    it 'Should return the hardcoded bookmark array' do
      expect(Bookmark.all).to eq ["www.google.co.uk", "www.speedhunters.com", "www.facebook.com"]
    end
  end

end
