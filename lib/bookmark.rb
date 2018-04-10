require 'pg'

# begin
#
#     con = PG.connect :dbname => 'bookmark_manager', :user => 'shihhanwang'
#
#     rs = con.exec 'SELECT * FROM bookmarks'
#
#     puts rs.nfields
#     puts rs.fields
#
#     rs.each do |row|
#       puts row['url']
#     end
#
# rescue PG::Error => e
#
#     puts e.message
#
# ensure
#
#     con.close if con
#
# end


class Bookmark

  attr_accessor :list

  def initialize
    @list = []
  end

  def self.all
    # begin
      con = PG.connect :dbname => 'bookmark_manager', :user => 'shihhanwang'
      rs = con.exec 'SELECT * FROM bookmarks'
      # puts rs.nfields
      # puts rs.fields
      rs.map{|bookmark| bookmark['url']}
    # rescue PG::Error => e
    #   puts e.message
    # ensure
    #   con.close if con
    # end
  end

end
