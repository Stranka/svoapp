class Basketline < ActiveRecord::Base

  belongs_to :basket

  validates_presence_of :product_id, :quantity, :value, :price

  accepts_nested_attributes_for :basket

end

