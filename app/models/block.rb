class Block < ActiveRecord::Base
  
  POSITION = ["links", "rechts"];
  validates_presence_of :name, :position, :fieldorder, :blockid
  
end
