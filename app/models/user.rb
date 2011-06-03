class User < ActiveRecord::Base

  validates_presence_of :login, :email
  
  acts_as_authentic
  
#  acts_as_authentic do |c|
#    c.consecutive_failed_logins_limit = 5       #To help protect from brute force attacks you can set a limit on the allowed number of consecutive failed logins. 
#    c.consecutive_failed_logins_limit = 2       #Once the failed logins limit has been exceed, how long do you want to ban the user? This can be a temporary or permanent ban. 
##
#
#
#  end                                          # the configuration block is optional
  
end


