require 'pg'
require 'uri'

class Bookmark

  attr_accessor :title, :url

  def initialize(options)
    @title = options[:title]
    @url = options[:url]
  end

  def self.create(options)

    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'shihhanwang'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'shihhanwang'
    end

    return false unless options[:url] =~ URI::regexp

    @bookmark = Bookmark.new(options)

    con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{@bookmark.url}', '#{@bookmark.title}')"

  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'shihhanwang'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'shihhanwang'
    end

    rs = con.exec 'SELECT * FROM bookmarks'
    rs.map{|bookmark| bookmark['url']}

  end

  def self.instance
    @bookmark
  end

end
