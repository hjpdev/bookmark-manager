require 'pg'
require 'uri'
require 'sinatra/flash'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    return nil if is_url?(url) == false
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end

  private
  def self.is_url?(url)
    !!(url =~ /\A#{URI::regexp}\z/)
  end
end
