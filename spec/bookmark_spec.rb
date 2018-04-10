require 'bookmark'

describe Bookmark do

  it 'Should initialize an array' do
    expect(subject.list).to eq []
  end

  describe '#self.all' do
    it 'Should return the hardcoded bookmark array' do
      expect(Bookmark.all).to eq ["http://makersacademy.com", "http://google.com", "http://destroyallsoftware.com"]
    end
  end

end
