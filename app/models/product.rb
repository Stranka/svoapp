class Product < ActiveRecord::Base

  has_attached_file :sheet,
                    :url  => "/images/:class/:id/:basename.:extension",
                    :path => ":rails_root/public/images/:class/:id/:basename.:extension",
                    :styles => { :preview => { :geometry => '85',  :format => :png } }

  attr_accessor :delete_sheet
  before_validation { sheet.clear if delete_sheet == '1' }


	validates_attachment_size :image, :less_than=> 2.megabytes
	validates_attachment_size :sheet, :less_than=> 2.megabytes

  validates_presence_of :shorttext, :productclass_id, :price, :tax_percentage

  belongs_to :productclass
  has_many :basketlines

  has_many :assets, :dependent => :destroy
  accepts_nested_attributes_for :assets, :allow_destroy => true

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

