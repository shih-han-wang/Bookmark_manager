require 'pg'
require 'uri'
require_relative './database.rb'

class Bookmark

  attr_accessor :title, :url
  attr_reader :duplicate

  def initialize(options)
    @title = options[:title]
    @url = options[:url]
  end

  def self.create(options)

    con = Database::connect
    rows = con.exec "SELECT * from bookmarks"

    if rows.column_values(1).include?(options[:url])

      con.exec "UPDATE bookmarks SET title = '#{options[:title]}' WHERE url = '#{options[:url]}';"
      @duplicate = true

    else

      return false unless options[:url] =~ URI::regexp

      @bookmark = Bookmark.new(options)

      con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{@bookmark.url}', '#{@bookmark.title}')"

    end

  end

  def self.all

    con = Database::connect
    rs = con.exec 'SELECT * FROM bookmarks'
    rs.map{|bookmark| "<a href = #{bookmark['url']}>#{bookmark['title']}</a><input type=submit name=delete value='Delete #{bookmark['title']}'>" }

  end

  def self.duplicate
    @duplicate == true
  end

  def self.instance
    @bookmark
  end

  def self.delete(options)
    con = Database::connect
    con.exec "DELETE FROM bookmarks WHERE title='#{options}';"
  end

end
