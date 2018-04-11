require 'pg'
require 'uri'

class Bookmark

  attr_accessor :title, :url
  attr_reader :duplicate

  def initialize(options)
    @title = options[:title]
    @url = options[:url]

  end

  def self.create(options)

    @duplicate = false

    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'shihhanwang'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'shihhanwang'
    end

    rows = con.exec "SELECT * from bookmarks"

    if rows.column_values(1).include?(options[:url])

      con.exec "UPDATE bookmarks SET title = '#{options[:title].rstrip!}' WHERE url = '#{options[:url]}';"
      @duplicate = true

    else

      return false unless options[:url] =~ URI::regexp

      @bookmark = Bookmark.new(options)

      con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{@bookmark.url}', '#{@bookmark.title}')"

    end

  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'shihhanwang'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'shihhanwang'
    end

    rs = con.exec 'SELECT * FROM bookmarks'
    rs.map{|bookmark| "<a href = #{bookmark['url']}>#{bookmark['title']}</a><input type=submit name=delete value='Delete #{bookmark['title']}'>" }

  end

  def self.duplicate
    @duplicate
  end

  def self.instance
    @bookmark
  end

  def self.delete(options)

    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'shihhanwang'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'shihhanwang'
    end


    con.exec "DELETE FROM bookmarks WHERE title='#{options}';"

  end

end
