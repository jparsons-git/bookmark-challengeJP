class Bookmark
  # attr_accessor :url
  # attr_accessor :bookmarks

  # def initialize(url = "")
  #   @url = url

  # end

  # def all
  #   @bookmarks = [Bookmark.new("https://docs.google.com/document/d/19wuJ3oKobED28AehkqsHHqtCI-p-_HCs/edit"),
  #            Bookmark.new("https://docs.google.com/document/d/1W5xKXbCuYiEpGtpP5oMcEpuTbZ5IZVvNcgD2pdygnm8/edit"),
  #            Bookmark.new("https://docs.google.com/document/d/13R5HO6XMndu-5PgNoCDsI_fPwEZBEOi6/edit")]
  #   return @bookmarks
  # end

  def self.all
    [
      "https://docs.google.com/document/d/19wuJ3oKobED28AehkqsHHqtCI-p-_HCs/edit",
      "https://docs.google.com/document/d/1W5xKXbCuYiEpGtpP5oMcEpuTbZ5IZVvNcgD2pdygnm8/edit",
      "https://docs.google.com/document/d/13R5HO6XMndu-5PgNoCDsI_fPwEZBEOi6/edit"
    ]
  end
end
