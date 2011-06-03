class Menue < ActiveRecord::Base
  
  validates_presence_of :name
  
  acts_as_tree :order => "position"
  acts_as_list :scope => :parent_id
    
end
