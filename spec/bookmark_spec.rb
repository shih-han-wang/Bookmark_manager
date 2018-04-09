require 'bookmark'

describe Bookmark do

  it 'Should initialize an array' do
    expect(subject.list).to eq []
  end

  describe '#all' do
    it 'Should return the list array' do
      expect(subject.all).to eq []
    end
  end

end
