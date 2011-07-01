class Basket < ActiveRecord::Base

  validates_presence_of :session_id, :customer_id

  has_many :basketlines, :dependent => :destroy
  belongs_to :customer

  accepts_nested_attributes_for :basketlines
  accepts_nested_attributes_for :customer
end

