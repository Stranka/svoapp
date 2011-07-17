class Product < ActiveRecord::Base

  has_attached_file :image,
                    :url  => "/images/:class/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/images/:class/:id/:style_:basename.:extension",
                    :default_style => :description,
	                  :styles => {
	                    :description => '250x250>',
	                    :content => '600x600>',
	                    :thumb => '50x50',
	                    :small => '100x100>' }

  has_attached_file :sheet,
                    :url  => "/images/:class/:id/:basename.:extension",
                    :path => ":rails_root/public/images/:class/:id/:basename.:extension",
                    :styles => { :preview => { :geometry => '85',  :format => :png } }


	validates_attachment_size :image, :less_than=> 2.megabytes
	validates_attachment_size :sheet, :less_than=> 2.megabytes

  validates_presence_of :shorttext, :productclass_id, :price, :tax_percentage, :image

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

