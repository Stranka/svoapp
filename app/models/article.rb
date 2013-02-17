class Article < ActiveRecord::Base

  validates_presence_of :name, :content

  FORMAT = ["textile", "raw"];
  USAGE = ["static page", "blog"]

  def parseinternallinks
    self.content.sub!(/\[\[(.+?)\]\]/) { |i| '<a href="/articles/'+URI.escape($1)+'/permalink">'+$1+'</a>'}
  end
end

