class Article < ActiveRecord::Base

  validates_presence_of :name, :content, :format

  FORMAT = ["textile", "raw"];

  def parseinternallinks
    self.content.sub!(/\[\[(.+?)\]\]/) { |i| '<a href="/articles/'+URI.escape($1)+'/permalink">'+$1+'</a>'}
  end
end

