require 'pg'
require 'uri'

class Bookmark

  # attr_accessor :list
  #
  # def initialize
  #   @list = []
  # end

  def self.create(options)

    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'shihhanwang'
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => 'shihhanwang'
    end

    return false unless options[:url] =~ URI::regexp

    con.exec "INSERT INTO bookmarks (url) VALUES ('#{options[:url]}')"

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

end
