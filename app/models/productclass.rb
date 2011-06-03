class Productclass < ActiveRecord::Base
  
  validates_presence_of :name
 
  acts_as_tree :order => "position"
  acts_as_list :scope => :parent_id

  has_many :products
  
  
  def picture_field= (fileobj)
#    if fileobj.size > 0
#      @image_file = fileobj
#      self.image_url = fileobj.original_filename
#    end
  end   
end
