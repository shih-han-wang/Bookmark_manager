require 'pg'
require 'uri'
require_relative './database.rb'


class Bookmark

  attr_accessor :title, :url, :id
  attr_reader :duplicate

  def initialize(options)
    @title = options[:title]
    @url = options[:url]
    @id = options[:id]
  end

  def self.create(options)

    con = Database::connect
    rows = con.exec "SELECT * from bookmarks"

    if rows.column_values(1).include?(options[:url])
      con.exec "UPDATE bookmarks SET title = '#{options[:title]}' WHERE url = '#{options[:url]}';"
      @duplicate = true
    else
      @duplicate = false
      return false unless options[:url] =~ URI::regexp
      con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{options[:url]}', '#{options[:title]}')"
    end

  end

  def self.all
    con = Database::connect
    con.exec('SELECT * FROM bookmarks').map do |bookmark| Bookmark.new(title: bookmark['title'], url: bookmark['url'], id: bookmark['url'])
    end
  end

  def self.duplicate
    @duplicate == true
  end

  def self.delete(options)
    con = Database::connect
    con.exec "DELETE FROM bookmarks WHERE title='#{options}';"
  end

end
