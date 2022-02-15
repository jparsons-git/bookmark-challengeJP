
require 'pg'

class Bookmark

  def self.all

    connection = PG.connect(dbname: 'bookmark_manager')
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |thingamy| thingamy['url'] }

    # [
    #   "https://docs.google.com/document/d/19wuJ3oKobED28AehkqsHHqtCI-p-_HCs/edit",
    #   "https://docs.google.com/document/d/1W5xKXbCuYiEpGtpP5oMcEpuTbZ5IZVvNcgD2pdygnm8/edit",
    #   "https://docs.google.com/document/d/13R5HO6XMndu-5PgNoCDsI_fPwEZBEOi6/edit"
    # ]
  end
end
