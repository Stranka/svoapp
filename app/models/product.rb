class Product < ActiveRecord::Base

  validates_presence_of :shorttext, :price, :tax_percentage

  belongs_to :productclass
  has_many :basketlines

  def specification_sheet_file= (fileobj)
#    if fileobj.size > 0
#      @image_file = fileobj
#      self.image_url = fileobj.original_filename
#    end
  end

  def image_file= (fileobj)
#    if fileobj.size > 0
#      @image_file = fileobj
#      self.image_url = fileobj.original_filename
#    end
  end
end

