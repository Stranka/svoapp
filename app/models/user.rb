class User < ActiveRecord::Base
  
  acts_as_authentic
  
#  acts_as_authentic do |c|
#    c.consecutive_failed_logins_limit = 5       #To help protect from brute force attacks you can set a limit on the allowed number of consecutive failed logins. 
#    c.consecutive_failed_logins_limit = 2       #Once the failed logins limit has been exceed, how long do you want to ban the user? This can be a temporary or permanent ban. 
##
#
#
#  end                                          # the configuration block is optional

  has_one :billingaddress, :dependent => :destroy, :conditions => {:address_type => "Rechnungsadresse"}
  has_one :deliveryaddress, :dependent => :destroy, :conditions => {:address_type => "Lieferadresse"}
#  has_many :baskets, :dependent => :destroy
  accepts_nested_attributes_for :billingaddress
  accepts_nested_attributes_for :deliveryaddress, :reject_if => proc { |attributes| attributes['street'].blank? }
#  accepts_nested_attributes_for :deliveryaddress

  validates_presence_of :login, :firstname, :lastname, :email

# ==== Values
# Possible titles are: 
# * "Frau": Mrs.
# * "Frau Dr.": PhD, Mrs.
# * "Herr": Mr.
# * "Herr Dr.": PhD, Mr.
# To be continued ...
  TITLES = ["Frau", "Frau Dr.", "Herr", "Herr Dr."];   


end


