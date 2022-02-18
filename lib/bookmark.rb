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
    # connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")

    # CHANGES for STEP 12 - I do not understand THE WHY on this actually
    connection.exec_params(
      "INSERT INTO bookmarks (url, title) VALUES ($1, $2) RETURNING id, url, title;",
      [url, title])
    # Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])  
  end  


  def self.delete(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    p 'BEFORE LINE 55 in class'
    p "#{id}"
    this_id = id.to_i
    p this_id
    connection.exec_params(
      "DELETE FROM bookmarks WHERE id = $1", 
      [id])
  end  

end
