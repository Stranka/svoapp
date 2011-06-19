class Deliveryaddress < ActiveRecord::Base
  
  set_table_name 'addresses'
  belongs_to :user
  belongs_to :customer
  validates_presence_of :street, :zipcode, :city, :country
  accepts_nested_attributes_for :user
  accepts_nested_attributes_for :customer

#  default_scope :conditions => {:address_type => "Lieferadresse"}  
    
end
