require 'pg'
require 'uri'
require 'sinatra/flash'

class Bookmark
  attr_reader :id, :title, :url
  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all
    connection = env_check
    bookmarks = connection.exec("SELECT * FROM bookmarks;")
    bookmarks.map do |b| 
      Bookmark.new(
        id: b['id'], 
        title: b['title'], 
        url: b['url']
        )
    end
  end

  def self.create(title:, url:)
    return false unless is_url?(url)
    connection = env_check
    result = connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, title, url;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  private
  def self.is_url?(url)
    !!(url =~ /\A#{URI::regexp}\z/)
  end

  def self.env_check
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
  end
end
