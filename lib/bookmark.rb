require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id  = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec("SELECT * FROM bookmarks;")
    # result.map { |thingamy| thingamy['url'] }
    result.map do |thangamy|
      Bookmark.new(id: thangamy['id'], title: thangamy['title'], url: thangamy['url'])
    end
  end


  def self.add_bookmark(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    # connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');")
    # TODO just make sure I understand the RETURNING...
    # I think it's there because otherwise it would just insert into the table without any feedback
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")

  end  

end
