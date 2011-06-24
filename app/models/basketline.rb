class Basketline < ActiveRecord::Base

  belongs_to :basket
  belongs_to :product
  validates_presence_of :product_id, :quantity, :value, :price

  accepts_nested_attributes_for :basket

end

