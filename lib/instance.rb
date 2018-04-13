module Instance

  def self.create(options)
    con = Database::connect

    row = con.exec "SELECT * from bookmarks where url = '#{options[:url]}'"

    array = row.to_a
    
    Bookmark.new(title: options[:title], url: options[:url], id: array[0]["id"])

  end

end
