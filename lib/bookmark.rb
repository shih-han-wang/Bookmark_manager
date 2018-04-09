class Bookmark

  attr_accessor :list

  def initialize
    @list = []
  end

  def self.all
    ["www.google.co.uk",
    "www.speedhunters.com",
    "www.facebook.com"]
  end

end
