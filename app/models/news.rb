class News < ActiveRecord::Base

  FORMAT = ["textile", "raw"];
  validates_presence_of :title, :notice, :date
end

