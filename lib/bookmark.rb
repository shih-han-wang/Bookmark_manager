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

    rows = con.exec "SELECT * from bookmarks"





    if rows.column_values(1).include?(options[:url])

      con.exec "UPDATE bookmarks SET title = '#{options[:title]}' WHERE url = '#{options[:url]}';"

    else

      return false unless options[:url] =~ URI::regexp

      @bookmark = Bookmark.new(options)

      con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{@bookmark.url}', '#{@bookmark.title}')"

    end












    # return false unless options[:url] =~ URI::regexp
    #
    # @bookmark = Bookmark.new(options)
    #
    # con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{@bookmark.url}', '#{@bookmark.title}')"

  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'shihhanwang'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'shihhanwang'
    end

    rs = con.exec 'SELECT * FROM bookmarks'
    rs.map{|bookmark| bookmark['title']}

  end

  def self.instance
    @bookmark
  end

end
