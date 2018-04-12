module Database

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect :dbname => 'bookmark_manager_test', :user => 'shihhanwang'
    else
      PG.connect :dbname => 'bookmark_manager', :user => 'shihhanwang'
    end
  end

end
