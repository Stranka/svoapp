class Article < ActiveRecord::Base
  
  validates_presence_of :name, :content, :format
  
  FORMAT = ["textile", "raw"];
   
end
