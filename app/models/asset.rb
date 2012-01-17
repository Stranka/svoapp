class Asset < ActiveRecord::Base

  belongs_to :product

  has_attached_file :image,
                    :url  => "/images/:class/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/images/:class/:id/:style_:basename.:extension",
                    :default_style => :description,
	                  :styles => {
	                    :description => '250x250>',
	                    :content => '600x600>',
	                    :thumb => '50x50',
	                    :small => '100x100>' }

end

