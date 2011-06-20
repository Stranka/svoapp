class Basket < ActiveRecord::Base

  validates_presence_of :session_id

  has_many :basketlines, :dependent => :destroy

  accepts_nested_attributes_for :basketlines
end

